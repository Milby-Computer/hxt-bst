Script "stack_revOnline_button_id_4036647"

/*
# Name: button "Download" of group "Object 807" of group "search list" of card "main" of stack "revOnline"
# ID: button id 4036647 of group id 4036640 of group id 1691 of card id 1002 of stack "revOnline"
# Hash: LfldnSckw6IHNvPvxE4XVg==
*/


on mouseUp
   rvoLaunchStack (the cStackId of the owner of me)
end mouseUp

on mouseEnter
   set the backgroundColor of me to "124,193,222"
end mouseEnter

on mouseLeave
   set the backgroundColor of me to "214,214,214"
end mouseLeave
