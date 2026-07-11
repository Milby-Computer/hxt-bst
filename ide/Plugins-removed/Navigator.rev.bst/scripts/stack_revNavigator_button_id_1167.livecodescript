Script "stack_revNavigator_button_id_1167"

/*
# Name: button "Jump To:" of group "about" of card "display" of stack "revNavigator"
# ID: button id 1167 of group id 1113 of card id 1002 of stack "revNavigator"
# Hash: L64vCkYG0SgDd0yjHkD+Qw==
*/


on menuPick pWhich
  find whole ("--" && pWhich && "--") in fld "aboutBody" of stack "revNavigator"
  find empty
end menuPick
