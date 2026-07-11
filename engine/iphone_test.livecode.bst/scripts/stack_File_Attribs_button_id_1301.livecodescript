Script "stack_File_Attribs_button_id_1301"

/*
# Name: button "Play" of card "Play Movie" of stack "File Attribs"
# ID: button id 1301 of card id 1113 of stack "File Attribs"
# Hash: IkQSPb5yH9VVTRpsHdIr1g==
*/


on mouseUp
   try
      set the showController of the templatePlayer to the hilite of button "Controller"
      set the playSelection of the templatePlayer to the hilite of button "Selection"
      if the playSelection of the templatePlayer then
         set the startTime of the templatePlayer to the thumbPosition of scrollbar "Start Time"
         set the endTime of the templatePlayer to the thumbPosition of scrollbar "End Time"
      end if
      do "play video specialFolderPath(" & quote & "engine" & quote & ") & slash & " & quote & "quicktime.mp4" & quote
   catch tError
      answer tError
   end try
end mouseUp
