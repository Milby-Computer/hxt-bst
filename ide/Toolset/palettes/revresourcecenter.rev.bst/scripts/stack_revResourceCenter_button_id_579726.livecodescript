Script "stack_revResourceCenter_button_id_579726"

/*
# Name: button "Reverse It!" of group "Example" of group id 584246 of group "mainContent" of card "ReversingText" of stack "revResourceCenter"
# ID: button id 579726 of group id 577014 of group id 584246 of group id 113755 of card id 113742 of stack "revResourceCenter"
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
