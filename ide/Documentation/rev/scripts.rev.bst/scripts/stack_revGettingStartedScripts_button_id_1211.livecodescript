Script "stack_revGettingStartedScripts_button_id_1211"

/*
# Name: button "Remove Bold" of group "Removing bold text styles from a field Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1211 of group id 1208 of card id 1002 of stack "revGettingStartedScripts"
# Hash: KqOcN7zWZkbE72uuoHmwvg==
*/


on mouseDown
  removeBold "Example Text"
  put the htmlText of field "Example Text" into field "Example HTML"
end mouseDown
  
on removeBold theFieldName
  put the htmlText of field theFieldName into myHTML
  replace "<b>" with empty in myHTML
  replace "</b>" with empty in myHTML
  set the htmlText of field theFieldName to myHTML
end removeBold
