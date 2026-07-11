Script "stack_revStandaloneSettings_button_id_2263"

/*
# Name: button "Minimum Android Version" of group "Requirements and Restrictions" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: button id 2263 of group id 2255 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: X5VlZhkBRKbdhpj6ZqD7Mg==
*/


on menuPick pItemName
   // SN-2015-05-13: [[ AndroidVersions ]] Make the Android versions
   //  something changeable from script-only stacks
   storeSetting "minimum version", revIDEDeployAndroidApiFromVersion(pItemName)
end menuPick

on updateSettings pAPI
   local tVersionsList
   
   // SN-2015-05-13: [[ AndroidVersions ]] Dynamically generate the list
   //  of Android versions
   put revIDEDeployAndroidGetVersionsList() into tVersionsList
   replace comma with LF in tVersionsList
   set the text of me to tVersionsList
   
   local tAPIsList
   local tMenuHistory
   put revIDEDeployAndroidGetAPIsList() into tAPIsList
   
   if pAPI < item 1 of tAPIsList then
      menuPick line 1 of the text of me
      put 1 into tMenuHistory
   else if pApi > last item of tAPIsList then
      menuPick last line of the text of me
      put the number of lines in the text of me into tMenuHistory
   else
      put 1 into tMenuHistory
      repeat for each item tAndroidAPI in tAPIsList
         if tAndroidAPI is pAPI then
            exit repeat
         else
            add 1 to tMenuHistory
         end if
      end repeat
   end if   
   
   set the menuhistory of me to tMenuHistory
end updateSettings
