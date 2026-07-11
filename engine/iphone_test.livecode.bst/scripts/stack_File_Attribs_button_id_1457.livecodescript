Script "stack_File_Attribs_button_id_1457"

/*
# Name: button "Get Current Heading" of card "Heading and Location" of stack "File Attribs"
# ID: button id 1457 of card id 1437 of stack "File Attribs"
# Hash: 90KKT9/E8Tr8cyQOg0fnvg==
*/


on mouseUp
   local tHeadingContent, tHeadingString, tKey
   put iphoneCurrentHeading() into tHeadingContent
   repeat for each key tKey in tHeadingContent
      put tKey && tHeadingContent[tKey] & return after tHeadingString
   end repeat
   put tHeadingString into field "headingField"
end mouseUp
