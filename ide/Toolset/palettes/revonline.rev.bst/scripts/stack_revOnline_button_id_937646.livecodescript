Script "stack_revOnline_button_id_937646"

/*
# Name: button "Browse" of group "stack upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 937646 of group id 937651 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: zCb7oeY2cW1MMluLCH0BWw==
*/


on mouseUp
   local tResult
   revIDEAnswerFileWithTypes "stack", "select stack to upload"
   put the result into tResult
   if tResult is not empty then
      local tPath
      put tResult into tPath
      put tPath into field "stack path" of the owner of me
   end if  
end mouseUp

on mouseEnter
   set the backgroundColor of me to "124,193,222"
end mouseEnter

on mouseLeave
   set the backgroundColor of me to "214,214,214"
end mouseLeave
