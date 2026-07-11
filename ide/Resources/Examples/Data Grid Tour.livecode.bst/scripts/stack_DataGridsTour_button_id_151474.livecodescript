Script "stack_DataGridsTour_button_id_151474"

/*
# Name: button "step5" of card "Table" of stack "DataGridsTour"
# ID: button id 151474 of card id 5536 of stack "DataGridsTour"
# Hash: yxbAZJHtSqx9GbQT7lpQgA==
*/


on mouseUp
   lock screen
   resetDemonstration
   
   ## These action handlers can be found in the card script 
   columnsSetNames
   loadData
   columnsSetLook
   columnsSetOrder
   columnsAddFlags
   
   stepSet 5
   unlock screen
end mouseUp
