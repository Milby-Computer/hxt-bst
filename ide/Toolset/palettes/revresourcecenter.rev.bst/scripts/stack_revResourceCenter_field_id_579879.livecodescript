Script "stack_revResourceCenter_field_id_579879"

/*
# Name: field "Margin" of group "Example" of group id 579880 of group "mainContent" of card "FittingaPrintouttothePage" of stack "revResourceCenter"
# ID: field id 579879 of group id 577042 of group id 579880 of group id 77984 of card id 77973 of stack "revResourceCenter"
# Hash: sj+3e4vkiAfG9VflItPrlw==
*/


local savedNumber

on openField
  put me into savedNumber
end openField

on closeField
  if me is not a number and me is not empty then
    put savedNumber into me
    beep
    answer "This field must be a number."
    select text of me
  end if
end closeField
