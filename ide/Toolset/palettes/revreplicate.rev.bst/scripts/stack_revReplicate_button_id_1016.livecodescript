Script "stack_revReplicate_button_id_1016"

/*
# Name: button "offsetLockButton" of card id 1002 of stack "revReplicate"
# ID: button id 1016 of card id 1002 of stack "revReplicate"
# Hash: 9xy7+T/7Nv4L7BPfsKGn1g==
*/


on mouseDown
  if the iconState of me is unlocked then
    set the iconState of me to locked
    set the hilite of me to false
    set the toolTip of me to "Click to allow horizontal and vertical offsets to be changed independently"
  else
    set the iconState of me to unlocked
    set the hilite of me to true
    set the toolTip of me to "Click to keep the current ratio between horizontal and vertical offsets"
  end if
end mouseDown
