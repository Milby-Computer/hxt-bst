Script "stack_revPreferencesGUI_card_id_1009"

/*
# Name: card "Object Sizes" of stack "revPreferencesGUI"
# ID: card id 1009 of stack "revPreferencesGUI"
# Hash: SoAOhk+6awpWjO+0WoT/Ng==
*/


on preOpenCard
   updateDefaultSizeFields
end preOpenCard

command updateDefaultSizeFields
  repeat for each line tDefaultSize in the cDefaultSizes of stack "revPreferences"
    local tName
    put item 1 of tDefaultsize into tName
    put the tName of stack "revPreferences" into field tName of group "Object Sizes" of me
  end repeat
end updateDefaultSizeFields
