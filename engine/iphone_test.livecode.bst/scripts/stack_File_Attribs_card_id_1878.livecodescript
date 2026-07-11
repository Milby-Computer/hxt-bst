Script "stack_File_Attribs_card_id_1878"

/*
# Name: card id 1878 of stack "File Attribs"
# ID: card id 1878 of stack "File Attribs"
# Hash: xslmuhZA1qyPzHbrvj4v3w==
*/


local sTestFile = "attrib_test.file"

on doCreateTestFile
   put specialFolderPath("Documents") & slash & "attib_test.file" into sTestFile
   put "test data" into url ("binfile:" & sTestFile)
end doCreateTestFile

on doSetFileProtection pProtection
   iphoneSetFileDataProtection sTestFile, pProtection
end doSetFileProtection

on doShowFileProtection
   answer "file protection: " & iphoneFileDataProtection(sTestFile)
end doShowFileProtection


on doSetNoBackup pNoBackup
   iphoneSetDoNotBackupFile sTestFile, pNoBackup
end doSetNoBackup

on doShowNoBackup
   answer "do not backup: " & iphoneDoNotBackupFile(sTestFile)
end doShowNoBackup
