Script "stack_revNavigator_button_id_1133"

/*
# Name: button "Save" of group "commandControls" of group "commandGroup" of card "display" of stack "revNavigator"
# ID: button id 1133 of group id 1076 of group id 1100 of card id 1002 of stack "revNavigator"
# Hash: kEyVrG1HfzHzBrQS47O84Q==
*/


global gSBThisStack
on mouseUp
  put the value of word -1 the long id of stack gSBThisStack into tPath
  set the itemDelimiter to "/"
  put "Navigator Commands" into item -1 of tPath
  if not (there is a folder tPath) then
    create folder tPath
  end if
  ask "Save Command As:" with "Command Name"
  if the result is not empty then exit mouseUp
  put it into tCommand
  put "/" & tCommand after tPath
  put fld "command" into url ("file:" & tPath)
  buildCustomCommandList
end mouseUp
