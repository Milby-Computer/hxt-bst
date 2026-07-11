Script "stack_revGettingStartedScripts_field_id_1034"

/*
# Name: field "Second Number" of group "Compare numbers approximately Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1034 of group id 1031 of card id 1002 of stack "revGettingStartedScripts"
# Hash: JvOztaHbNYlSFOmMSBSftQ==
*/


local savedNumber

on openField
  put me into savedNumber
end openField

on closeField
  if me is not a number or me is empty then
    put savedNumber into me
    beep
    answer "This field must be a number."
    select text of me
  end if
end closeField
