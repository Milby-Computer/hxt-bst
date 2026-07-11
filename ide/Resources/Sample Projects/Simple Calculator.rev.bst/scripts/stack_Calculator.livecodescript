Script "stack_Calculator"

/*
# Name: stack "Calculator"
# ID: stack "Calculator"
# Hash: klFuS8/I1FnHqyvvYYIx1w==
*/


-- run this handler when the stack is opened, before it is displayed
-- on the screen
on preOpenStack
  -- set the result field to contain 0
  put zero into field "Result"
  -- set the custom property attached to this card, that stores the total
  -- to be empty
  set the runningTotal of card "Calculator" to empty
  -- change the text font size of the OK button if running on Mac OS X
  -- by looking up a custom function "isOSX"
  if isOSX() then set the textSize of button "OK" of card "About" to 13
end preOpenStack

-- this handler is called by objects on the card
on reportError
  beep
  -- exit the running handler here, don't return to the handler
  -- that called this one in the card object
  exit to top
end reportError

-- this function returns whether or not we are running on Mac OS X
function isOSX
  -- set the item delimiter to period so we can refer to the part of
  -- the system version returned before the decimal place
  set the itemDelimiter to "."
  -- check if we are running on a Mac and if that is true if we are running
  -- on system 10, if both are true, return true
  if the platform is "MacOS" and item 1 of the systemVersion is "10" then return true
  -- in all other cases, return false
  else return false
end isOSX
