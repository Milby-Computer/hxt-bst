Script "stack_revPreferencesGUI_button_id_1155"

/*
# Name: button "Don't save changes" of card "Profiles" of stack "revPreferencesGUI"
# ID: button id 1155 of card id 1009 of stack "revPreferencesGUI"
# Hash: 9WY7WM621sKg59hXLxU6Vg==
*/


on mouseUp
  global gREVProfileReadOnly
  put the hilite of me into gREVProfileReadOnly
  set the cREVProfileReadOnly of stack "revPreferences" to the hilite of me
    if the hilite of me then
    answer warning "This option should only be used if you do not plan to make permanent changes" \
   && "to object properties. Before using this option, all objects should be set to their master profile." \
   && "If you have switched objects to other profiles and made changes since the switch, these changes" \
   && "will be lost unless you turn this option off now." titled "Warning"
  end if
end mouseUp
