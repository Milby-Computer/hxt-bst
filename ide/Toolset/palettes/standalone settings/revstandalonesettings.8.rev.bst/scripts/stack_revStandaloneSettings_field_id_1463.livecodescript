Script "stack_revStandaloneSettings_field_id_1463"

/*
# Name: field "Destination" of group "Destination Group" of group id 1466 of card "Copy Files" of stack "revStandaloneSettings"
# ID: field id 1463 of group id 1467 of group id 1466 of card id 1027 of stack "revStandaloneSettings"
# Hash: OpSb6OJ73TgjvI7pn+s9gg==
*/


on closeField
  checkField
end closeField

on returnInField
  checkField
end returnInField

on tabKey
  checkField
end tabKey

on checkField
  -- Checks here should be improved.
  if the text of me is empty then
    answer "Cannot set the destination folder to empty, reverting to default."
    put "_ReferencedFiles" into me
  end if
  setProps
end checkField




