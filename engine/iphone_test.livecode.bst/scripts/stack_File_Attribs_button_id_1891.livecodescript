Script "stack_File_Attribs_button_id_1891"

/*
# Name: button "Add Event" of card "Calendar" of stack "File Attribs"
# ID: button id 1891 of card id 1887 of stack "File Attribs"
# Hash: sMoxTH4s7ibNg81BU1IYsA==
*/


on mouseUp
   local tItemFound
   mobileAddEvent "calendar", "home", "title", "The Homes", "note", "The Note", "allday", "false", "startdate", the seconds + 180, "enddate", the seconds + 1180, "alert1", 60, "alert2", 120, "frequency", "daily", "frequencyinterval", "2", "frequencycount", "3", "location", "in the sticks"
   put the result into tItemFound
   if tItemFound is empty then
      answer "No Records Found" with "Okay"
   else
      answer "Found Record:" && tItemFound with "Okay"
      put tItemFound into field "InputData ID"
   end if  
end mouseUp
