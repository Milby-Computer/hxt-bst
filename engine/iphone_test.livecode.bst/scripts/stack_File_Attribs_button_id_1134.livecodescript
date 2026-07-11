Script "stack_File_Attribs_button_id_1134"

/*
# Name: button "Move and Copy" of card "Gradient Bug" of stack "File Attribs"
# ID: button id 1134 of card id 1129 of stack "File Attribs"
# Hash: 3YSi654ArQq4pylG7I8q0A==
*/


-- IF I MOVE THE GRAPHIC BEFORE APPLYIG THE GRADIENT, THEN MOVE IT BACK
-- THEN I GET A COPY OF THE GRADIENT.

on mouseUp
   moveandCopy "testblock1"
   moveandCopy "testblock4"
end mouseUp


on moveandcopy graphicName
   local oldLoc
   put the loc of graphic graphicName into oldLoc
   set the loc of graphic graphicName to the loc of graphic "MasterBlock"
   set the fillgradient of graphic graphicName to the fillgradient of graphic "MasterBlock"
   set the loc of graphic graphicName to oldLoc
end moveandcopy
