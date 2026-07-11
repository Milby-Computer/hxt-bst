Script "stack_File_Attribs_card_id_1807"

/*
# Name: card "Ads" of stack "File Attribs"
# ID: card id 1807 of stack "File Attribs"
# Hash: gc9kf+jMWYH/C2O7Fa7Ieg==
*/


on adLoaded pAdd, pDefault
   put "Add" && pAdd && "loaded - default:" && pDefault & return before field "log"
end adLoaded

on adClicked pAdd
   put "Add" && pAdd && "clicked" & return before field "log"
end adClicked

on adLoadFailed pAdd
   put "Add" && pAdd && "load failed" & return before field "log"
end adLoadFailed
