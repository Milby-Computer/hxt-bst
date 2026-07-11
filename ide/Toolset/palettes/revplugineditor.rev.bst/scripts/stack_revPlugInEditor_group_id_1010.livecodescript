Script "stack_revPlugInEditor_group_id_1010"

/*
# Name: group "Open as:" of group "Open plugin:" of card id 1002 of stack "revPlugInEditor"
# ID: group id 1010 of group id 1076 of card id 1002 of stack "revPlugInEditor"
# Hash: ANZKGfjx08Hev6uAsN2i6g==
*/


on mouseUp
  put currentPluginPath() into thePluginPath
  if word 1 of the target is "button" -- just to make sure
  then set the cREVLoadInfo["mode"] of stack thePluginPath \
      to the short name of the target
  -- keep track of plugins needing to be saved
  if thePluginPath is not among the lines of the changedStacksList of this stack
  then set the changedStacksList of this stack \
      to the changedStacksList of this stack & thePluginPath & return
end mouseUp
