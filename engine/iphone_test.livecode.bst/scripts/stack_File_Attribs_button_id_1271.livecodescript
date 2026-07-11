Script "stack_File_Attribs_button_id_1271"

/*
# Name: button "Delete All" of card "Native Controls" of stack "File Attribs"
# ID: button id 1271 of card id 1258 of stack "File Attribs"
# Hash: G/pLE5stP84dsw2OTXV4ag==
*/


on mouseUp
   repeat while iphoneControls() is not empty
      iphoneControlDelete line 1 of iphoneControls()
   end repeat
end mouseUp
