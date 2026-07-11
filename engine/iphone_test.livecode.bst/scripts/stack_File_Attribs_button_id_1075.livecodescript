Script "stack_File_Attribs_button_id_1075"

/*
# Name: button "StatusBarDisplayed" of card "Status Bar Configuration" of stack "File Attribs"
# ID: button id 1075 of card id 1073 of stack "File Attribs"
# Hash: jkdvJw4I3iaXCuZwz7cuMA==
*/


on mouseUp
   if the hilite of button "StatusBarDisplayed" is true then
      iphoneShowStatusBar
   else
      iphoneHideStatusBar
      end if
end mouseUp
