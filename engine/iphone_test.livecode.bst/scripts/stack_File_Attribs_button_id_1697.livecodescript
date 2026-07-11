Script "stack_File_Attribs_button_id_1697"

/*
# Name: button "Start New W Text" of card "Activity Indicator" of stack "File Attribs"
# ID: button id 1697 of card id 1605 of stack "File Attribs"
# Hash: 7Xt5hD8vCGS+UAqr+Zbw3A==
*/


on mouseUp
   mobileStartBusyIndicator "square", "Hello, there"
   //mobileStartBusyIndicator "square"
   wait for 5000 milliseconds
   mobileStopBusyIndicator
end mouseUp
