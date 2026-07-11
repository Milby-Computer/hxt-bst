Script "stack_SQLite_Sampler_button_id_1295"

/*
# Name: button "togglePaletteMode" of card "Introduction" of stack "SQLite Sampler"
# ID: button id 1295 of card id 1002 of stack "SQLite Sampler"
# Hash: 83grniPcShPXHLdudB5iqQ==
*/


on mouseUp
  if the mode of this stack is 1 then
    modeless this stack
  else
    toplevel this stack
  end if
end mouseUp
