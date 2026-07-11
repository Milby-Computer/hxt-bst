Script "stack_revResourceCenter_button_id_577056"

/*
# Name: button "Underline Links" of group "Example" of group id 584230 of group "mainContent" of card "Linktextrollovereffect" of stack "revResourceCenter"
# ID: button id 577056 of group id 577002 of group id 584230 of group id 80257 of card id 80250 of stack "revResourceCenter"
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
