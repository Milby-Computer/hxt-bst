Script "stack_revPreferencesGUI_card_id_1008"

/*
# Name: card "Editor" of stack "revPreferencesGUI"
# ID: card id 1008 of stack "revPreferencesGUI"
# Hash: en7vYVcLs+ZHA8zhLPMa4Q==
*/


on preOpenCard
   set the hilite of button "hide errors" to the cSEHideErrors of stack "revPreferences"
   set the hilite of button "hide palettes" to the cSEHidePalettes of stack "revPreferences"
   set the hilite of button "hide message box" to the cSEHideMessageBox of stack "revPreferences"
   send "update" to group "Script Editor"
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
   --      windowAnimateResize the windowID of this stack, the left of this stack, the top of this stack, the width of this stack, 446, 0.5
   --   else
   lock screen
   local tTopLeft
   put the topLeft of this stack into tTopLeft
   set the height of this stack to 446
   set the topLeft of this stack to tTopLeft
   --end if
end OpenCard


