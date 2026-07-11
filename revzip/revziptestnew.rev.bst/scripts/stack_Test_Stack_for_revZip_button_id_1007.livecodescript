Script "stack_Test_Stack_for_revZip_button_id_1007"

/*
# Name: button ".." of card id 1002 of stack "Test Stack for revZip"
# ID: button id 1007 of card id 1002 of stack "Test Stack for revZip"
# Hash: 1ozFVGah3Q5MK2N/U40rgQ==
*/


on mouseUp
  answer file "Please choose archive"
  if it is not empty then
    put it into field "Archive To Open"
  end if
end mouseUp
