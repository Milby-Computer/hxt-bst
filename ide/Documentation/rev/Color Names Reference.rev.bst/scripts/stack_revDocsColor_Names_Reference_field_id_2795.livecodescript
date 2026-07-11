Script "stack_revDocsColor_Names_Reference_field_id_2795"

/*
# Name: field "Color Name" of card "Color Chart" of stack "revDocsColor Names Reference"
# ID: field id 2795 of card id 1002 of stack "revDocsColor Names Reference"
# Hash: 63ESgq18BI0GIM/fm0uoiQ==
*/


on mouseDown
  put quote & text of the target & quote into field "Copy Container"
  select text of field "Copy Container"
  copy
end mouseDown
