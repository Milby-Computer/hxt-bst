Script "stack_revReplicate_field_id_1044"

/*
# Name: field "hScale" of card id 1002 of stack "revReplicate"
# ID: field id 1044 of card id 1002 of stack "revReplicate"
# Hash: RDlQmkl0iWioEsF1tqY8iQ==
*/


local lOldLabel

on openField
  put the text of me into lOldLabel
end openField

on closeField
  put the text of me into tNewLabel
  if tNewlabel is 0 then exit closeField
  if fld "vScale" is 0 then exit closeField
  if lOldLabel is 0 then openField
  put (tNewLabel / lOldLabel) into tFactor
  if the iconState of btn "offsetLockButton" is locked then set the text of fld "vScale" to round(fld "vScale" * tFactor)
end closeField

on rawKeyDown
  openField
  pass rawKeydown
end rawKeyDown

on rawKeyUp
  closeField
end rawKeyUp
