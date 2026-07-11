Script "stack_revEntitlements_card_id_1002"

/*
# Name: card id 1002 of stack "revEntitlements" of stack "revStandaloneSettings"
# ID: card id 1002 of stack "revEntitlements" of stack "revStandaloneSettings"
# Hash: KfV5tRdSoiZocu2bkZxbrA==
*/


on OpenStack
end OpenStack

on preOpenStack
end preOpenStack

on PreOpenCard
end PreOpenCard


--on OpenCard
--   local tIdentities, tDeveloperIdentities
--   put shell("security find-identity -v -p codesigning") into tIdentities
--   filter lines of tIdentities with "*Developer ID Application*"
--   get matchtext(tIdentities, QUOTE & "(.*?)" & QUOTE, tDeveloperIdentities)
--   set the text of button "Signing Certificate" to tDeveloperIdentities

--   local tTargetStackLongID
--   put the long id of stack (the cTargetStack of this stack) into tTargetStackLongID

--   set the text of field "Apple ID" to revIDEStandaloneSettingsGet(tTargetStackLongID, "OSX,appleID")
--   set the text of field "Team ID" to revIDEStandaloneSettingsGet(tTargetStackLongID, "OSX,teamID")
--   set the hilited of button "Notarize after signing" to (revIDEStandaloneSettingsGet(tTargetStackLongID, "OSX,notarize") is true)
--end OpenCard

on OpenCard
   local tTargetStackLongID
   put the long id of stack (the cTargetStack of this stack) into tTargetStackLongID
   set the text of field "Apple ID" to revIDEStandaloneSettingsGet(tTargetStackLongID, "OSX,appleID")
   set the text of field "Team ID" to revIDEStandaloneSettingsGet(tTargetStackLongID, "OSX,teamID")
   set the hilited of button "Notarize after signing" to \
         (revIDEStandaloneSettingsGet(tTargetStackLongID, "OSX,notarize") is true)
   
   -- Fetch signing identities without blocking the main thread.
   -- The original shell() call hangs on macOS Sequoia while waiting for
   -- keychain authorisation.  Using open process + wait with messages keeps
   -- the event loop alive and lets the IDE remain responsive.
   local tProcess, tOutput, tDeadline
   put "security find-identity -v -p codesigning" into tProcess
   open process tProcess for read
   put the milliseconds + 8000 into tDeadline   -- 8-second safety timeout
   repeat
      wait 100 milliseconds with messages        -- yield so UI stays alive
      read from process tProcess for 65536
      put it after tOutput
      if the result is "eof" then exit repeat
      if the milliseconds > tDeadline then exit repeat
   end repeat
   close process tProcess
   
   filter lines of tOutput with "*Developer ID Application*"
   local tDeveloperIdentities
   get matchtext(tOutput, QUOTE & "(.*?)" & QUOTE, tDeveloperIdentities)
   set the text of button "Signing Certificate" to tDeveloperIdentities
end OpenCard


on CloseCard
   local tAllControls, tControl, tControlIsHilited, tTargetStackLongID
   put the long id of stack (the cTargetStack of this stack) into tTargetStackLongID
   put AllControlInGroup("Entitlements","button") into tAllControls
   repeat for each line tControl in tAllControls
      set the itemDelimiter to QUOTE
      revIDEStandaloneSettingsSet tTargetStackLongID, "OSX,entitlements," & item 2 of tControl, the hilited of tControl
      --      if (the hilited of tControl) then
      --         put item 2 of tControl & LF after tControlIsHilited
      --      end if
   end repeat
   filter tControlIsHilited without EMPTY
   --   if (tControlIsHilited is not EMPTY) then
   --      local tXML
   --      put "<?xml version=" & quote & "1.0" & quote & " encoding=" & quote & "UTF-8" & quote & "?>" & return into tXML
   --      put "<!DOCTYPE plist PUBLIC " & quote & "-//Apple//DTD PLIST 1.0//EN" & quote & " " & quote & "http://www.apple.com/DTDs/PropertyList-1.0.dtd" & quote & ">" & return after tXML
   --      put "<plist version=" & quote & "1.0" & quote & "><dict>" & return after tXML
   --      repeat for each line tEntitlement in tControlIsHilited
   --         put "<key>" & tEntitlement & "</key>" & LF after tXML
   --         put "<true/>" & LF after tXML
   --         revIDEStandaloneSettingsSet tTargetStackLongID, "OSX,entitlements," & tEntitlement, TRUE
   --      end repeat
   --      put "</dict></plist>" after tXML
   
   --      local tEntitlementsPath
   --      put the filename of stack tTargetStackLongID into tEntitlementsPath
   --      set the itemDelimiter to "/"
   --      put "entitlements.plist" into item -1 of tEntitlementsPath
   --      set the itemDelimiter to ","
   --      put tXML into URL ("file:" & tEntitlementsPath)
   --      revIDEStandaloneSettingsSet tTargetStackLongID, "OSX,entitlementsFile", tEntitlementsPath
   --   end if
   
   local tCertificate, tAppleID, tTeamID, tPassword, tShell
   put the long id of stack (the cTargetStack of this stack) into tTargetStackLongID
   
   -- Certificate: the selected line of the dropdown/list
   put the label of button "Signing Certificate" of group "Code Signing" into tCertificate
   -- Treat the placeholder text as empty
   if tCertificate is "No certificate selected" then put empty into tCertificate
   revIDEStandaloneSettingsSet tTargetStackLongID, "OSX,codeSignIdentity", tCertificate
   
   -- Apple ID and Team ID
   put the text of field "Apple ID" of group "Code Signing" into tAppleID
   put the text of field "Team ID" of group "Code Signing" into tTeamID
   revIDEStandaloneSettingsSet tTargetStackLongID, "OSX,appleID", tAppleID
   revIDEStandaloneSettingsSet tTargetStackLongID, "OSX,teamID", tTeamID
   
   -- Notarize checkbox
   revIDEStandaloneSettingsSet tTargetStackLongID, "OSX,notarize", \
         (the hilited of button "Notarize after signing" of group "Code Signing")
   
   -- Password: store in keychain, NOT in settings
   put the text of field "App-Specific Password" of group "Code Signing" into tPassword
   if tAppleID is not empty and tPassword is not empty then
      -- -U = update if already exists; -a = account; -s = service; -w = password
      put "security add-generic-password -U" into tShell
      put tShell && "-a" && quote & tAppleID & quote into tShell
      put tShell && "-s" && quote & "HyperXTalk-Notarization" & quote into tShell
      put tShell && "-w" && quote & tPassword & quote into tShell
      get shell(tShell)
      if the result is not EMPTY then
         answer error "Could not save password to keychain." & return & it
      end if
   end if
end CloseCard


private function AllControlInGroup pGroup,pType
   local rAllControlInCr, rAllControlInCd, tFilter
   put empty into rAllControlInCr
   repeat with i = 1 to the num of controls of group pGroup
      put the name of control i of group pGroup & cr after rAllControlInCr
   end repeat
   delete char -1 of rAllControlInCd
   if pType <> empty then
      put "*" & pType & "*" into tFilter
      filter rAllControlInCr with tFilter
   end if
   return rAllControlInCr
end AllControlInGroup
