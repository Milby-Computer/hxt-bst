Script "stack_revPlugInEditor_group_id_1027"

/*
# Name: group "Load:" of group "Open plugin:" of card id 1002 of stack "revPlugInEditor"
# ID: group id 1027 of group id 1076 of card id 1002 of stack "revPlugInEditor"
# Hash: 5OKLN/BrYLyjNW/hZHEj4w==
*/


on mouseUp
  put currentPluginPath() into thePluginPath
  if word 1 of the target is "button" -- just to make sure
  then set the cREVLoadInfo["load"] of stack thePluginPath \
      to the short name of the target
  -- keep track of plugins needing to be saved
  if thePluginPath is not among the lines of the changedStacksList of this stack
  then set the changedStacksList of this stack to the changedStacksList of this stack & thePluginPath & return
end mouseUp
