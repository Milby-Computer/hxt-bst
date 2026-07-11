Script "stack_revOnline_group_id_937656"

/*
# Name: group "code upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: group id 937656 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: kHlHquMUyJS355Of4AiELQ==
*/


command resize
   set the topleft of field "code upload title" to (the left of me + 4, the top of me + 8)
   set the bottomleft of button "ok" of me to (the left of me + 6, the bottom of me - 4)
   set the bottomleft of button "cancel" of me to (the right of button "ok" of me + 6, the bottom of me - 4)
   set the bottomleft of button "paste" of me to (the right of button "cancel" of me + 6, the bottom of me - 4)
   set the rect of field "code input" of me to \
   (the left of me + 8, the bottom of field "code upload title" of me + 8, the right of me - 8, the top of button "paste" of me - 6)
   
   
end resize
