Script "stack_revResourceCenter_button_id_579838"

/*
# Name: button "Populate Menu..." of group "Example" of group id 579841 of group "mainContent" of card "Textmenu:populatingwithcontent" of stack "revResourceCenter"
# ID: button id 579838 of group id 577029 of group id 579841 of group id 82665 of card id 82654 of stack "revResourceCenter"
# Hash: McoRpxpJfNabmLs/HIhFOw==
*/


on mouseUp
  ask "Please enter point sizes to display, separated by commas:" with "9,10,12,14,18,20,24,36"
  if the result is not empty then exit mouseUp
  repeat for each item thisItem in it
    put replaceText(thisItem,"[^0-9]",empty) into thisItem
    if thisItem is an integer then put thisItem & comma after theSizesList
  end repeat
  if last char of theSizesList is comma then delete last char of theSizesList
  ask "Please enter color names to display, separated by commas:" with "Black,Yellow,Red,Blue,Green"
  if the result is not empty then exit mouseUp
  repeat for each item thisItem in it
    if thisItem is among the lines of the colorNames then put thisItem & comma after theColorsList
  end repeat
  if last char of theColorsList is comma then delete last char of theColorsList
  populateTextMenu theSizesList,theColorsList
end mouseUp

on populateTextMenu theSizes,theColors
  if theSizes is empty then put \
     "9,10,12,14,18,20,24,36" into theSizes
  if theColors is empty then put \
     "Black,Yellow,Red,Blue,Green" into theColors
  -- set up the Font submenu:
  get the fontnames
  sort it
  put "Font" into button "Text"
  repeat for each line thisFont in it
    put return & tab & thisFont after button "Text"
  end repeat
  -- set up the Size submenu:
  put return & "Size" after button "Text"
  repeat for each item thisSize in theSizes
    put return & tab & thisSize after button "Text"
  end repeat
  -- set up the Color submenu:
  put return & "Color" after button "Text"
  repeat for each item thisColor in theColors
    put return & tab & thisColor after button "Text"
  end repeat
  -- set up style choices:
  put return & "(-" & return & "Plain" & return & "Bold" \
     & return & "Italic" & return & "Underline" \
     after button "Text"
end populateTextMenu
