Script "stack_revOnline_button_id_1060742"

/*
# Name: button "ok" of group "code upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 1060742 of group id 937656 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: qmTZa6wsDaw5es2GTWPPnQ==
*/


on mouseUp
   if the text of field "code input" of the owner of me is not empty then
      local tCode
      put the text of field "code input" of the owner of me into tCode
      if the cMode of group "chooser" of group "stack" of group "viewing pane" of stack "revonline" is "update" then
         newCodeFileUpdate tCode
      else
         newCodeFile tCode
      end if
   else
      rvoUpdateTooltip "You must enter your code in the field above", true
   end if
end mouseUp
