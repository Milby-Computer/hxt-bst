Script "stack_Font_Loading_Sampler_button_id_1010"

/*
# Name: button "Unload Font" of card "card id 1002" of stack "Font Loading Sampler"
# ID: button id 1010 of card id 1002 of stack "Font Loading Sampler"
# Hash: kR4TlJ04R5Vgk3P+ju29xg==
*/


on mouseUp
  answer file "choose a ttf file to unload"
  if it is empty then 
    exit mouseUp
  end if
  revFontUnload it
  get the result
  if it is not empty then 
    answer warning it
  end if
  put empty into fld "fontNames"
  -- Now reload the fontNames, selecting any of these to display...
  loadFontnames (line 1 of the fontNames)
end mouseUp
