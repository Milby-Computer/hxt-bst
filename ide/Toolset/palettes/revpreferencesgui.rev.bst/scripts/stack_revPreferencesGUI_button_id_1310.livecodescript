Script "stack_revPreferencesGUI_button_id_1310"

/*
# Name: button "Add entry" of group "iOS SDKs" of card "Mobile Support" of stack "revPreferencesGUI"
# ID: button id 1310 of group id 1261 of card id 1254 of stack "revPreferencesGUI"
# Hash: Q1L6rtzLsEa6VQkvVjthfQ==
*/


on mouseUp
   -- PM-2015-04-02: No need to ask if the version of Xcode is 4.2 or earlier, since we no longer support iOS version < 5.1
   answer file "Select your XCode app bundle" with filter "APPL"
   if it is not empty then
      put "/Contents/Developer" after it
   end if
   
   if it is not empty then
      if revIDEDeployIOSIsValidSDK(it) then
         setIOSSdk it
      else
         local tValidSDKs
         put revIDEDeployIOSUsableSDKs() into tValidSDKs
         replace comma with LF & TAB in tValidSDKs
         answer error "The chosen folder is not a valid iOS SDK." & LF & \
               "Selected Xcode must have an iOS SDK among:" & LF & TAB & tValidSDKs
      end if
   end if
end mouseUp
