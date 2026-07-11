Script "stack_revPlugInEditor_field_id_1074"

/*
# Name: field "Message List" of card id 1002 of stack "revPlugInEditor"
# ID: field id 1074 of card id 1002 of stack "revPlugInEditor"
# Hash: ghk/fre46eh3HdcWGDHADQ==
*/


on mouseDown
  put currentPluginPath() into thePluginPath
  set the cREVLoadInfo[the value of the clickLine] of stack thePluginPath to \
      (word 2 of the clickLine is among the items of the hilitedLines of me)
  -- keep track of plugins needing to be saved
  if thePluginPath is not among the lines of the changedStacksList of this stack
  then set the changedStacksList of this stack \
      to the changedStacksList of this stack & thePluginPath & return
end mouseDown
