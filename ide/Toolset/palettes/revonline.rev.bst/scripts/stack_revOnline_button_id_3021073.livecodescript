Script "stack_revOnline_button_id_3021073"

/*
# Name: button "Download" of group "template new 2" of card "templates" of stack "revOnline"
# ID: button id 3021073 of group id 3021066 of card id 157677 of stack "revOnline"
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
