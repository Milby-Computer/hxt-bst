Script "stack_revPreferencesGUI_button_id_1079"

/*
# Name: button "hypertext color" of group "Appearance" of card "Appearance" of stack "revPreferencesGUI"
# ID: button id 1079 of group id 1062 of card id 1008 of stack "revPreferencesGUI"
# Hash: HKaYcYEWzF5zJrSpF+66Qw==
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
  global gRevHelpHiliteColor
  if theItem is empty then
    set the label of me to lastItem
    exit menuPick
  end if  
  if theItem is "Other..." then
    answer color
    if it is empty then
      set the wholeMatches to true
      set the menuHistory of me to lineOffset(lastItem,me)
      pass menuPick
    end if
    put it into theItem
  end if
  put spacesRemoved(theItem) into gRevHelpHiliteColor
  set the backgroundColor of graphic "Help Hilite Swatch" of card "Appearance" to gRevHelpHiliteColor
  set the cREVHelpHiliteColor of stack "revPreferences" to gRevHelpHiliteColor
end menuPick

function spacesRemoved theString
  put empty into returnedString
  repeat for each word thisWord in theString
    put thisWord after returnedString
  end repeat
  return returnedString
end spacesRemoved
