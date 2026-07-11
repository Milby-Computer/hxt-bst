Script "stack_revOnline_group_id_3414548"

/*
# Name: group "edit profile" of group "user" of group "viewing pane" of card "main" of stack "revOnline"
# ID: group id 3414548 of group id 31884 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: iG8v/cuyEw1Kk8V6gVcjeQ==
*/


command showEditControls
   lock screen
   hide field "edit profile" of me
   show button "save" of me
   show field "save" of me
   show button "cancel" of me
   show field "cancel" of me
   unlock screen
end showEditControls

command hideEditControls
   lock screen
   show field "edit profile" of me
   hide button "save" of me
   hide field "save" of me
   hide button "cancel" of me
   hide field "cancel" of me
   unlock screen
end hideEditControls
