Script "stack_revGettingStartedScripts_button_id_1222"

/*
# Name: button "Ceiling" of group "Rounding a number up to a ceiling Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1222 of group id 1219 of card id 1002 of stack "revGettingStartedScripts"
# Hash: nBXzUa/OkSu1ZgTcfiZnng==
*/


on mouseUp
  answer ceiling(field "Example Number")
end mouseUp

function ceiling theNumber
  if theNumber is not a number then return "Error: not a number"
  if theNumber < zero or theNumber is an integer then
    return trunc(theNumber)
  else
    return 1 + trunc(theNumber)
  end if
end ceiling
