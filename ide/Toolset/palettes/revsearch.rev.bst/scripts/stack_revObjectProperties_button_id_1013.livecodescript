Script "stack_revObjectProperties_button_id_1013"

/*
# Name: button "Other Properties" of bkgnd "Object Properties to Search In:" of stack "revObjectProperties" of stack "revSearch"
# ID: button id 1013 of bkgnd id 1029 of stack "revObjectProperties" of stack "revSearch"
# Hash: eHAk1WZcB+ooJcpdZJFZMg==
*/


on mouseUp
  if the hilite of me then
    enable btn "all other object properties"
    enable btn "specific property"
    disable btn "specific property selector"
    set the hilite of btn "all other object properties" to true
    set the hilite of btn "specific property" to false
  else
    disable btn "specific property selector"
    disable btn "all other object properties"
    disable btn "specific property"
  end if
end mouseUp
