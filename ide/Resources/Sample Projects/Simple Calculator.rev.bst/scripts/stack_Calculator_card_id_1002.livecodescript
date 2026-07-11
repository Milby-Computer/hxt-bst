Script "stack_Calculator_card_id_1002"

/*
# Name: card "Calculator" of stack "Calculator"
# ID: card id 1002 of stack "Calculator"
# Hash: R7nieiaIjL8VUHWzGge6jg==
*/


-- sent when a key on the keyboard is pressed
on keyDown theKey
  -- clicking on the button will both provide visual feedback and run
  -- the mouseUp handler in the button
  if theKey is an integer then click at the loc of button ("Number" && theKey)
  else if theKey is "." then click at the loc of button "Decimal"
  else if theKey is in "+-*/=" then click at the loc of button theKey
  -- allow the key press to be processed by any message handler
  -- that may be present further up the message hierarchy
  else pass keyDown
end keyDown

on backspaceKey
  click at the loc of button "Clear"
end backspaceKey

on enterKey
  click at the loc of button "="
end enterKey

on returnKey
  click at the loc of button "+"
end returnKey

-- this is sent if the mouse is clicked twice in quick succession
-- we want to run the mouseUp handler rather than having this click ignored
on mouseDoubleUp
  send mouseUp to the target
end mouseDoubleUp
