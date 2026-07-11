Script "stack_revOnline_group_id_937665"

/*
# Name: group "Linux" of group "external upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: group id 937665 of group id 937669 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: 7h+aYuXwmogZIzjuCVSGow==
*/


command resize
   set the left of button "check" of me to the left of me + 4
   set the right of button "browse" of me to the right of me - 4
   set the rect of field "path" of me to \
          (the right of button "check" of me + 4, the top of me + 5, the left of button "browse" of me - 8, the bottom of me - 4)
   set the rect of image "path background" of me to \
          (the right of button "check" of me + 4, the top of me + 5, the left of button "browse" of me - 8, the bottom of me - 4)
end resize
