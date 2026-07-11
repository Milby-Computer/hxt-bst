Script "stack_revPlugInEditor_button_id_1098"

/*
# Name: button "Include in Plug-ins menu" of card id 1002 of stack "revPlugInEditor"
# ID: button id 1098 of card id 1002 of stack "revPlugInEditor"
# Hash: nt2dzKP00QiW67HfLQJezw==
*/


on mouseUp
  put currentPluginPath() into thePluginPath
  set the cREVLoadInfo["inMenu"] of stack thePluginPath \
      to the hilite of me
  -- keep track of plugins needing to be saved
  if thePluginPath is not among the lines of the changedStacksList of this stack
  then set the changedStacksList of this stack to the changedStacksList of this stack & thePluginPath & return
end mouseUp
