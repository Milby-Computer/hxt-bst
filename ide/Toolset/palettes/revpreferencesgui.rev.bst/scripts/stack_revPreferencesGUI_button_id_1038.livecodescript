Script "stack_revPreferencesGUI_button_id_1038"

/*
# Name: button "StartCenterPref" of group "General" of card "General" of stack "revPreferencesGUI"
# ID: button id 1038 of group id 1016 of card id 1002 of stack "revPreferencesGUI"
# Hash: NQV5UbYIysAaM/+h3crsTg==
*/


on mouseUp
   set the cStartPageShow of stack "revPreferences" to the hilite of me
   if the hilite of me then
      enable button "ReloadStartCenter"
      enable button "startCenterClassicPref"
   else
      disable button "ReloadStartCenter"
      disable button "startCenterClassicPref"
   end if
end mouseUp
