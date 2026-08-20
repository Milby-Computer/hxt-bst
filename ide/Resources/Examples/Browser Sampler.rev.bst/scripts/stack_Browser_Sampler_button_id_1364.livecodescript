Script "stack_Browser_Sampler_button_id_1364"

/*
# Name: button "EditFile" of bkgnd "Files" of stack "Browser Sampler"
# ID: button id 1364 of bkgnd id 1353 of stack "Browser Sampler"
# Hash: kph4zXXb047VD+5TYquulA==
*/


on mouseUp
  put selectedFile() into tFileName
  altBusyNow true
  put altLoadFileToVar(tFileName) into tData
  altBusyNow false
  if tData is "Error" then
    answer information "Error accessing file."
    exit mouseUp
  end if
  put tData into fld "theText" of stack "libAltShareTextEdit"
   
  modal "libAltShareTextEdit"
  put the dialogData into tNewData
  if tNewData is "Cancel" then exit mouseUp
  altBusyNow true
  get altLoadVarToFile(tFileName,tNewData)
  altBusyNow false
  if it is "Error" then
    answer information "Error uploading file."
    exit mouseUp
  end if
end mouseUp

function selectedFile
  put the hilitedline of fld "theFiles" into tLineNum
  if tLineNum is "" then
    answer information "Please select a file."
    exit to top
  end if
  set itemDel to tab
  return item 1 of line tLineNum of fld "theFiles"
end selectedFile
