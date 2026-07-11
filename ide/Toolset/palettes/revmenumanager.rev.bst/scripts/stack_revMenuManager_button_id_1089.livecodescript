Script "stack_revMenuManager_button_id_1089"

/*
# Name: button "Preview" of bkgnd "Windows Preview" of stack "revMenuManager"
# ID: button id 1089 of bkgnd id 5351 of stack "revMenuManager"
# Hash: 1sekayvQDFSQxRaKoxxRkg==
*/


--setprop cREVLabel pLabel
--  global gREVActiveMenuButton
--  switch
--  case pLabel is empty
--    set the label of me to empty
--    break
--  case comma is in the effective textFont of gREVActiveMenuButton
--    set the label of me to uniEncode("Preview ") & uniEncode("(") \
      --        & uniEncode(quote) & pLabel & uniEncode(quote) & uniEncode(" Menu)") 
--    break
--  default
--    set the label of me to "Preview" && "(" & quote & pLabel & quote && "Menu)"
--    break
--  end switch
--  set the rect of me to the topLeft of me, the left of me + the formattedWidth of me, \
      --      the bottom of me
--  set the left of grc "Preview Border 1" to the right of me + 2
--  set the left of grc "Preview Border 2" to the right of me + 3
--end cREVLabel

setprop cREVLabel pLabel
   global gREVActiveMenuButton
   switch
      case pLabel is empty
         set the label of me to empty
         break
      default
         set the unicodelabel of me to uniEncode("Preview ") & uniEncode("(") \
               & uniEncode(quote) & pLabel & uniEncode(quote) & uniEncode(" Menu)") 
         break
   end switch
   set the rect of me to the topLeft of me, the left of me + the formattedWidth of me, \
         the bottom of me
   set the left of grc "Preview Border 1" to the right of me + 2
   set the left of grc "Preview Border 2" to the right of me + 3
end cREVLabel
