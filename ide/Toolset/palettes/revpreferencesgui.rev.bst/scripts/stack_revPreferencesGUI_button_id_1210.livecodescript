Script "stack_revPreferencesGUI_button_id_1210"

/*
# Name: button "Create profiles automatically" of group "Property Profiles" of card "Property Profiles" of stack "revPreferencesGUI"
# ID: button id 1210 of group id 1207 of card id 1012 of stack "revPreferencesGUI"
# Hash: WBCMq5A80BOsRZf3wN7CzQ==
*/


on mouseUp
  global gREVAutoCreateProfiles
  put the hilite of me into gREVAutoCreateProfiles
  set the cREVAutoCreateProfiles of stack "revPreferences" to the hilite of me
  if the hilite of me then
    answer warning "If you change an object's profile to a profile name that doesn't exist" \
        & ", a new profile with that name will automatically be added to the object." \
        && "With this option, misspellings and mistakes when setting an object's profile" \
        && "can add unwanted additional profiles to the object." titled "Warning"
  end if
end mouseUp
