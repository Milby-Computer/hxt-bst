Script "stack_Color_Chooser_field_id_1067"

/*
# Name: field "Color Names" of bkgnd "Name" of stack "Color Chooser"
# ID: field id 1067 of bkgnd id 1190 of stack "Color Chooser"
# Hash: IiFK52qVnDh/04lirwsq3Q==
*/


on mouseUp
  get the clickText
  setcolor it
  put it into field "Color Name"
end mouseUp
