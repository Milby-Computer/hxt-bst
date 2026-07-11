Script "stack_revPreferencesGUI_group_id_1017"

/*
# Name: group "Options in Properties palettes are labeled with:" of card "General" of stack "revPreferencesGUI"
# ID: group id 1017 of card id 1002 of stack "revPreferencesGUI"
# Hash: 0QtkUEN+dNaOkDF4utUxJA==
*/


on mouseUp  
  if the owner of the target is not me then pass mouseUp
  revUpdateLanguageNamePref
end mouseUp

on revUpdateLanguageNamePref
  global gREVLanguageNames
  if the hilite of btn "Language names on properties" of cd "general" is true then
    put true into gREVLanguageNames
  else
    put false into gREVLanguageNames
  end if
  set the cLanguageNames of cd 1 of stack "revPreferences" to gREVLanguageNames
  send "selectedObjectChanged" to stack "revBackScriptLibrary"
  ideCorePropertyInspectorRefreshPropertyLabels
end revUpdateLanguageNamePref
