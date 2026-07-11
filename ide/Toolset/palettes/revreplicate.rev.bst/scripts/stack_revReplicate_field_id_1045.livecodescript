Script "stack_revReplicate_field_id_1045"

/*
# Name: field "vScale" of card id 1002 of stack "revReplicate"
# ID: field id 1045 of card id 1002 of stack "revReplicate"
# Hash: Sac7TRzQlVyP4MA3ERe1rQ==
*/


local lOldLabel

on openField
  put the text of me into lOldLabel
end openField

on closeField
  put the text of me into tNewLabel
  if tNewlabel is 0 then exit closeField
  if fld "hScale" is 0 then exit closeField
  if lOldLabel is 0 then openField
  put (tNewLabel / lOldLabel) into tFactor
  if the iconState of btn "offsetLockButton" is locked then set the text of fld "hScale" to round(fld "hScale" * tFactor)
end closeField

on rawKeyDown
  openField
  pass rawKeydown
end rawKeyDown

on rawKeyUp
  closeField
end rawKeyUp

