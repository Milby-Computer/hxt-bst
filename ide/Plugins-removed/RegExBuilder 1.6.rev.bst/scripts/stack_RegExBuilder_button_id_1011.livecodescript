Script "stack_RegExBuilder_button_id_1011"

/*
# Name: button "Pattern:" of card id 1002 of stack "RegExBuilder"
# ID: button id 1011 of card id 1002 of stack "RegExBuilder"
# Hash: C4Z2fjZ2FjTUmM4muXyCJA==
*/


on mouseDown
  if the the selectedField is not "Field 4"
  then select after text of fld 4
end mouseDown

on menuPick what
  get line the menuHistory of me of the cRegExList of me
  put item 1 of it into selection
  put the selectedChunk into temp
  subtract item 2 of it from word 2 of temp
  subtract item 3 of it from word 4 of temp
  select temp
end menuPick
