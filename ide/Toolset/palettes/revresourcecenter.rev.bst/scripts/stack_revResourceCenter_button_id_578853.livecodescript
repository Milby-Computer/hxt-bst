Script "stack_revResourceCenter_button_id_578853"

/*
# Name: button "Change underline to italic" of group "Example" of group id 584231 of group "mainContent" of card "Replacingatextstyleinafield" of stack "revResourceCenter"
# ID: button id 578853 of group id 577011 of group id 584231 of group id 109265 of card id 109249 of stack "revResourceCenter"
# Hash: XgZ7gls0WvGU1YiXRzBfxQ==
*/


on mouseDown
  underlineToItalic "Example Text"
  put the htmlText of field "Example Text" into field "Example HTML"
end mouseDown
 
on underlineToItalic theFieldName
  put the htmlText of field theFieldName into myHTML
  replace "<u>" with "<i>" in myHTML
  replace "</u>" with "</i>" in myHTML
  set the htmlText of field theFieldName to myHTML
end underlineToItalic
