Script "stack_revStandaloneSettings_button_id_3608"

/*
# Name: button "Supported Devices" of group id 30343 of group "iOS Settings" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 3608 of group id 30343 of group id 30345 of card id 1641 of stack "revStandaloneSettings"
# Hash: P0yjfVRLIeVUlOWV7zX4Lg==
*/


on menuPick pItemName
   switch pItemName
      case "iPod, iPhone and iPad"
         get 1,2
         break
      case "iPod and iPhone"
         get 1
         break
      case "iPad"
         get 2
         break
   end switch
   enableDeviceSpecificSettings it
   storeSetting "device family", it
   updateOrientationSettings
end menuPick
