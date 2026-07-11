Script "stack_quality_card_id_1080"

/*
# Name: card "qualityGitHubInteraction" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1080 of stack "quality" of stack "livecodeTestInterface"
# Hash: UtRF6fv6kJX5wUvEHQCLXg==
*/


local lastCached

// Interaction with GitHub Installations on the File System
//--------------------------------------------
// The operation of this card can be updated in the future to take account of package.txt parsing
// rather than converting the contentent into copy statments.

on gitInitialize
   put empty into lastCached
   deleteGitHubCacheFiles
end gitInitialize

on lastBuiltGitCache
   return lastCached
end lastBuiltGitCache

//function makeInstallPath 

// Create a mapping of GitHub files that the test framework can process.
function mapGitHubCacheFiles pID, pPlatform
   local tCacheRoot, tEditionUp, tEditionLow, tIosInputFolders, tIosOutputFolders, tLine, tLineIndex
   // Get the edition we are currently running
   put "-" & line 3 of the revlicenseinfo into tEditionUp
   put toLower (tEditionUp) into tEditionLow
   put the cLiveCodeTestGitHubCache of stack "quality" into tCacheRoot
   answer there is a file (pID & "_build/mac/Release/Standalone" & tEditionUP & ".app") 
   
   if pPlatform contains "Android" and there is a file (pID & "_build/android/release/Standalone" & tEditionUp) then
      // Create mapping for Android.
      if there is no file (tCacheRoot & "Android/Standalone") then
         // Ensure the directories exist for Android.
         createAllFolders tCacheRoot & "Android/"
         // Copy the relevant files.
         // THE FOLLOWING DO NOT WORK YET
         revCopyFile pID & "_build/android/release/Standalone" & tEditionUp, tCacheRoot & "Android/Standalone"
         revCopyFile pID & "_build/android/release/RevZip", tCacheRoot & "Android/RevZip"
         revCopyFile pID & "_build/android/release/RevXml", tCacheRoot & "Android/RevXml"
         revCopyFile pID & "_build/android/release/RevDb", tCacheRoot & "Android/RevDb"
         revCopyFile pID & "_build/android/release/notify_icon.png", tCacheRoot & "Android/notify_icon.png"
         revCopyFile pID & "_build/android/release/Manifest.xml", tCacheRoot & "Android/Manifest.xml"
         revCopyFile pID & "_build/android/release/livecode_inputcontrol.xml", tCacheRoot & "Android/livecode_inputcontrol.xml"
         revCopyFile pID & "_build/android/release/DbSqlite", tCacheRoot & "Android/DbSqlite"
         revCopyFile pID & "_build/android/release/DbMysql", tCacheRoot & "Android/DbMysql"
         revCopyFile pID & "_build/android/release/Classes" & tEditionUp, tCacheRoot & "Android/Classes"   
      end if
   else if pPlatform is "Win32" and there is a file (pID & "_build/windows/release/standalone" & tEditionLow & ".exe") then
      // Create mapping for Windows.
      if there is no file (tCacheRoot & "Windows/x86-32/Standalone") then
         // Ensure the directories exist.
         createAllFolders tCacheRoot & "Windows/x86-32/Externals/Database Drivers/"
         createAllFolders tCacheRoot & "Windows/x86-32/Support/Sample Icons/"
         // Copy the relevant files.
         revCopyFile pID & "_build/windows/release/standalone" & tEditionLow & ".exe", tCacheRoot & "Windows/x86-32/Standalone" 
         revCopyFile pID & "_build/windows/release/genericdoc.ico", tCacheRoot & "Windows/x86-32/Support/Sample Icons/genericdoc.ico"        
         revCopyFile pID & "_build/windows/release/genericapp.ico", tCacheRoot & "Windows/x86-32/Support/Sample Icons/genericapp.ico"        
         revCopyFile pID & "_build/windows/release/revsecurity.dll", tCacheRoot & "Windows/x86-32/Support/revsecurity.dll"        
         revCopyFile pID & "_build/windows/release/revpdfprinter.dll", tCacheRoot & "Windows/x86-32/Support/revpdfprinter.dll"        
         revCopyFile pID & "_build/windows/release/revzip.dll", tCacheRoot & "Windows/x86-32/Externals/revzip.dll"
         revCopyFile pID & "_build/windows/release/revxml.dll", tCacheRoot & "Windows/x86-32/Externals/revxml.dll"
         revCopyFile pID & "_build/windows/release/revvideograbber.dll", tCacheRoot & "Windows/x86-32/Externals/revvideograbber.dll"
         revCopyFile pID & "_build/windows/release/revspeech.dll", tCacheRoot & "Windows/x86-32/Externals/revspeech.dll"
         revCopyFile pID & "_build/windows/release/revfont.dll", tCacheRoot & "Windows/x86-32/Externals/revfont.dll"
         revCopyFile pID & "_build/windows/release/revdb.dll", tCacheRoot & "Windows/x86-32/Externals/revdb.dll"
         revCopyFile pID & "_build/windows/release/Externals.txt", tCacheRoot & "Widows/x86-32/Externals/Externals.txt"
         revCopyFile pID & "_build/windows/release/dbsqlite.dll", tCacheRoot & "Windows/x86-32/Externals/Database Drivers/dbsqlite.dll"
         revCopyFile pID & "_build/windows/release/dbpstresql.dll", tCacheRoot & "Windows/x86-32/Externals/Database Drivers/dbpostgresql.dll"
         revCopyFile pID & "_build/windows/release/dboracle.dll", tCacheRoot & "Windows/x86-32/Externals/Database Drivers/dboracle.dll"
         revCopyFile pID & "_build/windows/release/dbodbc.dll", tCacheRoot & "Windows/x86-32/Externals/Database Drivers/dbodbc.dll"
         revCopyFile pID & "_build/windows/release/dbmysql.dll", tCacheRoot & "Windows/x86-32/Externals/Database Drivers/dbmysql.dll"
         revCopyFile pID & "_build/windows/release/Database Drivers.txt", tCacheRoot & "Windows/x86-32/Externals/Database Drivers/Database Drivers.txt"
      end if
   else if pPlatform is "Linux" and there is a file (pID & "_build/linux/i386/release/standalone" & tEditionLow) then
      // Create mapping for Linux.
      if there is no file (pID & tCacheRoot & "Linux/x86-32/Standalone") then
         // Ensure the directories exist.
         createAllFolders tCacheRoot & "Linux/x86-64/Externals/Database Drivers/"
         createAllFolders tCacheRoot & "Linux/x86-32/Externals/Database Drivers/"
         createAllFolders tCacheRoot & "Linux/x86-32/Support/"
         // Copy the relevant files.
         revCopyFile pID & "_build/linux/i386/release/standalone" & tEditionLow, tCacheRoot & "Linux/x86-32/Standalone"        
         revCopyFile pID & "_build/linux/i386/release/revsecurity.so", tCacheRoot & "Linux/x86-32/Support/revsecurity.so"        
         revCopyFile pID & "_build/linux/i386/release/revpdfprinter.so", tCacheRoot & "Linux/x86-32/Support/revpdfprinter.so"        
         revCopyFile pID & "_build/linux/i386/release/revzip.so", tCacheRoot & "Linux/x86-32/Externals/revzip.so"
         revCopyFile pID & "_build/linux/i386/release/revxml.so", tCacheRoot & "Linux/x86-32/Externals/revxml.so"
         revCopyFile pID & "_build/linux/i386/release/revdb.so", tCacheRoot & "Linux/x86-32/Externals/revdb.so"
         revCopyFile pID & "_build/linux/i386/release/Externals.txt", tCacheRoot & "Linux/x86-32/Externals/Externals.txt"
         revCopyFile pID & "_build/linux/i386/release/dbsqlite.so", tCacheRoot & "Linux/x86-32/Externals/Database Drivers/dbsqlite.so"
         revCopyFile pID & "_build/linux/i386/release/dbpstresql.so", tCacheRoot & "Linux/x86-32/Externals/Database Drivers/dbpostgresql.so"
         revCopyFile pID & "_build/linux/i386/release/dbodbc.so", tCacheRoot & "Linux/x86-32/Externals/Database Drivers/dbodbc.so"
         revCopyFile pID & "_build/linux/i386/release/dbmysql.so", tCacheRoot & "Linux/x86-32/Externals/Database Drivers/dbmysql.so"
         revCopyFile pID & "_build/linux/i386/release/Database Drivers.txt", tCacheRoot & "Linux/x86-32/Externals/Database Drivers/Database Drivers.txt"
      end if
   else if pPlatform is "MacOS" and there is a file (pID & "_build/mac/Release/Standalone" & tEditionUP & ".app") then
      // Create mapping for MacOS
      if there is no file (tCacheRoot & "Mac OS X/x86-32/Standalone.app") then
         // Ensure the directories exist for OSX.
         createAllFolders tCacheRoot & "Mac OS X/PowerPC-32/Externals/Database Drivers/"
         createAllFolders tCacheRoot & "Mac OS X/PowerPC-32/Support/"
         createAllFolders tCacheRoot & "Mac OS X/Universal/Externals/Database Drivers/"
         createAllFolders tCacheRoot & "Mac OS X/Universal/Support/"
         createAllFolders tCacheRoot & "Mac OS X/x86-32/Externals/Database Drivers/"
         createAllFolders tCacheRoot & "Mac OS X/x86-32/Support/"
         // Copy the relevant OSX files.
         revCopyFile pID & "_build/mac/Release/Standalone" & tEditionUp & ".app", tCacheRoot & "Mac OS X/x86-32/Standalone.app"
         dietAndStrip "i386", pID & "_build/mac/Release/Standalone" & tEditionUp & ".app/Contents/MacOS/Standalone", tCacheRoot & "Mac OS X/x86-32/Standalone.app/Contents/MacOS/Standalone"
         revCopyFile pID & "_build/mac/Release/revpdfprinter.bundle", tCacheRoot & "Mac OS X/x86-32/Support/revpdfprinter.bundle"        
         revCopyFile pID & "_build/mac/Release/revzip.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/revzip.bundle"
         revCopyFile pID & "_build/mac/Release/revxml.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/revxml.bundle"
         revCopyFile pID & "_build/mac/Release/revvideograbber.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/revvideograbber.bundle"
         revCopyFile pID & "_build/mac/Release/revspeech.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/revspeech.bundle"
         revCopyFile pID & "_build/mac/Release/revfont.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/revfont.bundle"
         revCopyFile pID & "_build/mac/Release/revdb.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/revdb.bundle"
         revCopyFile pID & "_build/mac/Release/revbrowser.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/revbrowser.bundle"
         revCopyFile pID & "_build/mac/Release/Externals.txt", tCacheRoot & "Mac OS X/x86-32/Externals/Externals.txt"         
         revCopyFile pID & "_build/mac/Release/dbsqlite.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/Database Drivers/dbsqlite.bundle"
         revCopyFile pID & "_build/mac/Release/dbpostgresql.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/Database Drivers/dbpostgresql.bundle"
         revCopyFile pID & "_build/mac/Release/dboracle.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/Database Drivers/dboracle.bundle"
         revCopyFile pID & "_build/mac/Release/dbodbc.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/Database Drivers/dbodbc.bundle"
         revCopyFile pID & "_build/mac/Release/dbmysql.bundle", tCacheRoot & "Mac OS X/x86-32/Externals/Database Drivers/dbmysql.bundle"
         revCopyFile pID & "_build/mac/Release/Database Drivers.txt", tCacheRoot & "Mac OS X/x86-32/Externals/Database Drivers/Database Drivers.txt"
      end if
   else if false then            
      // Ensure the directories exist for iOS.
      put listFolders (pID & "_build/ios", "iphone*") into tIosInputFolders
      put tIosInputFolders into tIosOutputFolders
      replace "iphonesimulator" with "Simulator-" in tIosOutputFolders
      replace "iphoneos" with "Device-" in tIosOutputFolders
      repeat with tLineIndex = 1 to the number of lines in tIosOutputFolders                    
         if there is a file pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/standalone-mobile" & tEditionLow & ".app/standalone-mobile" & tEditionLow then 
            createAllFolders tCacheRoot & "iOS/" & line tLineIndex of tIosInputFolders & "/"
            // Copy the relevant iOS files.
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/standalone-mobile" & tEditionLow & ".app/standalone-mobile" & tEditionLow, tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/Standalone"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/revpdfprinter.dylib", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/RevPdfPrinter"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/revzip.dylib", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/RevZip"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/revxml.dylib", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/RevXml"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/revdb.dylib", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/RevDb"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/dbsqlite.dylib", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/DbSqlite"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/dbmysql.dylib", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/DbMysql"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/mobile-template.plist", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/Settings.plist"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/mobile-remote-notification-template.plist", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/RemoteNotificationSettings.plist"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/mobile-url-scheme-template.plist", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/URLSchemeSettings.plist"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/template-ResourceRules.plist", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/ResourceRules.plist"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/Default-568h@2x.png", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/Default4InchSplash.png"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/template-entitlements.xcent", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/Entitlements.xcent"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/template-remote-notification-entitlements.xcent", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/RemoteNotificationEntitlements.xcent"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/template-remote-notification-store-entitlements.xcent", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/RemoteNotificationStoreEntitlements.xcent"
            revCopyFile pID & "_build/ios/" & line tLineIndex of tIosInputFolders & "/Release/template-store-entitlements.xcent", tCacheRoot & "iOS/" & line tLineIndex of tIosOutputFolders & "/StoreEntitlements.xcent"            
         end if
      end repeat
   else
      put empty into tCacheRoot
      // Log some error message here.
      logThis "Platform Allocation Exception: Platform" && quote & the platform & quote && "is not supported" & return
   end if
   return tCacheRoot
end mapGitHubCacheFiles

// Remove mapped GitHub files from the cache area.
on deleteGitHubCacheFiles
   local tGitCaches, tPath
   if the cLiveCodeTestGitHubCache of stack "quality" is not empty then
      put listFolders (the cLiveCodeTestGitHubCache of stack "quality", empty) into tGitCaches
      filter tGitCaches without "."
      filter tGitCaches without ".."      
      repeat for each line tPath in tGitCaches
         revDeleteFolder the cLiveCodeTestGitHubCache of stack "quality" & tPath
      end repeat
   end if
   put empty into lastCached
end deleteGitHubCacheFiles

// Get the supported architectures.
function getExecutableArchs pInput
   get shell("lipo -info" && quote & pInput & quote)
   set the itemDelimiter to ":"
   get word 1 to -1 of the last item of it
   replace space with comma in it
   return it
end getExecutableArchs

// Strip the relevant architecure out of a universal bundle.
command dietAndStrip pArchs, pInput, pOutput
   local tCurrentArchs
   put getExecutableArchs(pInput) into tCurrentArchs
   
   local tActualArchs
   repeat for each item tArch in pArchs
      if tArch is "x86" then
         put "i386" into tArch
      end if
      if tArch is "x86-64" then
         put "x86_64" into tArch
      end if
      if tArch is among the items of tCurrentArchs then
         put tArch & comma after tActualArchs
      end if
   end repeat
   delete the last char of tActualArchs
   
   if the number of items of tCurrentArchs is not the number of items of tActualArchs then
      if  the number of items of tActualArchs is 1 then
         get shell("lipo -thin " & tActualArchs && "-output" && quote & pOutput & quote && quote & pInput & quote)
         if it is not empty then
            return it
         end if
         get shell("strip -S" && quote & pOutput & quote)
      else
         local tFiles
         repeat for each item tArch in tActualArchs
            put quote & pOutput & "." & tArch & quote & space after tFiles
            get shell("lipo -thin" && tArch && "-output" && quote & pOutput & "." & tArch & quote && quote & pInput & quote)
            if it is not empty then
               return it
            end if
         end repeat
         get shell("lipo -create" && tFiles && "-output" && quote & pOutput & quote)
         if it is not empty then
            return it
         end if
         get shell("strip -S" && quote & pOutput & quote)
      end if
   else
      get shell("strip -S -o" && quote & pOutput & quote && quote & pInput & quote)
   end if
   if it is not empty then
      return it
   end if
   return empty
end dietAndStrip
