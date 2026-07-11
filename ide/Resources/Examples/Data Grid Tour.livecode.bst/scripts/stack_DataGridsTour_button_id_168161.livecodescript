Script "stack_DataGridsTour_button_id_168161"

/*
# Name: button "step2" of card "Form" of stack "DataGridsTour"
# ID: button id 168161 of card id 5539 of stack "DataGridsTour"
# Hash: UodCd5beuU5V+WH0efnjGw==
*/


on mouseUp
   lock screen
   resetDemonstration
   
   ## These action handlers can be found in the card script 
   formatForm
   loadData
   
   stepSet 2
   unlock screen
end mouseUp
