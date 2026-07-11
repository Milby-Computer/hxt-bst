Script "stack_File_Attribs_card_id_1437"

/*
# Name: card "Heading and Location" of stack "File Attribs"
# ID: card id 1437 of stack "File Attribs"
# Hash: feK4mMEMCLZUpxjp3a25sw==
*/


on headingChanged
   local tHeadingContent, tHeadingString, tKey
   put iphoneCurrentHeading() into tHeadingContent
   repeat for each key tKey in tHeadingContent
      put tKey && tHeadingContent[tKey] & return after tHeadingString
   end repeat
   put tHeadingString into field "headingField" 
end headingChanged

on locationChanged
   local tLocationContent, tLocationString, tKey
   put iphoneCurrentLocation() into tLocationContent
   repeat for each key tKey in tLocationContent
      put tKey && tLocationContent[tKey] & return after tLocationString
   end repeat
   put tLocationString into field "locationField" 
end locationChanged
