Script "stack_Browser_Sampler_button_id_1365"

/*
# Name: button "DeleteFile" of bkgnd "Files" of stack "Browser Sampler"
# ID: button id 1365 of bkgnd id 1353 of stack "Browser Sampler"
# Hash: +06bVblebwHxx8zbqGeinA==
*/


on mouseUp
  put selectedProject() into tProj
  put selectedFile() into tFileName
  altBusyNow true
  put altGoodFileName(tProj) into tProjName
  put tProjName & "/" & tFileName into tPath
  put altFTPdeleteFile(tPath) into tStatus
  altBusyNow false
  if tStatus is not empty then
    answer information tStatus
  end if
  
  put line (the menuHistory of btn "TabMenu") of btn "TabMenu" into tWhichTab
  send "doTab tWhichTab" to this cd
  
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
