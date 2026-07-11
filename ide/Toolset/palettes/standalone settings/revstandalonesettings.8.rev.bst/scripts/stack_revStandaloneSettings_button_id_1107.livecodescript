Script "stack_revStandaloneSettings_button_id_1107"

/*
# Name: button "Choose..." of group "choose" of group "OSX" of card "OS X" of stack "revStandaloneSettings"
# ID: button id 1107 of group id 1284 of group id 1221 of card id 1015 of stack "revStandaloneSettings"
# Hash: KWrbe7Vpvuz66jBEJU7vNA==
*/


on mouseUp
  if the platform is "Win32" 
  then put "PLIST Files" & cr & "*.plist" into tFilter
  else put empty into tFilter
  answer file "Select a file:" with filter tFilter
  if it is empty then exit mouseUp
  put it into tFile
  set the itemDel to "/"
  put item 1 to -2 of the fileName of stack (the cRevTargetStack of this stack)&"/" into tMainStackPath
  put the number of chars of tMainStackPath into tChars
  if char 1 to tChars of tFile = tMainStackPath then delete char 1 to tChars of tFile
  put tFile into fld "plist"
  send closeField to fld "plist"
end mouseUp
