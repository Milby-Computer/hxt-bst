Script "stack_revOnlineExternalTemplate_button_id_1009"

/*
# Name: button "Install" of card id 1002 of stack "revOnlineExternalTemplate" of stack "revOnline"
# ID: button id 1009 of card id 1002 of stack "revOnlineExternalTemplate" of stack "revOnline"
# Hash: 8sINYePilvgGvpN4PAey5Q==
*/


on mouseUp
   installFull
   disable me
end mouseUp

on mouseEnter
   infoShow "This will install the external to your LiveCode externals folder. It will be available in the IDE and you will be able to build standalones with it."
end mouseEnter

on mouseLeave
   infoShow empty
end mouseLeave
