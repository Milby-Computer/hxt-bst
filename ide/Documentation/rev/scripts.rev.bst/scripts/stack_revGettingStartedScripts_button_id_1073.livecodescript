Script "stack_revGettingStartedScripts_button_id_1073"

/*
# Name: button "Change underline to italic" of group "Replacing a text style in a field Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1073 of group id 1070 of card id 1002 of stack "revGettingStartedScripts"
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
