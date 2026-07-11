Script "stack_revPreferencesGUI_card_id_1007"

/*
# Name: card "Sizes" of stack "revPreferencesGUI"
# ID: card id 1007 of stack "revPreferencesGUI"
# Hash: Q5KCMYhiEGXRCORkuEAfdg==
*/


on preOpenCard
   updateDefaultSizeFields
end preOpenCard

command updateDefaultSizeFields
  repeat for each line tDefaultSize in the cDefaultSizes of stack "revPreferences"
    local tName
    put item 1 of tDefaultsize into tName
    put the tName of stack "revPreferences" into field tName #of group "Object Sizes" of me
  end repeat
end updateDefaultSizeFields


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
      windowAnimateResize the windowID of stack "revPreferencesGUI", the left of this stack, the top of this stack, the width of this stack, 380, 0.5
   else
      lock screen
      local tTopLeft
      put the topLeft of this stack into tTopLeft
      set the height of this stack to 380
      set the topLeft of this stack to tTopLeft
   end if
end OpenCard


