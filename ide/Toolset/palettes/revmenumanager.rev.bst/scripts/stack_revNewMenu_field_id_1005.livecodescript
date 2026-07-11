Script "stack_revNewMenu_field_id_1005"

/*
# Name: field "Menus" of card id 1002 of stack "revNewMenu" of stack "revMenuManager"
# ID: field id 1005 of card id 1002 of stack "revNewMenu" of stack "revMenuManager"
# Hash: I91hVYX5+i+mJVj+rO/iwg==
*/


on rawKeyDown
  send "revUpdateDisabling" to me in 10 milliseconds
  pass rawKeyDown
end rawKeyDown
  
on revUpdateDisabling
  if me is not empty and fld "Name" is not empty and the label of btn "Open Stacks" is not space 
  then enable btn "OK"
  else disable btn "OK"
end revUpdateDisabling

on enterInField
  if me is not empty then click at the loc of btn "OK"
end enterInField
