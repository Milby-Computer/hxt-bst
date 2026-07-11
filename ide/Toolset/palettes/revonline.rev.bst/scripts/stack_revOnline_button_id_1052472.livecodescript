Script "stack_revOnline_button_id_1052472"

/*
# Name: button "ok" of group "stack upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 1052472 of group id 937651 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: SFv74Z6iTYgYN+aIhjBs0A==
*/


on mouseUp
   if the text of field "stack path" is not empty then
      local tPath
      put the text of field "stack path" of the owner of me into tPath
      if the cMode of group "chooser" of group "stack" of group "viewing pane" of stack "revonline" is "update" then
         newStackFileUpdate tPath
      else
         newStackFile tPath
      end if
   else
      rvoUpdateTooltip "You must select a stack to upload", true
   end if
end mouseUp

on mouseEnter
   set the backgroundColor of me to "124,193,222"
end mouseEnter

on mouseLeave
   set the backgroundColor of me to "214,214,214"
end mouseLeave

