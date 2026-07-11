Script "stack_File_Attribs_button_id_1135"

/*
# Name: button "Copy Gradient" of card "Gradient Bug" of stack "File Attribs"
# ID: button id 1135 of card id 1129 of stack "File Attribs"
# Hash: ijtcGz/zAT4ibLB+myo9XA==
*/


-- THIS APPLIES THE GRADIENT RELATIVE TO THE POSITION TO THE ORIGINAL GRAPHIC
-- IS THIS REALLY WHAT IS INTENDED? [Ed - Yes.]

on mouseUp
   set the fillgradient of graphic "testblock1" to the fillgradient of graphic "MasterBlock"
   set the fillgradient of graphic "testblock4" to the fillgradient of graphic "MasterBlock"
end mouseUp
