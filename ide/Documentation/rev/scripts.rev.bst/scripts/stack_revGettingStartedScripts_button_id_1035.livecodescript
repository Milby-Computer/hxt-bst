Script "stack_revGettingStartedScripts_button_id_1035"

/*
# Name: button "Compare" of group "Compare numbers approximately Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1035 of group id 1031 of card id 1002 of stack "revGettingStartedScripts"
# Hash: ovPsHl0mboaz9VZl9SL50A==
*/


on mouseUp
  -- check fields
  if approxEqual(field "First Number", field "Second Number", field "Tolerance") then
    answer "Yes:" && field "First Number" && "is within" && field "Tolerance" && "of" && field "Second Number" & "."
  else
    answer "No:" && field "First Number" && "is not within" && field "Tolerance" && "of" && field "Second Number" & "."
  end if
end mouseUp

function approxEqual firstNumber,secondNumber,tolerance
  if tolerance is empty then put 1 into tolerance -- default
  if abs(firstNumber - secondNumber) < tolerance
  then return true  -- the numbers are within tolerance
  else return false -- not close enough
end approxEqual
