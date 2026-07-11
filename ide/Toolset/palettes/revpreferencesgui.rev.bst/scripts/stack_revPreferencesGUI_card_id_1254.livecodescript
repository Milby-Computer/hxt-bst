Script "stack_revPreferencesGUI_card_id_1254"

/*
# Name: card "Mobile Support" of stack "revPreferencesGUI"
# ID: card id 1254 of stack "revPreferencesGUI"
# Hash: zquNbUP0etys3nF6oiEoJg==
*/


on preOpenCard
   -- PM-2015-02-06: [[ Bug 14422 ]] Removed OSX 10.6 support
   if the platform is not "macos" or revIDEDeployIOSSanitizeSystemVersion() < 100700  then
      set the enabled of group "iOS SDKs" to false
      put empty into field "iOS SDKs"
      set the backgroundColor of graphic "SDK Status" to "gray"
      set the tooltip of graphic "SDK Status" to empty
   else
      set the enabled of group "iOS SDKs" to true      
      put the cMobileSupport["ios.sdks"] of stack "revPreferences" into field "iOS SDKs"
      updateSimulators
      updateSDKs
   end if
   
   set the visible of button "ChooseJDK" to (the platform is "linux")
   
   set the enabled of group "Android SDK" to true
   put the cMobileSupport["android.sdk"] of stack "revPreferences" into field "Android SDK"
   updateJDK
end preOpenCard

command setIOSSDK pValue
   get the cMobileSupport["ios.sdks"] of stack "revPreferences"
   if pValue is not among the lines of it then
      if it is not empty then
         put return after it
      end if
      put pValue after it
      set the cMobileSupport["ios.sdks"] of stack "revPreferences" to it
      put it into field "iOS SDKs"
      revIDEDeployIOSUpdateSDKs
      updateSimulators
      updateSDKs
   end if
end setIOSSDK

command removeIOSSDK pValues
   set the wholeMatches to true
   get the cMobileSupport["ios.sdks"] of stack "revPreferences"
   repeat for each line tValue in pValues
      if tValue is among the lines of it then
         delete line lineoffset(tValue, it) of it
      end if
   end repeat
   set the cMobileSupport["ios.sdks"] of stack "revPreferences" to it
   put it into field "iOS SDKs"
   revIDEDeployIOSUpdateSDKs
   updateSimulators
   updateSDKs
end removeIOSSDK

command updateSimulators
   get revIDEDeployIOSGetSimulatorVersions()
   if it is empty then
      get "(none)"
   else
      replace return with comma & space in it
   end if
   put "Available simulators: " & it into field "Simulator List"
end updateSimulators

command updateSDKs
   local tTooltip, tAvailableSDKs, tValid
   
   dispatch function "deployCheckLatestSDKIsInstalled" to stack "revDeployLibraryIOS" with tTooltip, tAvailableSDKs
   
   put the result into tValid
   if tValid then
      set the backgroundColor of graphic "SDK Status" to "green"
   else
      set the backgroundColor of graphic "SDK Status" to "red"
   end if
   
   set the tooltip of graphic "SDK Status" to tTooltip   
   put "Available device SDKs: " & tAvailableSDKs into field "SDK List"
end updateSDKs

command setAndroidSDK pValue
   set the cMobileSupport["android.sdk"] of stack "revPreferences" to pValue
   put pValue into field "Android SDK"
   revIDEDeployAndroidInitialize
   updateJDK
end setAndroidSDK

command setJDK pValue
   set the cMobileSupport["android.jdk"] of stack "revPreferences" to pValue
   put pValue into field "JDK Path"
   revIDEDeployAndroidInitialize
   updateJDK
end setJDK

command updateJDK
   get revIDEDeployAndroidGetJDK()
   if it is empty then
      get "(none)"
   end if
   
   if the platform is "macos" then
      set the itemDelimiter to slash
      delete item -2 to -1 of it
   end if
   
   put "JDK Path:" && it into field "JDK Path"
end updateJDK
