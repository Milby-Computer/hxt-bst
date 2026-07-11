Script "stack_Font_Loading_Sampler_field_id_1006"

/*
# Name: field "fontNames" of card "card id 1002" of stack "Font Loading Sampler"
# ID: field id 1006 of card id 1002 of stack "Font Loading Sampler"
# Hash: 0bqB1/dvNYk7IPhS6XEy2Q==
*/


on mouseUp
  put selectedFont() into tFont
  set the textFont of fld "Sample" to tFont
end mouseUp

function selectedFont
  put the hilitedlines of fld "fontNames" into tNum
  if tNum is empty then
    answer "Please select a font"
    exit to top
  end if
  return line tNum of fld "fontNames"
end selectedFont



