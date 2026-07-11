Script "stack_revPreferencesGUI_button_id_1071"

/*
# Name: button "backdrop color" of group "Appearance" of card "Appearance" of stack "revPreferencesGUI"
# ID: button id 1071 of group id 1062 of card id 1008 of stack "revPreferencesGUI"
# Hash: yrRnCTIMZlF35jLkxqIZ6A==
*/


local lastItem

on mouseDown
  revRetainLabel
end mouseDown

on returnKey
  revRetainLabel
  pass returnKey
end returnKey

on enterKey
  revRetainLabel
  pass enterKey
end enterKey

on revRetainLabel
  put the label of me into lastItem
end revRetainLabel

on menuPick theItem
  if theItem is empty then
    set the label of me to lastItem
    exit menuPick
  end if
  if theItem is "Other..." then
    answer color
    if it is empty then -- canceled the dialog
      set the wholeMatches to true
      set the menuHistory of me to lineOffset(lastItem,me)
      pass menuPick
    end if
    put it into theItem
  end if
  set the backgroundColor of graphic "Backdrop Swatch" to theItem
  if the backdrop is not "none" then set the backdrop to theItem
  set the cBackDropColor of stack "revPreferences" to theItem
  set the cBackDrop of stack "revPreferences" to theItem
end menuPick
