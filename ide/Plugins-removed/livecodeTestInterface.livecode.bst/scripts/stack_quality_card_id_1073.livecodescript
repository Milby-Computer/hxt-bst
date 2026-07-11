Script "stack_quality_card_id_1073"

/*
# Name: card "qualityBuildStandalone" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1073 of stack "quality" of stack "livecodeTestInterface"
# Hash: yBePjApeAEsjkGhYOnXYRw==
*/


// --------- Standalone Building ----------

// Build the standalone.
command buildExecutable @rWorkList, pWorkListID, pIndex
   local tPass, tDeployInfo, tVersionID, tExtensions, tEngineLocation, tVersionLabel
   
   put true into tPass
   put empty into tDeployInfo
   
   // Get the name of the stack that is to be turned into a standalone.
   dispatch function "getStackName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndex
   put the result into tDeployInfo["stackfile"]
   
   // Get the name of the executable we are creating.
   dispatch function "getExecutableName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndex
   put the result into tDeployInfo["output"]
   
   if there is a file tDeployInfo["stackfile"] then
      if rWorkList[pWorkListID][pIndex]["PlatformGroupID"] is "Desktop" then
         buildExecutableDesktop rWorkList, pWorkListID, pIndex
      else
         // Check if we have to build the GitHubCach data.
         put ensureEngines (rWorkList[pWorkListID][pIndex]["VersionID"], rWorkList[pWorkListID][pIndex]["PlatformID"]) into tEngineLocation
         if tEngineLocation is empty then
            qualityGetVersionLabel rWorkList[pWorkListID][pIndex]["VersionID"]
            put the result into tVersionLabel
            logThis "Cannot build standalone for mobile: No standalone available for" && rWorkList[pWorkListID][pIndex]["PlatformID"] && "on" && tVersionLabel & return
            put false into tPass
         else
            // Build the standalone for mobile.
            buildExecutableMobile rWorkList[pWorkListID][pIndex]["PlatformGroupID"], tEngineLocation, tDeployInfo["stackfile"], tDeployInfo["output"], rWorkList[pWorkListID][pIndex]["PlatformID"]
         end if
      end if
   end if
   
   //if the result is not empty then
   //logThis "Cannot build standalone for" && the platform && "due to:" && the result &"." & return
   //put false into tPass
   //end if       
   return tPass   
end buildExecutable

// --------- Standalone Building ----------

// Build the standalone.
command buildExecutableDesktop @rWorkList, pWorkListID, pIndex
   local tPass, tDeployInfo, tVersionID, tExtensions, tVersionLabel
   
   put true into tPass
   put empty into tDeployInfo
   
   // Get the name of the stack that is to be turned into a standalone.
   dispatch function "getStackName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndex
   put the result into tDeployInfo["stackfile"]
   
   // Get the name of the executable we are creating.
   dispatch function "getExecutableName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndex
   put the result into tDeployInfo["output"]
   
   // Build the desktop standalone.
   put ensureEngines (rWorkList[pWorkListID][pIndex]["VersionID"], rWorkList[pWorkListID][pIndex]["PlatformID"]) into tVersionID
   if tVersionID is empty then
      qualityGetVersionLabel rWorkList[pWorkListID][pIndex]["VersionID"]
      logThis "Cannot build standalone for desktop: No standalone available for" && rWorkList[pWorkListID][pIndex]["PlatformID"] && "on" && tVersionLabel & return
      put false into tPass
   end if
   put the cTestExecutableExtension of stack "quality" into tExtensions
   //put tExtensions [the platform] after tDeployInfo["output"]
   
   // Build the local platform specific standalone.   
   if tPass is true then
      switch the platform
         case "MacOS"
            if there is a file (tVersionID & "Mac OS X/x86-32/Standalone.app/Contents/MacOS/Standalone") then
               put tVersionID & "Mac OS X/x86-32/Standalone.app/Contents/MacOS/Standalone" after tDeployInfo["engine_x86"]
               _internal deploy macosx tDeployInfo
            else if there is a file (tVersionID & "MacOS/Standalone") then
               put tVersionID & "MacOS/Standalone" after tDeployInfo["engine_x86"]
               _internal deploy macosx tDeployInfo
            else
               logThis "Cannot build standalone for MacOS. Standalone engine does not exist:" && tVersionID & "Mac OS X/x86-32/Standalone.app/Contents/MacOS/Standalone" & return
            end if
            break
         case "Win32"
            if there is a file (tVersionID & "Windows/x86-32/Standalone") then
               put tVersionID & "Windows/x86-32/Standalone" after tDeployInfo["engine"]               
               _internal deploy windows tDeployInfo
            else if there is a file (tVersionID & "Windows/Standalone") then
               put tVersionID & "Windows/Standalone" after tDeployInfo["engine"]               
               _internal deploy windows tDeployInfo
            else
               logThis "Cannot build standalone for MacOS. Standalone engine does not exist:" && tVersionID & "Windows/x86-32/Standalone" & return
            end if
            break
         case "Linux"
            if there is a file (tVersionID & "Linux/x86-32/Standalone") then
               put tVersionID & "Linux/x86-32/Standalone" after tDeployInfo["engine"]
               _internal deploy linux tDeployInfo
            else if there is a file (tVersionID & "Linux/Standalone") then
               put tVersionID & "Linux/Standalone" after tDeployInfo["engine"]
               _internal deploy linux tDeployInfo
            else
               logThis "Cannot build standalone for MacOS. Standalone engine does not exist:" && tVersionID & "Linux/x86-32/Standalone" & return
            end if
            break 
         default
            break
      end switch
      
      if the result is not empty then
         logThis "Cannot build standalone for" && the platform && "due to:" && the result &"." & return
         put false into tPass
      end if           
   end if
   return tPass   
end buildExecutableDesktop

----------

command buildExecutableMobile pPlatform, pEngineFolder, pStandaloneInformation, pOutputPath, pTarget   
   revSetOverrideRuntimePath pEngineFolder
   put the result
   try
      if pPlatform contains "Android" then
         dispatch "revSaveAsMobileStandalone" to stack "revSaveAsAndroidStandalone"  of stack "revStandaloneSettings" with pStandaloneInformation, pOutputPath, pTarget
      else if pPlatform contains "iOS" then
         if pTarget contains "Simulator" then
            dispatch "revSaveAsMobileStandalone" to stack "revSaveAsIOSStandalone"  of stack "revStandaloneSettings" with pStandaloneInformation, pOutputPath, pTarget
         else
            dispatch "revSaveAsMobileStandalone" to stack "revSaveAsIOSStandalone"  of stack "revStandaloneSettings" with pStandaloneInformation, pOutputPath, "device"
         end if
      end if
   catch tError
      logThis "Cannot build standalone for" && pPlatform && "due to:" && tError &"." & return     
   end try
   if the result is not empty then
      
   end if   
   dispatch "revReset" to stack "revSaveAsStandalone" of stack "revStandaloneSettings"
end buildExecutableMobile
