Script "stack_revGettingStartedScripts_button_id_1021"

/*
# Name: button "Underline Links" of group "Link text roll over effect Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1021 of group id 1019 of card id 1002 of stack "revGettingStartedScripts"
# Hash: iToe6L99HsTDHF+f902SAQ==
*/


on mouseUp
  if the hilite of me then
    set the underlineLinks of this stack to true
    set the linkColor of this stack to "blue"
    set the linkVisitedColor of this stack to "blue"
  else
    set the underlineLinks of this stack to false
    set the linkColor of this stack to "black"
    set the linkVisitedColor of this stack to "black"
  end if
end mouseUp
