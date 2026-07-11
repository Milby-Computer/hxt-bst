Script "stack_revIDEExtensionManager_group_id_1003"

/*
# Name: group "extensionList" of card "list" of stack "revIDEExtensionManager"
# ID: group id 1003 of card id 1002 of stack "revIDEExtensionManager"
# Hash: 76XcEa4aGYLcDAJkO8dx1Q==
*/


on dragEnter
   set the dragAction to "copy"
end dragEnter

on dragDrop
   installExtension the dragData["files"]
end dragDrop
