Script "stack_revGettingStartedScripts_button_id_1253"

/*
# Name: button "Switch" of group "Switching between styled text and HTML source Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1253 of group id 1250 of card id 1002 of stack "revGettingStartedScripts"
# Hash: mOEfsrbkgIfvisahspFJCQ==
*/


on mouseUp
  if the label of me is "Switch to HTML" then
    set the label of me to "Switch to Text"
    set the displayedFormat of field "Display" to "HTML"
  else
    set the label of me to "Switch to HTML"
    set the displayedFormat of field "Display" to "styled"
  end if
end mouseUp
