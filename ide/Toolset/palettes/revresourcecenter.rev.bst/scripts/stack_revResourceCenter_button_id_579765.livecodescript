Script "stack_revResourceCenter_button_id_579765"

/*
# Name: button "Compare" of group "Example" of group id 113817 of group "mainContent" of card "CompareNumbersApproximately" of stack "revResourceCenter"
# ID: button id 579765 of group id 579761 of group id 113817 of group id 113822 of card id 113804 of stack "revResourceCenter"
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
