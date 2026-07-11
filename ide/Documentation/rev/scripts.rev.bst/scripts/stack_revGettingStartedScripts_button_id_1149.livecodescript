Script "stack_revGettingStartedScripts_button_id_1149"

/*
# Name: button "Find the stack labeled..." of group "Searching for an open window by title Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1149 of group id 1148 of card id 1002 of stack "revGettingStartedScripts"
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
