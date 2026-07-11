Script "stack_revOnlineExternalTemplate_button_id_1008"

/*
# Name: button "Try" of card id 1002 of stack "revOnlineExternalTemplate" of stack "revOnline"
# ID: button id 1008 of card id 1002 of stack "revOnlineExternalTemplate" of stack "revOnline"
# Hash: kAAExcxvlDuqh3eEGMTdQQ==
*/


on mouseUp
   installTemporary
   disable me
   infoShow "The external has now been temporarily installed in the IDE and all its commands and functions have been inserted into the message path"
end mouseUp

on mouseEnter
   infoShow "This will temporarily install the external so you can try using it. It will be lost when you close LiveCode."
end mouseEnter

on mouseLeave
   infoShow empty
end mouseLeave
