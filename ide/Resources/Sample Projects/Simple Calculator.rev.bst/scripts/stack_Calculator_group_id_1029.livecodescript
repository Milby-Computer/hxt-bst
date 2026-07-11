Script "stack_Calculator_group_id_1029"

/*
# Name: group "Operators" of card "Calculator" of stack "Calculator"
# ID: group id 1029 of card id 1002 of stack "Calculator"
# Hash: WVmebgt2jhJl1nh8xHTUrg==
*/


on mouseUp
  -- copy the label of the button clicked on (will be +-/*) into the thisKey variable
  put the label of the target into thisKey
  -- copy the runningTotal custom property of the card into the variable currentRunningTotal
  put the runningTotal of this card into currentRunningTotal
  -- if this is empty or the last button pressed was an operator, then call the
  -- reportError handler in the card script.  this handler does not return control
  -- so we exit here
  if currentRunningTotal is empty \
      or last char of currentRunningTotal is among the chars of "+-*/" then reportError -- error
  -- cycle through the four possible operators, placing each one into the variable thisOperator
  repeat for each character thisOperator in "+-*/"
    -- if the calculation already contains the operator stored in thisOperator then
    -- put true into the variable mustEvaluate
    if currentRunningTotal contains thisOperator then put true into mustEvaluate
  end repeat
  -- if an operator is already in the store calculation
  if mustEvaluate then
    -- calculate the value of the currentRunningTotal variable and display
    -- it in the result field
    put the value of currentRunningTotal into field "Result"
    -- store the answer together with = to denote that the last operation was a calculation
    set the runningTotal of this card to the value of currentRunningTotal & "="
  end if
  if last char of currentRunningTotal is "=" then -- compound operation, e.g. "22+3=...-7"
    -- set the runningTotal card custom property to all characters in the
    -- currentRunningTotal variable, except the last operator character
    set the runningTotal of this card to char 1 to -2 of currentRunningTotal & thisKey
    -- otherwise, set the runningTotal to the value and the operator symbol just pressed
  else set the runningTotal of this card to currentRunningTotal & thisKey
end mouseUp
