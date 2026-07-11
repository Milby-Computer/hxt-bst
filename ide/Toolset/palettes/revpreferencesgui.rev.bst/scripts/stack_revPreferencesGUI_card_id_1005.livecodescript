Script "stack_revPreferencesGUI_card_id_1005"

/*
# Name: card "Files" of stack "revPreferencesGUI"
# ID: card id 1005 of stack "revPreferencesGUI"
# Hash: VuihWf1Rdzjdjz8EXD9EWw==
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
   updateCustomizationPath
   hxtSetTheHeightOfThisStackTo 470
end OpenCard


# OK-2007-12-12
# Parameters
#   <none>
# Description
#   Prompts the user to choose a customization path, and sets the cCustomizationPath of the preferences stack to the chosen folder.
#   If the user cancels the folder choose prompt or doesn't select a valid folder, nothing is done.
command chooseCustomizationPath
  local tPath
  answer folder "Please choose user extensions path"
  put it into tPath
  if tPath is empty then
    exit chooseCustomizationPath
  end if
  
  local tChanged
  put false into tChanged
  if tPath <> the cCustomizationPath of stack "revPreferences" then
    put true into tChanged
  end if
  
  set the cCustomizationPath of stack "revPreferences" to tPath
  put tPath into field "Customization Path" of me
  
  if tChanged then
    answer warning "HyperXTalk must be restarted to complete this change." with "Later" or "Quit"
    if it is "Quit" then
      quit
    end if
  end if
end chooseCustomizationPath

# OK-2007-12-12
# Parameters
#   <none>
# Description
#   Updates the customization path field to reflect the current setting in the preferences.
command updateCustomizationPath
  set the text of field "Customization Path" of me to revEnvironmentCustomizationPath()
end updateCustomizationPath

--# OK-2007-12-12
--on openBackground
--  updateCustomizationPath
--  pass openBackground
--end openBackground
