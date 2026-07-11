Script "stack_testInputLib"

/*
# Name: stack "testInputLib" of stack "livecodeTestInterface"
# ID: stack "testInputLib" of stack "livecodeTestInterface"
# Hash: npgpFXOh/Hedu0ekDNS0ew==
*/


local sTestStrings, sTestNumbers, sTestConversionStrings, sTestFilePaths, sArrayData

on setUpValues
   //load in strings
   local tStringsPath, tStrings
   put qualityResourcePath() & "testStrings.txt" into tStringsPath
   put url ("file:" & tStringsPath) into tStrings
   
   // Remove BOM
   local tType, tNumber
   delete char 1 to 3 of tStrings
   
   set the itemDel to tab
   repeat with x = 2 to the number of lines in tStrings
      put item 1 of line x of tStrings into tType
      put item 2 of line x of tStrings into tNumber
      
      put item 3 of line x of tStrings into sTestStrings[tType][tNumber][item 3 of line 1 of tStrings]
      put item 4 of line x of tStrings into sTestStrings[tType][tNumber][item 4 of line 1 of tStrings]
      put item 5 of line x of tStrings into sTestStrings[tType][tNumber][item 5 of line 1 of tStrings]
      put item 6 of line x of tStrings into sTestStrings[tType][tNumber][item 6 of line 1 of tStrings]
   end repeat
   
   
   //load in numbers
   local tNumbersPath, tNumbers
   --put "C:/Projects/Test System UI/resourceFiles/testNumbers.txt" into tNumbersPath
   put qualityResourcePath() & "testNumbers.txt" into tNumbersPath
   put url ("file:" & tNumbersPath) into tNumbers
   
   // Remove BOM
   delete char 1 to 3 of tNumbers
   
   set the itemDel to tab
   repeat for each line tLine in tNumbers
      put item 2 of tLine into sTestNumbers[item 1 of tLine][1]
      put item 3 of tLine into sTestNumbers[item 1 of tLine][2]
   end repeat
   
   // Load in conversion strings
   local tConversionStringsPath, tConversionStrings
   put qualityResourcePath() & "testConversionStrings.txt" into tConversionStringsPath
   put url ("file:" & tConversionStringsPath) into tConversionStrings
   
   // Remove BOM
   delete char 1 to 3 of tConversionStrings   
   set the itemDel to tab
   repeat for each line tLine in tConversionStrings
      put item 2 of tLine into sTestConversionStrings[item 1 of tLine]["lowerCase"]
      put item 3 of tLine into sTestConversionStrings[item 1 of tLine]["upperCase"]
      put item 4 of tLine into sTestConversionStrings[item 1 of tLine]["lowerCaseNumber"]
      put item 5 of tLine into sTestConversionStrings[item 1 of tLine]["upperCaseNumber"]
      put item 6 of tLine into sTestConversionStrings[item 1 of tLine]["lowerCaseByte"]
      put item 7 of tLine into sTestConversionStrings[item 1 of tLine]["upperCaseByte"]
   end repeat
   
   // Load in file paths
   local tFilePathsPath, tFilePaths
   put qualityResourcePath() & "testFilePaths.txt" into tFilePathsPath
   put url ("file:" & tFilePathsPath) into tFilePaths
   
   // Remove BOM
   delete char 1 to 3 of tFilePaths   
   set the itemDel to tab
   repeat for each line tLine in tFilePaths
      put item 2 of tLine into sTestFilePaths[item 1 of tLine]
   end repeat
   
   // Load in array data
   local tArrayDataPath, tArrayData
   put qualityResourcePath() & "testArrayData.txt" into tArrayDataPath
   put url ("file:" & tArrayDataPath) into tArrayData
   
   // Remove BOM
   delete char 1 to 3 of tArrayData   
   set the itemDel to tab
   repeat for each line tLine in tArrayData
      put item 2 to -1 of tLine into sArrayData[item 1 of tLine]
   end repeat
end setUpValues

function testString pType,pNumber, pValue
   return sTestStrings[pType][pNumber][pValue]
end testString

function testNumber pType,pNumber
   return sTestNumbers[pType][pNumber]
end testNumber

function testConversionString pStringType, pConversionType
   return sTestConversionStrings[pStringType][pConversionType]
end testConversionString

function testFilePath pType
   return sTestFilePaths[pType]
end testFilePath

function testFolderList
   local tFileList
   repeat for each element tFile in sTestFilePaths
      put tFile & return after tFileList
   end repeat
   delete the last character of tFileList
   return tFileList
end testFolderList

function testFileList
   local tFileList
   repeat for each element tFile in sTestFilePaths
      put tFile & ".txt" & return after tFileList
   end repeat
   delete the last character of tFileList
   return tFileList
end testFileList

function testArrayData pKey
   return sArrayData[pKey]
end testArrayData
