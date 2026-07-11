Script "stack_File_Attribs_button_id_1690"

/*
# Name: button "Start New" of card "Activity Indicator" of stack "File Attribs"
# ID: button id 1690 of card id 1605 of stack "File Attribs"
# Hash: OOk/b3W2XUcsmzAI0flZUA==
*/


on mouseUp
   mobileStartBusyIndicator "square"
   //mobileStartBusyIndicator "square"
   wait for 5000 milliseconds
   mobileStopBusyIndicator
end mouseUp
