Script "stack_revOnline_button_id_937664"

/*
# Name: button "Browse" of group "OS X" of group "external upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 937664 of group id 937661 of group id 937669 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: faYDKpgNFvGOa/EcSFTDEw==
*/


on mouseUp
   if the platform is "MacOS" then
      answer file "Please select external" with type "Bundles|bundle|APPL"
   else
      answer folder "Please select external"
   end if
   if it is not empty and char -7 to -1 of it is ".bundle" then
      put it into field "Path" of the owner of me
   end if
end mouseUp
