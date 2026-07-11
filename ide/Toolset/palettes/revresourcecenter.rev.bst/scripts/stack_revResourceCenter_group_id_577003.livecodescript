Script "stack_revResourceCenter_group_id_577003"

/*
# Name: group "Example" of group id 577915 of group "mainContent" of card "Showorhideascrollbarautomaticallyastextisenteredinafield" of stack "revResourceCenter"
# ID: group id 577003 of group id 577915 of group id 80271 of card id 80261 of stack "revResourceCenter"
# Hash: Tkjh9h1pXDhSv+0mwyOe/A==
*/


on preOpenBackground
  put the originalText of field "Example" into field "Example"
end preOpenBackground

on openBackGround
  select after text of field "Example"
end openBackGround
