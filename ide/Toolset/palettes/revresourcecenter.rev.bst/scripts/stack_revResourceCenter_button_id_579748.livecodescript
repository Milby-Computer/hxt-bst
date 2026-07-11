Script "stack_revResourceCenter_button_id_579748"

/*
# Name: button "Switch" of group "Example" of group "switchingtextstyles" of group "mainContent" of card "SwitchingBetweenStyledTextAndHTMLSource" of stack "revResourceCenter"
# ID: button id 579748 of group id 579745 of group id 113797 of group id 113802 of card id 113788 of stack "revResourceCenter"
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
