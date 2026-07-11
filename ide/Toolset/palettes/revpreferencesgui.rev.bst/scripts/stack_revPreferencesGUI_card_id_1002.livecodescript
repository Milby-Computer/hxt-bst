Script "stack_revPreferencesGUI_card_id_1002"

/*
# Name: card "General" of stack "revPreferencesGUI"
# ID: card id 1002 of stack "revPreferencesGUI"
# Hash: T0MncrHydq1WFboCtQDGXw==
*/


on preOpenCard   
   set the hilite of button "Descriptions on properties" of me to the cLanguageNames of card 1 of stack "revPreferences" is false
   set the hilite of button "Language names on properties" of me to not the hilite of button "Descriptions on properties" of me
   set the hilite of button "navigation arrows" of me to the cNavigationArrows of stack "revPreferences"
   set the hilite of button "opt edit script shortcut" of me to the cREVScriptShortcut of stack "revPreferences"
   set the hilite of button "context menus work on Rev dev stacks" of me to the cRevPopups of stack "revPreferences"
   set the hilite of button "show revolution stacks" of me to the cShowRevolutionStacks of stack "revPreferences"
   put the cEditorpath of stack "revpreferences" into field "external editor" of me
   put the httpProxy into field "http proxy" of card "general"
   
   get the cCrashReportStyle of stack "revPreferences"
   if it is empty then
      get "Small"
   end if
   set the label of button "Crash Report Style" of me to it
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
   --      windowAnimateResize the windowID of this stack, the left of this stack, the top of this stack, the width of this stack, 362, 0.5
   --   else
   lock screen
   local tTopLeft
   put the topLeft of this stack into tTopLeft
   set the height of this stack to 362
   set the topLeft of this stack to tTopLeft
   --end if
end OpenCard
