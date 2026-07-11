Script "stack_File_Attribs_button_id_1056"

/*
# Name: button "Download to File" of card "URL functions" of stack "File Attribs"
# ID: button id 1056 of card id 1053 of stack "File Attribs"
# Hash: DkL+FdPwN5MDkB1ZLjP3MA==
*/


on mouseUp
   put empty into the last field
   libUrlDownloadToFile binURL(), specialFolderPath("documents") & slash & "download.zip", "urlDownloadStatus"
   put "started download of" && binURL() & return after the last field
end mouseUp

on urlDownloadStatus pUrl, pStatus
   put pStatus && pUrl & return after the last field
end urlDownloadStatus
