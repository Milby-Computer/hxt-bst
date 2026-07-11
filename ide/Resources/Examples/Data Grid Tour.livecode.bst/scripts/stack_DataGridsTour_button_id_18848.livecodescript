Script "stack_DataGridsTour_button_id_18848"

/*
# Name: button "step4" of card "Table" of stack "DataGridsTour"
# ID: button id 18848 of card id 5536 of stack "DataGridsTour"
# Hash: FpfuEBtAhcSMpw54fRa3yA==
*/


on mouseUp
   lock screen
   resetDemonstration
   
   ## These action handlers can be found in the card script 
   columnsSetNames
   loadData
   columnsSetLook
   columnsSetOrder
   
   stepSet 4
   unlock screen
end mouseUp
