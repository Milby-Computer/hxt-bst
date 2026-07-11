Script "stack_Data_Grid_Templates_1779486520875_button_id_1028"

/*
# Name: button "install" of group "Row Template" of card id 1005 of stack "Data Grid Templates 1779486520875" of stack "hxtpmSample"
# ID: button id 1028 of group id 1006 of card id 1005 of stack "Data Grid Templates 1779486520875" of stack "hxtpmSample"
# Hash: 6EJ/aYYbJlBiZPnbXE+ROw==
*/


on MouseUp
   local tPackageName
   put the cName of me into tPackageName
      
   if (the label of me = "Uninstall") then
      hxtpmUninstall tPackageName
      if the result is not empty then
         answer error the result
      else
         set the label of me to iff(the label of me = "Install", "Uninstall", "Install")
      end if
   else
      hxtpmInstall tPackageName
   end if
end MouseUp

on hxtpmInstallComplete pName, pError
   if pError is not empty then
      answer error pError
   else
      set the label of me to iff(the label of me = "Install", "Uninstall", "Install")
   end if
end hxtpmInstallComplete
