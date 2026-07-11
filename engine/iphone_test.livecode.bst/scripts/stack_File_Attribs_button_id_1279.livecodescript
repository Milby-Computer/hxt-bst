Script "stack_File_Attribs_button_id_1279"

/*
# Name: button "Wait" of card "Clear Touches" of stack "File Attribs"
# ID: button id 1279 of card id 1272 of stack "File Attribs"
# Hash: ymkxf3FK2p1WDPMJvpBvnA==
*/


on mouseUp
   put empty into field "Log"
   wait 3 seconds
   if the hilite of button "Clear" then
      iphoneClearTouches
   end if
end mouseUp
