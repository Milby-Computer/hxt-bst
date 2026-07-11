Script "stack_revSETemplate_group_id_54422"

/*
# Name: group "Enter Password" of group "Editor" of card "Main" of stack "revSETemplate" of stack "revNewScriptEditor"
# ID: group id 54422 of group id 1046 of card id 1002 of stack "revSETemplate" of stack "revNewScriptEditor"
# Hash: shQ5j2TfXd1QFke7GktkLg==
*/


on mouseUp
   if the long id of the target is the long id of button "Unlock" of me then
      unprotectRequest
   end if
end mouseUp

on returnInField
   unprotectRequest
end returnInField

on enterInField
   unprotectRequest
end enterInField

private command unprotectRequest
   local tObject
   getObject
   put the result into tObject
   
   local tStack
   put revTargetStack(tObject) into tStack
   
   try
      set the passKey of stack tStack to the cValue of field "Password" of me
   end try
   
   local tUnlocked
   put false into tUnlocked
   try
      get the script of stack tStack
      put true into tUnlocked
   end try
   
   if tUnlocked then
      displayError empty
      unprotectScript
   else
      displayError "Incorrect password, please try again"
   end if
end unprotectRequest

private command unprotectScript
   lock screen
   loadScript
   resize
   scriptUnlock
   unlock screen
   
   # OK-2010-02-11: Bug 8548 - The handler list on the left will be empty if the script was password protected,
   # as we've now unlocked the script, we need to update the list.
   seUpdateLeftBar
end unprotectScript

private command displayError pError
   set the textColor of field "Error" of me to "240,0,0,"
   put pError into field "Error" of me
end displayError

command openControl
   focus on field "Password" of me
   select before field "Password" of me
end openControl
