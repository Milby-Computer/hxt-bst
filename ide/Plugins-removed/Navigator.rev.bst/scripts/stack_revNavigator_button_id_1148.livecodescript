Script "stack_revNavigator_button_id_1148"

/*
# Name: button "OK" of group "CommandOptionControls" of group "CommandOption" of card "display" of stack "revNavigator"
# ID: button id 1148 of group id 1147 of group id 1137 of card id 1002 of stack "revNavigator"
# Hash: 7ySU7kQfgjFgD5XOfhmDpw==
*/


global gSBThisStack
on mouseUp
  if the vis of fld "commandOptionList"  of stack gSBThisStack then
    put the selectedText of fld "commandOptionList"  of stack gSBThisStack into tText
    send ("setOptionList" && tText) to group "commandControls" of stack gSBThisStack
  end if
  if the vis of btn "commandOptionPopup1"  of stack gSBThisStack then
    put the selectedText of btn "commandOptionPopup1"  of stack gSBThisStack into tText
    send ("setOptionOne" && tText) to group "commandControls" of stack gSBThisStack
  end if
  if the vis of btn "commandOptionPopup2"  of stack gSBThisStack then
    put the selectedText of btn "commandOptionPopup2"  of stack gSBThisStack into tText
    send ("setOptionTwo" && tText) to group "commandControls" of stack gSBThisStack
  end if

  hide group "commandOption" of stack gSBThisStack with visual effect reveal up very fast
  send "okOptions" to group "commandControls" of stack gSBThisStack
end mouseUp
