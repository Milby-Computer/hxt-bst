Script "stack_File_Attribs_button_id_1455"

/*
# Name: button "Get Current Location" of card "Heading and Location" of stack "File Attribs"
# ID: button id 1455 of card id 1437 of stack "File Attribs"
# Hash: 0Z2Iyes//bqnLvqhFK8PGw==
*/


on mouseUp
   local tLocationContent, tLocationString, tKey
   put iphoneCurrentLocation() into tLocationContent
   repeat for each key tKey in tLocationContent
      put tKey && tLocationContent[tKey] & return after tLocationString
   end repeat
   put tLocationString into field "locationField"
end mouseUp
