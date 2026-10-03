connect -name IMART
apex export -applicationid 107 -exptype SQL -dir app105-source/backups/app107-before-105-clone-20260930-1855 -expsavedreports -exppubreports -expaclassignments -expruntimeinstances WORKFLOW,TASK
exit
