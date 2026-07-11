Script "stack_revOnline_group_id_937669"

/*
# Name: group "external upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: group id 937669 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: kLfVC4SXgomFimNkoKat9Q==
*/


command resize
   set the topleft of field "external upload title" to (the left of me + 4, the top of me + 8)
   
   set the rect of group "windows" of me to \
   (the left of me + 4, the bottom of field "external upload title" of me + 4, the right of me - 8, the bottom of field "external upload title" of me + 34)
   send "resize" to group "windows" of me
   
   set the rect of group "os x" of me to \
   (the left of me + 4, the bottom of group "windows" of me + 4, the right of me - 8, the bottom of group "windows" of me + 34)
   send "resize" to group "os x" of me
   
   set the rect of group "linux" of me to \
   (the left of me + 4, the bottom of group "os x" of me + 4, the right of me - 8, the bottom of group "os x" of me + 34)
   send "resize" to group "linux" of me
      
   set the bottomleft of button "ok" of me to (the left of me + 6, the bottom of me - 4)
   set the bottomleft of button "cancel" of me to (the right of button "ok" of me + 6, the bottom of me - 4)
end resize
