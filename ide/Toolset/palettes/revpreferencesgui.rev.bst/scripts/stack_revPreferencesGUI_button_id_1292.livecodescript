Script "stack_revPreferencesGUI_button_id_1292"

/*
# Name: button "ChooseAndroid" of group "Android SDK Controls" of group "Android SDK" of card "Mobile Support" of stack "revPreferencesGUI"
# ID: button id 1292 of group id 1290 of group id 1289 of card id 1254 of stack "revPreferencesGUI"
# Hash: TWuS2WBDYzKLQOjLrqCXyg==
*/


on mouseUp
   answer folder "Please choose the location of your Android development SDK"
   if it is not empty then
      if revIDEDeployAndroidIsValidSDK(it) then
         setAndroidSDK it
      else
         answer error "The chosen folder is not a valid Android SDK. Please ensure you have installed it correctly, and enabled support for" && revIDEDeployAndroidRequiredSDK()
      end if
   end if
end mouseUp
