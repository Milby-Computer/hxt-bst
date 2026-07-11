Script "stack_DataGridsTour_button_id_18846"

/*
# Name: button "step1" of card "Table" of stack "DataGridsTour"
# ID: button id 18846 of card id 5536 of stack "DataGridsTour"
# Hash: ITzeYu3tDidd08N6cCV8mg==
*/


on mouseUp
   lock screen
   resetDemonstration
   
   ## The load data handler found on the card script inserts
   ## our data into the data grid
   loadData
   
   stepSet 1
   unlock screen
end mouseUp
