Script "stack_revGettingStartedScripts_button_id_1120"

/*
# Name: button "Update Font Menu" of group "Placing a font list into a menu Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1120 of group id 1117 of card id 1002 of stack "revGettingStartedScripts"
# Hash: ufSGD2XE9JQ4CYwPbmt0HA==
*/


on mouseUp
  createFontMenu
end mouseUp

on createFontMenu
  get the fontNames -- list of installed fonts
  sort lines of it
  put it into button "Font"
end createFontMenu
