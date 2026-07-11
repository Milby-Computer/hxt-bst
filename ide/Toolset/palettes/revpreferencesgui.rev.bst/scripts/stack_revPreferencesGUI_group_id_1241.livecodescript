Script "stack_revPreferencesGUI_group_id_1241"

/*
# Name: group "Compatibility" of card "Compatibility" of stack "revPreferencesGUI"
# ID: group id 1241 of card id 1015 of stack "revPreferencesGUI"
# Hash: P0JRDne1p8Pm4MY/JkVCVQ==
*/


command statusSet pText
  set the text of field "Status" of me to pText
end statusSet

on driverDownloadCallback pUrl, pStatus, pBytesReceived, pBytesTotal
  if pStatus is "cached" then
    statusSet "Download complete"
    legacyDriversProgressFinalise
    set the enabled of button "Use Legacy Drivers" of me to true
  else if pStatus is "error" then
    statusSet "Error downloading drivers"
    legacyDriversProgressFinalise
     set the enabled of button "Use Legacy Drivers" of me to false
  else if pStatus is "loading" then
    statusSet "Downloading..."
  end if
  
  legacyDriversProgressUpdate pBytesReceived, pBytesTotal
end driverDownloadCallback

function legacyDriversInstallationUrl
  return "http://developer.runrev.com/LegacyDriverInstaller.rev"
end legacyDriversInstallationUrl

local sCallback, sCallbackTarget

command legacyDriversDownload pCallback, pCallbackTarget
  put pCallback into sCallback
  put pCallbackTarget into sCallbackTarget
  
  libUrlSetStatusCallback "legacyDriversDownloadProgressCallback", the long id of me
  
  load url legacyDriversInstallationUrl() with message "legacyDriversDownloadCallback"
  legacyDriversProgressInit
end legacyDriversDownload

command legacyDriversDownloadCancel
  unload url legacyDriversInstallationUrl()
  legacyDriversProgressFinalise
  statusSet "Cancelled"
  set the enabled of button "Use Legacy Drivers" of me to false
end legacyDriversDownloadCancel

on legacyDriversDownloadCallback pUrl, pStatus
  libUrlSetStatusCallback empty
  try
    send sCallback && pUrl & comma && item 1 of pStatus to sCallbackTarget
  end try
  put empty into sCallback
  put empty into sCallbackTarget
  
  if pStatus is "cached" then
    # OK-2007-09-24
    # Without the lock messages, a script error triggers in revFrontScript, preventing execution of the installer.
    # I'm not sure why this happens, decided to work around it for now.
    lock messages
    go invisible stack (url pUrl)
    unlock messages
    send "install" to stack "Legacy Driver Installer"
  end if
  
  # Used to check for the presence of legacy drivers
  set the cREVLegacyDriversInstalled of stack "revPreferences" to true
  
  # OK-2008-01-07 : Bug 5710 : Update the group controls now that the drivers have been downloaded.
  legacyDriversUpdateControls
end legacyDriversDownloadCallback

on legacyDriversDownloadProgressCallback pUrl, pStatus, pBytesReceived, pBytesTotal
  if item 1 of pStatus is "loading" then
    send sCallback && pUrl & comma && "loading" & comma && item 2 of pStatus & comma && item 3 of pStatus to sCallbackTarget
  end if
end legacyDriversDownloadProgressCallback

command legacyDriversProgressInit
  # OK-2008-03-06 : Bug 5973. Because of libUrl's iniability to handle multiple url loads at once
  # the legacy drivers download must lock the rest of the IDE until complete or cancelled. This is
  # done by opening a modal dialog with a progress bar.
  set the topLeft of stack "revLegacyDownloadProgress" to (the left of this stack + the left of me), (the top of this stack + the bottom of me)
  send "initialize" to stack "revLegacyDownloadProgress"
  modal stack "revLegacyDownloadProgress"
end legacyDriversProgressInit

command legacyDriversProgressFinalise
  send "finalize" to stack "revLegacyDownloadProgress"
  close stack "revLegacyDownloadProgress"
end legacyDriversProgressFinalise

command legacyDriversProgressUpdate pAmountDone, pAmountTotal
  send "update pAmountDone, pAmountTotal" to stack "revLegacyDownloadProgress"
end legacyDriversProgressUpdate

function legacyDriversPresent
  # Perhaps this should be done using a more reliable method...
  # return (there is a folder (revEnvironmentUserExternalsPath() & "/Legacy"))
  return (the cREVLegacyDriversInstalled of stack "revPreferences" is "true")
end legacyDriversPresent

# The legacy drivers are installed along with a legacy version of revdb. We check the externals property of the home
# stack for this legacy external and return the result.
function legacyDriversInUse
  local tExternalName
  switch the platform
  case "win32"
    put "revdb.dll" into tExternalName
    break
  case "macos"
    put "revdb.bundle" into tExternalName
    break
  case "linux"
    put "revdb.so" into tExternalName
    break
  end switch
  
  if (revEnvironmentUserExternalsPath() & "/Legacy/" & tExternalName) is among the lines of the externals of stack "Home" then
    return true
  else
    return false
  end if
end legacyDriversInUse

# OK-2008-01-07 : Bug 5710
# Parameters
#   <none>
# Description
#   Updates the controls in the legacy drivers group to reflect the current status of the drivers, 
#   i.e. whether they are downloaded or not and whether they are in use or not.
command legacyDriversUpdateControls
  if the platform is "linux" then
    set the enabled of me to false
    set the hilite of button "Use Legacy Drivers" of me to false
  else
    set the enabled of me to true
    # OK-2008-01-07 : Bug 5710
    -- The cancel button must be dynamically set to match the loc of the progress bar in order to ensure it is lined up on all platforms.
    --    set the loc of button "Cancel" of me to (item 1 of the loc of button "Cancel" of me), (item 2 of the loc of scrollbar "Progress Scrollbar" of me)
    send "updateControls" to stack "revLegacyDownloadProgress"
    if legacyDriversPresent() then
      set the visible of button "Use Legacy Drivers" of me to true
      set the left of button "Use Legacy Drivers" of me to the left of me + 13
      
      set the visible of button "Download Now" of me to false
      set the left of button "Download Now" of me to the right of me + 20
      
      set the text of field "Label" of me to the cLegacyDriversPresentText of me
      set the right of field "Status" of me to the right of me
      set the loc of field "Status" of me to (item 1 of the loc of field "Status" of me), (item 2 of the loc of button "Use Legacy Drivers" of me - 1) 
    else
      set the visible of button "Use Legacy Drivers" of me to false
      set the left of button "Use Legacy Drivers" of me to the right of me + 20
      
      set the visible of button "Download Now" of me to true
      set the left of button "Download Now" of me to the left of me + 15
      
      set the text of field "Label" of me to the cLegacyDriversNotPresentText of me
      set the left of field "Status" of me to the right of button "Download Now" of me + 10
      set the loc of field "Status" of me to (item 1 of the loc of field "Status" of me), (item 2 of the loc of button "Download Now" of me)
    end if
     
    set the hilite of button "Use Legacy Drivers" of me to (the cREVUseLegacyDrivers of stack "revPreferences" is "true")
  end if
end legacyDriversUpdateControls

# OK-2009-10-12 : Added updates preferences
command updatesInitialize
   local tCheck
   put revIDEGetPreference("Updater,AutoCheckOnStartup") is not false into tCheck
   set the hilite of button "Check for Updates on Startup" of group "Updates" of me to tCheck
end updatesInitialize


on initialise
  legacyDriversProgressFinalise
  statusSet ""
  legacyDriversUpdateControls
  
  set the hilite of button "DBQueryBuilder" to (revIDEPrefGet("Unsupported,EnableDBQueryBuilder") is "true")
end initialise









