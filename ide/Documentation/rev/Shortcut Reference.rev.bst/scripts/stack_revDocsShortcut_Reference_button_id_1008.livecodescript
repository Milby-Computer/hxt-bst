Script "stack_revDocsShortcut_Reference_button_id_1008"

/*
# Name: button "Print Shortcut Reference" of card id 1002 of stack "revDocsShortcut Reference"
# ID: button id 1008 of card id 1002 of stack "revDocsShortcut Reference"
# Hash: u6aFL0+WI3PF5riQ7lCuPg==
*/


on mouseUp
  revShowPrintDialog true,false
  revPrintField the long id of fld "doc"
end mouseUp
