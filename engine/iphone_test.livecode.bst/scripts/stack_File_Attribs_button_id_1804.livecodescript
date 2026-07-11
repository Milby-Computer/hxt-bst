Script "stack_File_Attribs_button_id_1804"

/*
# Name: button "Resume" of card "Multi Channel Sound" of stack "File Attribs"
# ID: button id 1804 of card id 1782 of stack "File Attribs"
# Hash: Jj+apx09mTH7IqMduCjieA==
*/


on mouseUp
   mobileResumePlayingOnChannel the label of button "channel"
   if the result is not empty then
      put the result & return before field 1
   end if
end mouseUp
