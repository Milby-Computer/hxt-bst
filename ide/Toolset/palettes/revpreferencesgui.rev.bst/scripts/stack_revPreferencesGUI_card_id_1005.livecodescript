Script "stack_revPreferencesGUI_card_id_1005"

/*
# Name: card "Files" of stack "revPreferencesGUI"
# ID: card id 1005 of stack "revPreferencesGUI"
# Hash: FLebuaWOG2e9WdTU5kiGew==
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
   hxtSetTheHeightOfThisStackTo 470
end OpenCard


