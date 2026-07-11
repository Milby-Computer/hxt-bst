Script "stack_revPreferencesGUI_card_id_1010"

/*
# Name: card "Browser" of stack "revPreferencesGUI"
# ID: card id 1010 of stack "revPreferencesGUI"
# Hash: N6Xm9eJbrQPP9KJw8LrQlQ==
*/


on preOpenCard
   revIDEUpdatePBPreferences
   
   ## Object Type Indicator
   set the hilitedButtonName of group "objectType" to revIDEGetPreference("pb_indicator")
   
   ## Sections to show
   local tSelectedSections, tSections
   put revIDEGetPreference("pb_sections") into tSelectedSections
   put "Front scripts,Stacks,Back scripts,Stacks in use" into tSections
   repeat for each item tSection in tSections
      set the hilite of button tSection of me to (tSection is among the items of tSelectedSections)
   end repeat
   
   local tStackType, tCardType, tControlType
   local tStackOrder, tCardOrder, tControlOrder
   revIDEGetPBSortPreferences "pb_stackSort", tStackType, tStackOrder
   revIDEGetPBSortPreferences "pb_cardSort", tCardType, tCardOrder
   revIDEGetPBSortPreferences "pb_controlSort", tControlType, tControlOrder
   
   ## Sorting
   set the label of button "stackSortType" of me to tStackType
   set the label of button "cardSortType" of me to tCardType
   set the label of button "controlSortType" of me to tControlType
   
   put toupper(char 1 of tStackOrder) into char 1 of tStackOrder
   put toupper(char 1 of tCardOrder) into char 1 of tCardOrder
   put toupper(char 1 of tControlOrder) into char 1 of tControlOrder
   
   set the label of button "stackSortOrder" of me to tStackOrder
   set the label of button "cardSortOrder" of me to tCardOrder
   set the label of button "controlSortOrder" of me to tControlOrder
   
   local tTextSize
   put revIDEGetPreference("pb_textSize") into tTextSize
   set the label of button "textSize" of me to tTextSize
end preOpenCard

command updatePreference pName, pValue
   revIDESetPreference pName, pValue
end updatePreference


on OpenCard
   /*
   windowAnimateResize pWindowID, pLeft, pTop, pWidth, pHeight, pDuration
   
   Smoothly resizes the window identified by pWindowID (the integer returned
   by `the windowId of stack <name>` in LiveCode Script).
   
   pLeft, pTop   — new position in LiveCode screen coordinates (top-left origin)
   pWidth        — new width  in pixels
   pHeight       — new height in pixels
   pDuration     — animation length in seconds, e.g. 0.3
   */
   
   --   if (the platform = "macOS") then
   --      windowAnimateResize the windowID of this stack, the left of this stack, the top of this stack, the width of this stack, 346, 0.5
   --   else
   lock screen
   local tTopLeft
   put the topLeft of this stack into tTopLeft
   set the height of this stack to 346
   set the topLeft of this stack to tTopLeft
   --end if
end OpenCard


