#!/usr/bin/env node
"use strict";

// Small dependency-free Chrome DevTools Protocol helper used when the desktop
// browser-control service is unavailable. Values that may contain credentials
// or session tokens are accepted only through environment variables.

const port = Number(process.env.CDP_PORT || 9229);
const mode = process.argv[2] || "inspect";

async function json(url, options) {
  const response = await fetch(url, options);
  if (!response.ok) {
    throw new Error(`${response.status} ${response.statusText}: ${url}`);
  }
  return response.json();
}

async function targetPage() {
  const pages = await json(`http://127.0.0.1:${port}/json/list`);
  const requestedId = process.env.CDP_TARGET_ID;
  const page = pages.find((item) => item.type === "page" && item.id === requestedId)
    || pages.find((item) => item.type === "page" && /^https:\/\/erp\.infomatics\.in:/i.test(item.url || ""))
    || pages.find((item) => item.type === "page" && item.url === "about:blank")
    || pages.find((item) => item.type === "page");
  if (!page) throw new Error("No Chrome page target is available");
  return page;
}

function connect(webSocketDebuggerUrl) {
  const ws = new WebSocket(webSocketDebuggerUrl);
  let sequence = 0;
  const pending = new Map();
  const listeners = new Map();

  ws.addEventListener("message", (event) => {
    const message = JSON.parse(event.data);
    if (message.id) {
      const waiter = pending.get(message.id);
      if (!waiter) return;
      pending.delete(message.id);
      if (message.error) waiter.reject(new Error(JSON.stringify(message.error)));
      else waiter.resolve(message.result);
      return;
    }
    const callbacks = listeners.get(message.method) || [];
    callbacks.splice(0).forEach((callback) => callback(message.params));
  });

  function command(method, params = {}) {
    const id = ++sequence;
    return new Promise((resolve, reject) => {
      pending.set(id, { resolve, reject });
      ws.send(JSON.stringify({ id, method, params }));
    });
  }

  function once(method, timeoutMs = 30000) {
    return new Promise((resolve, reject) => {
      const timer = setTimeout(() => reject(new Error(`Timed out waiting for ${method}`)), timeoutMs);
      const callbacks = listeners.get(method) || [];
      callbacks.push((params) => {
        clearTimeout(timer);
        resolve(params);
      });
      listeners.set(method, callbacks);
    });
  }

  return new Promise((resolve, reject) => {
    ws.addEventListener("open", () => resolve({ ws, command, once }), { once: true });
    ws.addEventListener("error", reject, { once: true });
  });
}

async function evaluate(client, expression) {
  const result = await client.command("Runtime.evaluate", {
    expression,
    awaitPromise: true,
    returnByValue: true,
    userGesture: true,
  });
  if (result.exceptionDetails) {
    throw new Error(result.exceptionDetails.exception?.description || result.exceptionDetails.text);
  }
  return result.result.value;
}

async function inspect(client) {
  return evaluate(client, `(() => ({
    title: document.title,
    url: location.href,
    readyState: document.readyState,
    text: (document.body?.innerText || '').slice(0, 12000),
    inputs: Array.from(document.querySelectorAll('input,select,textarea')).slice(0, 250).map((el) => ({
      id: el.id, name: el.name, type: el.type, value: el.value,
      placeholder: el.placeholder, disabled: el.disabled, readOnly: el.readOnly
    })),
    actions: Array.from(document.querySelectorAll('button,a')).slice(0, 300).map((el) => ({
      tag: el.tagName, id: el.id, text: (el.innerText || el.getAttribute('aria-label') || el.title || '').trim().slice(0, 120),
      href: el.href || '', className: el.className
    })).filter((item) => item.text || item.id)
  }))()`);
}

async function main() {
  const page = await targetPage();
  const client = await connect(page.webSocketDebuggerUrl);

  let output;
  if (mode === "accept-dialog") {
    await client.command("Page.handleJavaScriptDialog", { accept: true });
    output = { accepted: true };
  } else if (mode === "dismiss-dialog") {
    await client.command("Page.handleJavaScriptDialog", { accept: false });
    output = { dismissed: true };
  } else {
    await client.command("Page.enable");
    await client.command("Runtime.enable");
  }

  if (mode === "accept-dialog" || mode === "dismiss-dialog") {
    // The dialog command above is the complete operation for these modes.
  } else if (mode === "navigate") {
    const url = process.env.CDP_URL;
    if (!url) throw new Error("CDP_URL is required for navigate mode");
    const loaded = client.once("Page.loadEventFired", 45000).catch(() => null);
    await client.command("Page.navigate", { url });
    await loaded;
    output = await inspect(client);
  } else if (mode === "login") {
    const username = process.env.ERP_USERNAME;
    const password = process.env.ERP_PASSWORD;
    const companyCode = process.env.ERP_COMPANY_CODE || "1";
    const companyName = process.env.ERP_COMPANY_NAME || "IRONMART PRIVATE LIMITED";
    if (!username || !password) throw new Error("ERP_USERNAME and ERP_PASSWORD are required for login mode");
    output = await evaluate(client, `(() => {
      const set = (id, value) => {
        const node = document.getElementById(id);
        if (!node) throw new Error('Missing login field: ' + id);
        node.value = value;
        node.dispatchEvent(new Event('input', { bubbles: true }));
        node.dispatchEvent(new Event('change', { bubbles: true }));
      };
      set('P9999_USERNAME', ${JSON.stringify(username)});
      set('P9999_PASSWORD', ${JSON.stringify(password)});
      set('P9999_COMPANY_HIDDENVALUE', ${JSON.stringify(companyCode)});
      set('P9999_COMPANY', ${JSON.stringify(companyName)});
      document.getElementById('B574062734409959858').click();
      return { submitted: true };
    })()`);
  } else if (mode === "eval") {
    const expression = process.env.CDP_EXPRESSION;
    if (!expression) throw new Error("CDP_EXPRESSION is required for eval mode");
    output = await evaluate(client, expression);
  } else {
    output = await inspect(client);
  }

  process.stdout.write(`${JSON.stringify({ targetId: page.id, ...output }, null, 2)}\n`);
  client.ws.close();
}

main().catch((error) => {
  process.stderr.write(`${error.stack || error.message}\n`);
  process.exitCode = 1;
});
