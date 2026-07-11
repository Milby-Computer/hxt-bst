Script "stack_revReplicate_field_id_1043"

/*
# Name: field "vOffset" of card id 1002 of stack "revReplicate"
# ID: field id 1043 of card id 1002 of stack "revReplicate"
# Hash: Egm9YGnfvw/hJJlLmaaoxg==
*/


local lOldLabel

on openField
  put the text of me into lOldLabel
end openField

on closeField
  put the text of me into tNewLabel
  if tNewlabel is 0 then exit closeField
  if fld "hOffset" is 0 then exit closeField
  if lOldLabel is 0 then openField
  put (tNewLabel / lOldLabel) into tFactor
  if the iconState of btn "offsetLockButton" is locked then set the text of fld "hOffset" to round(fld "hOffset" * tFactor)
end closeField

on rawKeyDown
  openField
  pass rawKeydown
end rawKeyDown

on rawKeyUp
  closeField
end rawKeyUp
