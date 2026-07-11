Script "stack_revPreferencesGUI_card_id_1005"

/*
# Name: card "Files" of stack "revPreferencesGUI"
# ID: card id 1005 of stack "revPreferencesGUI"
# Hash: XZDViGmbJKCj+vzDnuEJPA==
*/


on preOpenCard
   set the hilite of button "absoluteImagePaths" to the cImageFileRelative of stack "revPreferences" is false
   set the hilite of button "add extension" to the cREVExtension of stack "revPreferences"
   
   set the hilite of button "destroyStack" to the cDestroyStack of stack "revPreferences"
   set the hilite of button "remove from memory" to false
   set the hilite of button "ask" to false
   set the hilite of button "don't remove" to false
   
   switch the cASKDestroy of stack "revPreferences"
      case "don't remove"
         set the hilite of button "don't remove" to true
         break
      case "remove"
         set the hilite of button "remove from memory" to true
         break
      case "ask"
         set the hilite of button "ask" to true
         break
   end switch
   
   put the cNumRecent of stack "revPreferences" into field "num recent files"
   set the hilitedButtonName of group "recent files sort" to the cRecentSort of stack "revPreferences"
   
   get the cPreserveStackCreator of stack "revPreferences"
   set the hilite of button "Preserve Stack Creator" to it is true
   set the enabled of button "Preserve Stack Creator" to the platform is "MacOS"
   
   get the cPreserveStackVersion of stack "revPreferences"
   set the hilite of button "Preserve Stack Version" to it is true
   
   --   send "updateCustomizationPath" to group "Files & Memory" of me
   set the text of field "Customization Path" to revEnvironmentCustomizationPath()
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
      windowAnimateResize the windowID of stack "revPreferencesGUI", the left of this stack, the top of this stack, the width of this stack, 470, 0.5
   else
      lock screen
      local tTopLeft
      put the topLeft of this stack into tTopLeft
      set the height of this stack to 470
      set the topLeft of this stack to tTopLeft
   end if
end OpenCard


