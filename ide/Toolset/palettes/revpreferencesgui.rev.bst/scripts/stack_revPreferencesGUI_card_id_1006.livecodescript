Script "stack_revPreferencesGUI_card_id_1006"

/*
# Name: card "Appearance" of stack "revPreferencesGUI"
# ID: card id 1006 of stack "revPreferencesGUI"
# Hash: KLfpgXjLcaQjJ9W7AcNW+Q==
*/


on preOpenCard
   set the label of button "rulers" to the cREVRulerMeasurement of stack "revPreferences"
   put the cGridSize of stack "revPreferences" into field "gridSize"
   
   if the platform is "MacOS" then
      put "(-" into line -2 of button "backdrop color"
      put "(-" into line -2 of button "selectionHandle color"
      put "(-" into line -2 of button "hypertext color"
      --put "Default" & cr & "(-" & cr & tFontNames into button "Default script font"
   else
      # Can't have dividers in option menus on PC platforms
      put empty into line -2 of button "backdrop color"
      put empty into line -2 of button "selectionHandle color"
      put empty into line -2 of button "hypertext color"
      --      put "Default" & cr & cr & tFontNames into button "Default script font"
   end if
   
   set the label of button "backdrop color" to the cBackDropColor of stack "revPreferences"
   set the backgroundColor of graphic "Backdrop Swatch" to the cBackDropColor of stack "revPreferences"
   set the label of button "selectionhandle color" to "white"
   ---------------------
   --LG-2008-01-24
   --Bug 3486:  cSelectionHandleColor is empty when a user preference 
   --stack doesn't exist. 
   if the cSelectionHandleColor of stack "revPreferences" is empty then
      set the label of button "selectionhandle color" to the cSelectionHandle of stack "revPreferences"
      set the backgroundColor of graphic "Selection Handle Swatch" to the cSelectionHandle of stack "revPreferences"
   else
      set the label of button "selectionhandle color" to the cSelectionHandleColor of stack "revPreferences"
      set the backgroundColor of graphic "Selection Handle Swatch" to the cSelectionHandleColor of stack "revPreferences"
   end if
   
   set the label of button "hypertext color" to the cREVHelpHiliteColor of stack "revPreferences"
   set the backgroundColor of graphic "Help Hilite Swatch" to the cREVHelpHiliteColor of stack "revPreferences"
   
   put the cREVToolTipDelay of stack "revPreferences" into field "tooltip delay"
   put the toolTipDelay into field "ToolTip Delay"
end preOpenCard


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
   --      windowAnimateResize the windowID of this stack, the left of this stack, the top of this stack, the width of this stack, 290, 0.5
   --   else
   lock screen
   local tTopLeft
   put the topLeft of this stack into tTopLeft
   set the height of this stack to 290
   set the topLeft of this stack to tTopLeft
   --end if
end OpenCard


