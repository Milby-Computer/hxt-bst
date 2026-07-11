Script "stack_Calculator_group_id_1028"

/*
# Name: group "Digits" of card "Calculator" of stack "Calculator"
# ID: group id 1028 of card id 1002 of stack "Calculator"
# Hash: d6JJbKlcm2+RlA5PSkSpIA==
*/


on mouseUp
  -- copy the label of the button clicked on (will be a number 0-9 or .) into the thisKey variable
  put the label of the target into thisKey
  -- copy the runningTotal custom property of the card into the variable currentRunningTotal
  put the runningTotal of this card into currentRunningTotal
  -- if this is empty or the last button pressed was =, then start a new entry
  if currentRunningTotal is empty \
      or last char of currentRunningTotal is "=" then
    -- the start of a new entry must not be . so put 0 before if it is
    if thisKey is "." then put "0." into thisKey
    -- display the value in the result field
    put thisKey into field "Result"
    -- save this value in the runningTotal card custom property
    set the runningTotal of this card to thisKey
  else -- continue entering a number
    -- if the last key pressed was an operator
    if last char of currentRunningTotal is among the chars of "+-*/" then
      -- replace the content of the result field
      put thisKey into field "Result"
    else
      -- put the number after the result field
      put thisKey after field "Result"
    end if
    -- append this value to the previous value and save in the runningTotal card custom property
    set the runningTotal of this card to currentRunningTotal & thisKey
  end if
end mouseUp
