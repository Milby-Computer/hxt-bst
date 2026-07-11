Script "stack_InstallerUninstallerUIWelcomeCardBehavior"

/*
# Name: stack "InstallerUninstallerUIWelcomeCardBehavior" of stack "Installer"
# ID: stack "InstallerUninstallerUIWelcomeCardBehavior" of stack "Installer"
# Hash: o3tg3iD0AzzRNPChKbpdQw==
*/


on preOpenCard
   setTitleField the long id of field "Page Title", the uProductTitle of stack "Installer" && "Uninstaller"
   
   put "Click 'Uninstall' to begin uninstallation." into field "Page Description"
   
   set the uEnabled of control "Back" to false
   set the uLabel of control "Back" to "Back"
   set the uEnabled of control "Next" to true
   set the uDefault of control "Next" to true
   set the uLabel of control "Next" to "Uninstall"
   set the uEnabled of control "Cancel" to true
   set the uLabel of control "Cancel" to "Cancel"
   
   show control "Next"
   show control "Cancel"
   hide control "Back"
end preOpenCard
