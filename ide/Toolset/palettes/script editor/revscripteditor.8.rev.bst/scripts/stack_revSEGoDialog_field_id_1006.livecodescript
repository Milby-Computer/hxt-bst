Script "stack_revSEGoDialog_field_id_1006"

/*
# Name: field "Number" of card id 1002 of stack "revSEGoDialog" of stack "revNewScriptEditor"
# ID: field id 1006 of card id 1002 of stack "revSEGoDialog" of stack "revNewScriptEditor"
# Hash: ZMqDaYe+7343mGnAs+eFmw==
*/


on returnInField
   closeAccept
end returnInField

on enterInField
   closeAccept
end enterInField

on keyDown pKey
   if inputValid(pKey) then
      pass keyDown
   end if
end keyDown

private function inputValid pInput
   if pInput is a number then
      return true
   else
      return false
   end if
end inputValid
