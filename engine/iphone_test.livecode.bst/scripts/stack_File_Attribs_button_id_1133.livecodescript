Script "stack_File_Attribs_button_id_1133"

/*
# Name: button "Set to White" of card "Gradient Bug" of stack "File Attribs"
# ID: button id 1133 of card id 1129 of stack "File Attribs"
# Hash: EVw8AfD4flxOwK6YEBWoKg==
*/


-- WHEN I ONLY SET THE FIRST THREE BLOCKS WHITE, IT SHOWS THE
-- STRANGE BEHAVIOR ON THE IPAD EVEN CLEARER.
-- THE BLOCKS THAT HAVE NO GRADIENT, GET NO GRADIENT WHEN THE TOP TWO BUTTONS
-- ARE USED AGAIN.

on mouseUp
   set the backgroundcolor of graphic "testblock1" to white 
end mouseUp
