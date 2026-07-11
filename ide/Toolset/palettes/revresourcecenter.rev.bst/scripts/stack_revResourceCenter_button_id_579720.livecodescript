Script "stack_revResourceCenter_button_id_579720"

/*
# Name: button "Remove Bold" of group "Example" of group id 584245 of group "mainContent" of card "RemovingBoldTextStylesFromAField" of stack "revResourceCenter"
# ID: button id 579720 of group id 577013 of group id 584245 of group id 113740 of card id 113724 of stack "revResourceCenter"
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
