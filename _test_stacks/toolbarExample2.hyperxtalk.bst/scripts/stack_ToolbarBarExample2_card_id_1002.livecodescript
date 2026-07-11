Script "stack_ToolbarBarExample2_card_id_1002"

/*
# Name: card id 1002 of stack "ToolbarBarExample2"
# ID: card id 1002 of stack "ToolbarBarExample2"
# Hash: dxqAMYODRWbY1vIptQIA7g==
*/


-- Handle clicks
on toolbarItemClicked pToolbarItemName
   if pToolbarItemName is "fileOpen" then
      share "Check this out!" from the rect of button "OpenShareAnchor"
   end if
   put pToolbarItemName
end toolbarItemClicked
