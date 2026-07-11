Script "stack_revPreferencesGUI_card_id_1007"

/*
# Name: card "Sizes" of stack "revPreferencesGUI"
# ID: card id 1007 of stack "revPreferencesGUI"
# Hash: VXZDB0yVUPOpED09rULirg==
*/


on preOpenCard
   updateDefaultSizeFields
end preOpenCard

command updateDefaultSizeFields
  repeat for each line tDefaultSize in the cDefaultSizes of stack "revPreferences"
    local tName
    put item 1 of tDefaultsize into tName
    put the tName of stack "revPreferences" into field tName #of group "Object Sizes" of me
  end repeat
end updateDefaultSizeFields


on OpenCard
   hxtSetTheHeightOfThisStackTo 380
end OpenCard


