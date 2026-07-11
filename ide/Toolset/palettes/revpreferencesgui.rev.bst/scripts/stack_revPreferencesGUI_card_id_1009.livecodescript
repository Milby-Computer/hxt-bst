Script "stack_revPreferencesGUI_card_id_1009"

/*
# Name: card "Profiles" of stack "revPreferencesGUI"
# ID: card id 1009 of stack "revPreferencesGUI"
# Hash: a3kJiEj65CMO1MaOOp8euw==
*/


on preOpenCard
   set the hilite of button "Don't save changes" to the cREVProfileReadOnly of stack "revPreferences"
   set the hilite of button "create profiles automatically" to the cREVAutoCreateProfiles of stack "revPreferences"
   put the cREVTemplateMasterName of stack "revPreferences" into field "default profile name"
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
   
   if (the platform = "macOS") then
      windowAnimateResize the windowID of stack "revPreferencesGUI", the left of this stack, the top of this stack, the width of this stack, 152, 0.5
   else
      lock screen
      local tTopLeft
      put the topLeft of this stack into tTopLeft
      set the height of this stack to 152
      set the topLeft of this stack to tTopLeft
   end if
end OpenCard


