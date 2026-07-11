Script "stack_revVariableWatcher_button_id_1059"

/*
# Name: button "script" of card "home" of stack "revVariableWatcher"
# ID: button id 1059 of card id 1002 of stack "revVariableWatcher"
# Hash: G/tXbuTpEM9ykHvJMv1p4w==
*/


on mouseUp       
  local tSelectedLine, tCommand, tItemOne
  
  put the menuHistory of button "execution contexts" into tSelectedLine
  put item 1 of line tSelectedLine of the cContexts of button "execution contexts" into tItemOne
  put item 3 of line tSelectedLine of the cContexts of button "execution contexts" into tItemThree
  --answer tItemOne
  
  put revScriptEditor(tItemOne) into tEditor
  
  if tEditor is not empty then
    --answer "topleveling"
    modeless tEditor
    set the hilitedLines of fld "script" of stack tEditor to tItemThree
  else 
    put "edit the script of the" && item 1 of the cContexts of button "execution contexts" into tCommand
    do tCommand
  end if
end mouseUp
