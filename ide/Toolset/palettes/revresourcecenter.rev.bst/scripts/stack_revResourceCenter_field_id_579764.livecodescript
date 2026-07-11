Script "stack_revResourceCenter_field_id_579764"

/*
# Name: field "Second Number" of group "Example" of group id 113817 of group "mainContent" of card "CompareNumbersApproximately" of stack "revResourceCenter"
# ID: field id 579764 of group id 579761 of group id 113817 of group id 113822 of card id 113804 of stack "revResourceCenter"
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
