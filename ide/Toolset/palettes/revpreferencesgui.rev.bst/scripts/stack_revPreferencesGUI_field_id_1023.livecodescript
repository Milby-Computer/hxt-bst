Script "stack_revPreferencesGUI_field_id_1023"

/*
# Name: field "http proxy" of card "General" of stack "revPreferencesGUI"
# ID: field id 1023 of card id 1002 of stack "revPreferencesGUI"
# Hash: uHYRqCsENjUFoy26r0i1tg==
*/


on closeField
  set the httpProxy to the text of me
  set the cHttpProxy of stack "revPreferences" to the text of me
end closeField
