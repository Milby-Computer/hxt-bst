Script "stack_revStandaloneSettings_button_id_3470"

/*
# Name: button "Profile" of group "Basic Application Settings" of group "Basic Settings" of group "Basic Settings" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 3470 of group id 3462 of group id 29811 of group id 30336 of card id 1641 of stack "revStandaloneSettings"
# Hash: QAwM9u9rKW1zYaCz8/OEzg==
*/


on menuPick pItemName
   repeat for each element tElement in getProfiles()
      if tElement["index"] is the menuHistory of me then
         storeSetting "profile", tElement["id"]
         if tElement["days remaining"] < 45 then
            answer information "This profile will expire in " & tElement["days remaining"] & " days"
         end if
         exit repeat
      end if
   end repeat
end menuPick
