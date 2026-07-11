Script "stack_revSEUnappliedDialog"

/*
# Name: stack "revSEUnappliedDialog" of stack "revNewScriptEditor"
# ID: stack "revSEUnappliedDialog" of stack "revNewScriptEditor"
# Hash: Wc5y+pGuXrsT7dnjHtKCUg==
*/


on preOpenStack
  set the loc of me to the screenLoc
  put formatObjects(the cObjects of me) into field 2 of me
end preOpenStack

private function formatObjects pObjectsList
   local tFormattedObjects
   repeat for each line tObject in pObjectsList
      put the name of tObject & return after tFormattedObjects
   end repeat
   delete the last char of tFormattedObjects
   return tFormattedObjects
end formatObjects

on mouseUp
   if the cAction of the target is not empty then
      set the cChoice of me to the cAction of the target
      close me
   end if
end mouseUp

# OK-2009-04-27 : Bug 8001 - Block this message so that the script editor doesn't close.
on commandKeyDown
   
end commandKeyDown





