Script "stack_revPreferencesGUI_button_id_1305"

/*
# Name: button "ChooseJDK" of group "Android SDK" of card "Mobile Support" of stack "revPreferencesGUI"
# ID: button id 1305 of group id 1289 of card id 1254 of stack "revPreferencesGUI"
# Hash: Dmra0dQ2EINkxXyarIECHw==
*/


on mouseUp
   answer folder "Please choose the location of your JDK"
   if it is not empty then
      if revIDEDeployAndroidIsValidJDK(it) then
         setJDK it
      else
         answer error "The chosen folder is not a valid JDK. Please ensure you have installed it correctly."
      end if
   end if
end mouseUp
