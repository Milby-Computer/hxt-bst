Script "stack_revResourceCenter_button_id_579867"

/*
# Name: button "Find the stack labeled..." of group "Example" of group id 584262 of group "mainContent" of card "Searchingforanopenwindowbytitle" of stack "revResourceCenter"
# ID: button id 579867 of group id 577037 of group id 584262 of group id 98023 of card id 98013 of stack "revResourceCenter"
# Hash: 9t8878KEmDYGTEgly94Idg==
*/


on mouseUp
  ask "Please enter a window title:"
  if it is empty then exit mouseUp
  put it into theLabel
  get titledWindowIsOpen(theLabel)
  if it is true then
    answer info "There is a window whose title (label) is" && theLabel & "."
  else
    beep
    answer info "There is no window whose title (label) is" && theLabel & "."
  end if
end mouseUp

function titledWindowIsOpen theTitle
  -- get the list of open stack names:
  put the openStacks into openStacksList
  repeat for each line thisStack in openStacksList
    -- check whether the title we want matches the label
    -- of any open stack:
    if the label of stack thisStack is theTitle then return true
  end repeat
  -- if we reach this point, the function hasn't returned yet,
  -- so the title wasn't found to belong to any open stack
  return false
end titledWindowIsOpen
