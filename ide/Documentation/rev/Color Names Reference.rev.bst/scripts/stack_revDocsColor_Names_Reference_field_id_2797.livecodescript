Script "stack_revDocsColor_Names_Reference_field_id_2797"

/*
# Name: field "RGB" of card "Color Chart" of stack "revDocsColor Names Reference"
# ID: field id 2797 of card id 1002 of stack "revDocsColor Names Reference"
# Hash: iVW4/fEEg3SUzjc0+nIfuw==
*/


on mouseDown
  get text of the target
  delete word 1 of it
  put quote & it & quote into field "Copy Container"
  select text of field "Copy Container"
  copy
end mouseDown
