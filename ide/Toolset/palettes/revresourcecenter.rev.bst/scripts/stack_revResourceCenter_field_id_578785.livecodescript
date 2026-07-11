Script "stack_revResourceCenter_field_id_578785"

/*
# Name: field "Example Text" of group "Example" of group id 571866 of group "mainContent" of card "Shiftingselectedtexttotherightorleft" of stack "revResourceCenter"
# ID: field id 578785 of group id 578784 of group id 571866 of group id 80420 of card id 80409 of stack "revResourceCenter"
# Hash: IT1kSYBHEalamgQNXrCBBg==
*/


on tabKey
  if the selectedText is empty then pass tabKey
  -- there's an insertion point, but no selection,
  -- so let tab key operate normally. Otherwise...
  put the selectedLines into savedSelectedLines -- save for later
  put word 2 of the selectedLines into firstLine
  if word 3 of the selectedLines is "to" then
    -- multiple lines are selected
    put word 4 of the selectedLines into lastLine
  else -- single line is selected
    put firstLine into lastLine
  end if
  if the shiftKey is down then -- shift left - remove a tab:
    repeat with thisLine = firstLine to lastLine
      if char 1 of line thisLine \
          of (the text of the selectedField) is tab
      then delete char 1 of line thisLine \
          of the selectedField -- remove leading tab
    end repeat
  else -- shift key not down, so shift right - add a tab:
    repeat with thisLine = firstLine to lastLine
      -- add a leading tab to each line in the selection
      put tab before line thisLine of the selectedField
    end repeat
  end if
  select savedSelectedLines -- (re)select all affected lines
end tabKey
