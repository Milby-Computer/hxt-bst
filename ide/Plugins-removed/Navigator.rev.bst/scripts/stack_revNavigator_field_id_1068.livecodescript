Script "stack_revNavigator_field_id_1068"

/*
# Name: field "command" of group "commandGroup" of card "display" of stack "revNavigator"
# ID: field id 1068 of group id 1100 of card id 1002 of stack "revNavigator"
# Hash: em+zNCF7Q0+EVMXC7A07fw==
*/




on rawKeyUp
  checkMyScroll
  pass rawKeyUp
end rawKeyUp

on checkMyScroll
  set the hScrollbar of me to (the formattedWidth of me > the width of me + 10)
  set the vScrollbar of me to (the formattedHeight of me > the height of me + 10)
end checkMyScroll
