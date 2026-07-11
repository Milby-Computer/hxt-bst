Script "stack_File_Attribs_button_id_1021"

/*
# Name: button "Get Stats" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1021 of card id 1009 of stack "File Attribs"
# Hash: scxl66TPoFo8c2A1x8VlXA==
*/


on mouseUp
   local tStats
   put the processor into tStats["processor"]
   put the machine into tStats["machine"]
   put the address into tStats["address"]
   put the systemVersion into tStats["systemVersion"]
   put the version into tStats["engineVersion"]
   put the buildnumber into tStats["buildNumber"]
   put the screenRect into tStats["screenrect"]
   put the working screenRect into tStats["working screenRect"]
   put specialFolderPath("engine") into tStats["engine path"]
   put iphoneDeviceResolution() into tStats["resolution"]
   put iPhoneCurrentLocale() into tStats["locale"]
   put iphoneApplicationIdentifier() into tStats["appId"]
   combine tStats with return and "="
   put tStats into the last field
end mouseUp
