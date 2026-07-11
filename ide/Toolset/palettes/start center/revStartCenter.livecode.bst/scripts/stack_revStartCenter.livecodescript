Script "stack_revStartCenter"

/*
# Name: stack "revStartCenter"
# ID: stack "revStartCenter"
# Hash: QPdLvRrxtCcRx/9evgBG3Q==
*/


on preOpenStack
   revIDESubscribe "ideNewStack"
   revIDESubscribe "ideOpenStack"
   
   set the behavior of this stack to the long id of stack "revStartCenterBehavior"
end preOpenStack
