Script "stack_revNewScriptEditor_1_field_id_54950"

/*
# Name: field "Handlers" of group "Handler List" of card "Main" of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# ID: field id 54950 of group id 54949 of card id 1002 of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# Hash: Q3SEPFjUc8GUJQo8R50MiQ==
*/


on mouseUp
 closeAccept
end mouseUp

on focusOut
  closeReject
end focusOut

on enterInField
  closeAccept
end enterInField

on returnInField
  closeAccept
end returnInField

on arrowKey pKey
  if pKey is among the items of "up,down" then
    selectionScroll pKey
  end if
end arrowKey

private command selectionScroll pDirection
  local tOldSelectedLine
  put word 2 of the selectedLine of me into tOldSelectedLine
  
  local tNewSelectedLine
  if pDirection is "up" then
    if tOldSelectedLine is empty then
      put 1 into tNewSelectedLine
    else if tOldSelectedLine is 1 then
      put 1 into tNewSelectedLine
    else
      put tOldSelectedLine - 1 into tNewSelectedLine
    end if
  end if
  
  if pDirection is "down" then 
    if tOldSelectedLine is empty then
      put 1 into tNewSelectedLine
    else if tOldSelectedLine is the number of lines of me then
      put the number of lines of me into tNewSelectedLine
    else
      put tOldSelectedLine + 1 into tNewSelectedLine
    end if
  end if
  
  select line tNewSelectedLine of me
end selectionScroll










