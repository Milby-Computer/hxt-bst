Script "stack_revOnline_card_id_1002"

/*
# Name: card "main" of stack "revOnline"
# ID: card id 1002 of stack "revOnline"
# Hash: u4YZbizci/wI4onghVAw+Q==
*/


on preOpenCard
   if char 1 of the version < 7 then
      set the textColor of field "login status" of group "menubar" to "white"
      set the textColor of field "email" of group "menubar" to "white"
      set the textColor of field "controls" of group "menubar" to "white"
   else
      set the textColor of field "login status" of group "menubar" to empty
      set the textColor of field "controls" of group "menubar" to empty
      set the textColor of field "email" of group "menubar" to empty
   end if
end preOpenCard
