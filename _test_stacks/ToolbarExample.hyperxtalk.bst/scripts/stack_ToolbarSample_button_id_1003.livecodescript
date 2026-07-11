Script "stack_ToolbarSample_button_id_1003"

/*
# Name: button "Button" of card id 1002 of stack "ToolbarSample"
# ID: button id 1003 of card id 1002 of stack "ToolbarSample"
# Hash: e4tWXzMdTio2tdTV0L/Iqw==
*/


on MouseUp
   -- Create the toolbar
   create toolbar in this stack
   
   -- Add items (setting the label for a new name auto-creates it)
   set the itemLabel["saveButton"] of toolbar 1 to "Save"
   set the itemIcon["saveButton"]  of toolbar 1 to "square.and.arrow.down"
   set the itemLabel["newDoc"]     of toolbar 1 to "New"
   set the itemIcon["newDoc"]      of toolbar 1 to "doc.badge.plus"
   
   -- Add a separator
   set the itemLabel["divider"]    of toolbar 1 to ""
   set the itemStyle["divider"]    of toolbar 1 to "separator"
   
   -- Configure the toolbar
   set the toolbarDisplayMode      of toolbar 1 to "iconAndLabel"
   set the toolbarVisible          of toolbar 1 to true
   
   -- Read item list
   local tNames
   put the itemNames of toolbar 1 into tNames   -- newline-delimited
   
   -- Remove an item (set itemNames to the list without it)
   set the itemNames of toolbar 1 to "saveButton" & return & "newDoc"
end MouseUp


-- Handle clicks
on toolbarItemClicked pName
   --   if pName is "saveButton" then save this stack
   put pName
end toolbarItemClicked
