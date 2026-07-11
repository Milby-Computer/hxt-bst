Script "stack_Print_Dialog_button_id_1038"

/*
# Name: button "Cancel" of card id 1002 of stack "Print Dialog"
# ID: button id 1038 of card id 1002 of stack "Print Dialog"
# Hash: spCWgKU/RiPuPkm3WQ5M8w==
*/


on mouseUp
  restorePreviousPrinterSettings
  set the dialogData to "cancel"
  close this stack
end mouseUp
