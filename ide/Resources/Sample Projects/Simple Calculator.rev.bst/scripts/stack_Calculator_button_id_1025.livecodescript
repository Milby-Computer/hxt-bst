Script "stack_Calculator_button_id_1025"

/*
# Name: button "=" of card "Calculator" of stack "Calculator"
# ID: button id 1025 of card id 1002 of stack "Calculator"
# Hash: GgEG6HjcbilbfTy2tuErQA==
*/


on mouseUp
  -- copy the custom property runningTotal stored on the card into the variable
  -- currentRunningTotal
  put the runningTotal of this card into currentRunningTotal
  -- if the last button clicked was = then there is no need to run the calculation again
  if last char of currentRunningTotal is "=" then exit mouseUp
  -- the last operation ends with any +-*/ it is not possible to calculate it
  -- the operation needs to be in the form number-operator-number instead
  -- reportError is the name of a handler in the card script that will be run
  -- that handler will not return control back to this script, so we will exit here
  if last char of currentRunningTotal is among the chars of "+-*/" then reportError
  -- check to see if we are attempting to divide by zero
  if last char of currentRunningTotal is "0" and char -2 of currentRunningTotal is "/" then
    -- we are, so display a human friendly error
    put "Div by 0" into field "Result"
    -- cleare the running total custom property
    set the runningTotal of this card to empty
    -- stop here
    exit mouseUp
  end if
  -- evaluate the expression in currentRunningTotal to find the result of the calculation
  get the value of currentRunningTotal
  -- if it is empty then display a 0
  if it is empty then put zero into it
  -- display the result
  put it into field "Result"
  -- store the total and the last operation in the runningTotal card custom property
  set the runningTotal of this card to it & "="
end mouseUp
