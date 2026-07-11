Script "stack_revVariableWatcher_field_id_1026"

/*
# Name: field "Watched" of card "home" of stack "revVariableWatcher"
# ID: field id 1026 of card id 1002 of stack "revVariableWatcher"
# Hash: 4pcRsqE571V//sOQdY0smQ==
*/


on mouseUp
  put the menuHistory of btn "execution contexts" into tLineNo
  put item 1 of line tLineNo of the cContexts of btn "execution contexts" into tDebuggingObject
  if tDebuggingObject is empty then exit mouseUp
  put word 2 of the clickLine into cl
  put the watchedVariables into wv
  if the clickText is empty then
    put word 2 of the clickLine into tLine
    ask "Stop condition:" with line tLine of field "Names" && " = "
    if the result is "cancel" then exit mouseUp
    put "." & cr into line tLine of me
    set the imageSource of char 1 of line tLine of me to 203451
    put cr & tDebuggingObject & comma & field "handler" & comma & line cl of field "Names" & comma & it after wv
  else
    put cr into the clickLine
    delete line lineOffset(tDebuggingObject & comma & field "handler" & comma & line cl of field "Names", wv) of wv
  end if
  set the watchedVariables to wv
end mouseUp
