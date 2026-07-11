Script "stack_revGettingStartedScripts_button_id_1217"

/*
# Name: button "Reverse It!" of group "Reversing text Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1217 of group id 1215 of card id 1002 of stack "revGettingStartedScripts"
# Hash: XfmUM0NUbjzqa3gM5QURuw==
*/


on mouseUp
  put reversed(field "Example Text") into field "Example Text"
end mouseUp
  
function reversed theString
  repeat with thisChar = the length of theString down to 1
    put char thisChar of theString after reversedString
  end repeat
  return reversedString
end reversed
