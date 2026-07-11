Script "stack_Print_Dialog_group_id_1080"

/*
# Name: group "Range" of card id 1002 of stack "Print Dialog"
# ID: group id 1080 of card id 1002 of stack "Print Dialog"
# Hash: 6NxyOCDmU1IWmzlpaX3yPg==
*/


on mouseUp
  if the hilite of button "Page range select" is true then
    set the enabled of field "Pages" to true
  else
    set the enabled of field "Pages" to false
  end if
  pass mouseUp
end mouseUp


 
 
