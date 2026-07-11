Script "stack_revPreferencesGUI_field_id_1032"

/*
# Name: field "http proxy" of group id 1029 of group "General" of card "General" of stack "revPreferencesGUI"
# ID: field id 1032 of group id 1029 of group id 1016 of card id 1002 of stack "revPreferencesGUI"
# Hash: uHYRqCsENjUFoy26r0i1tg==
*/


on closeField
  set the httpProxy to the text of me
  set the cHttpProxy of stack "revPreferences" to the text of me
end closeField
