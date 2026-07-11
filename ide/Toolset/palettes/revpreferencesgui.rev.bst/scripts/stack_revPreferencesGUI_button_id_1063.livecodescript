Script "stack_revPreferencesGUI_button_id_1063"

/*
# Name: button "selectionhandle color" of card "Appearance" of stack "revPreferencesGUI"
# ID: button id 1063 of card id 1006 of stack "revPreferencesGUI"
# Hash: DyWQdbVhjSqoIlwkFwjdPQ==
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
  set the backgroundColor of graphic "Selection Handle Swatch" to theItem
  set the selectionHandleColor to theItem
  set the cSelectionHandleColor of stack "revPreferences" to theItem
end menuPick
