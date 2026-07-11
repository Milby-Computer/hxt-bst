Script "stack_revMenuManager_field_id_4864"

/*
# Name: field "Shortcut" of bkgnd "Menu Item Controls" of stack "revMenuManager"
# ID: field id 4864 of bkgnd id 3265 of stack "revMenuManager"
# Hash: AMz45FfGKiPElObrV3wXlA==
*/


on KeyDown
  --only allow entry of one character
  if the selectedText of me is empty and the num of chars in me > 0 then
    beep
    exit KeyDown
  end if
  pass KeyDown
end KeyDown

on keyUp pKey
  global gREVActiveMenuButton
  put the hilitedLine of fld "Menu Items" into tHilitedLine
  put item 3 of line tHilitedLine of gREVMMMenuItems into tMenuLine
  
  --check to see if Shortcut already exists in MenuBar
  put the cREVMenuButtonIds of this stack into tMenuButtonIDs
  put the cREVMenuID of this stack into tMenuID
  set the defaultStack to the cREVDefaultStack of this stack
  --compile list of all menu items
  put empty into tAllMenuItems
  
  repeat for each line l in tMenuButtonIDs
    put the text of btn id l of bg id tMenuID & cr after tAllMenuItems
  end repeat
  
  set the wholeMatches to true
  delete line lineOffset(tMenuLine, tAllMenuItems) of tAllMenuItems
    
  delete last char of tAllMenuItems
  
  --extract all Shortcuts
  put empty into tShortCutList
  repeat for each line l in tAllMenuItems
    if char -2 of l is "/" and char -1 of l is not in " /"
    then put char -1 of l & cr after tShortCutList
  end repeat
  delete last char of tShortCutList
  
  if pKey is among the lines of tShortCutList then
    beep
    answer warning "This shortcut has already been allocated for another menu item."
    select the text of me
    pass keyUp
  end if
  set the defaultStack to "revMenuManager"
  revSetShortCut  
  pass keyUp
end keyUp
  
on revSetShortCut
  global gREVActiveMenuButton, gREVMMMenuItems
  lock screen
  --Keyboard Shortcut 
  
  put the hilitedLine of fld "Menu Items" into tHilitedLine
  put item 3 of line tHilitedLine of gREVMMMenuItems into tMenuLine
  put the scroll of fld "Menu Items" into tScroll
  put the text of gREVActiveMenuButton into tText
  
  put item 2 of line tHilitedLine of gREVMMMenuItems into tMenuItem
  if "/" is char - 2 of tMenuItem and char - 1 of tMenuItem is not "/" and char - 3 of tMenuItem is not "/" 
  then delete char - 2 to -1 of tMenuItem
  if char -1 of tMenuItem is "/" then delete char -1 of tMenuItem
  if char 1 of me is not space and char 1 of me is not empty then
    put "/" & char 1 of me after tMenuItem      
  end if
  
  --update button contents
  put tMenuItem into line tMenuLine of tText
  replace comma with "#####REVCOMMA#####" in tMenuItem
  put tMenuItem into item 2 of line tHilitedLine of gREVMMMenuItems
  set the text of gREVActiveMenuButton to tText
  put tText into btn "Preview"     
  revUpdateField
  set the hilitedLines of fld "Menu Items" to tHilitedLine
  set the scroll of fld "Menu Items" to tScroll
  if the text of me is empty then unhilite btn "Shortcut Checkbox"
  else hilite btn "Shortcut Checkbox"
  
  updateMenuLine
  unlock screen
end revSetShortCut

on returnInField
  lock screen
  closeField
  select the text of me
  unlock screen
end returnInField

on enterInField
  returnInField
end enterInField

on closeField
   if the text of me is empty then
      set the hilite of button "Shortcut Checkbox" to false
      set the hilite of button "Command" to false
      set the hilite of button "Control" to false
      set the hilite of button "Option_Alt" to false
      set the hilite of button "Shift" to false
      disable button "Command"
      disable button "Control"
      disable button "Option_Alt"
      disable button "Shift"
   end if
   pass closeField
end closeField

on exitField
   if the text of me is empty then
      set the hilite of button "Shortcut Checkbox" to false
      set the hilite of button "Command" to false
      set the hilite of button "Control" to false
      set the hilite of button "Option_Alt" to false
      set the hilite of button "Shift" to false
      disable button "Command"
      disable button "Control"
      disable button "Option_Alt"
      disable button "Shift"
   end if
end exitField
