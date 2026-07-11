Script "stack_revReplicate_button_id_1027"

/*
# Name: button "scaleLockButton" of card id 1002 of stack "revReplicate"
# ID: button id 1027 of card id 1002 of stack "revReplicate"
# Hash: Oj3tAQyvl7daGydAapSQAw==
*/


on mouseDown
  if the iconState of me is unlocked then
    set the iconState of me to locked
    set the hilite of me to false
    set the toolTip of me to "Click to allow horizontal and vertical scale to be changed independently"
  else
    set the iconState of me to unlocked
    set the hilite of me to true
    set the toolTip of me to "Click to keep the current ratio between horizontal and vertical scale"
  end if
end mouseDown
