Script "stack_File_Attribs_button_id_1260"

/*
# Name: button "Create" of card "Native Controls" of stack "File Attribs"
# ID: button id 1260 of card id 1258 of stack "File Attribs"
# Hash: CGveyNPj8z6UTZy59Ie/Cg==
*/


on mouseUp
   local tId
   iphoneControlCreate the label of button "Control Type", field "Control Name"
   put the result into tId
   put "Created:" && tId & return into field "Log"
   if tId is empty then
      exit mouseUp
   end if
   
   local tHandle
   if field "Control Name" is empty then
      put tId into tHandle
   else
      put field "Control Name" into tHandle
   end if
   
   put "Name:" && iphoneControlGet(tId, "name") & return after field "Log"
   put "Id:" && iphoneControlGet(tId, "id") & return after field "Log"
   
   put return after field "Log"
   put iphoneControls() & return after field "Log"
end mouseUp
