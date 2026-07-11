Script "stack_revMenuManager_field_id_4872"

/*
# Name: field "Menu Buttons" of bkgnd "Button Menus:" of stack "revMenuManager"
# ID: field id 4872 of bkgnd id 3224 of stack "revMenuManager"
# Hash: xrF5sN0nRjA9uHgIANaN3Q==
*/


local lMenuNameHtml

on mouseDown
  if text of me is empty or the mouseLine is empty then exit mouseDown
  put the hilitedLine of me into tHilitedLine
  put word 2 of the mouseLine into tMouseLine
  set the cBroughtUpAnswerDialog of fld "Menu Name" to false
  revCheckNameChanged
  lock screen
  set the hilitedLine of me to tMouseLine
  if the cBroughtUpAnswerDialog of fld "Menu Name"
  then mouseUp
  unlock screen
end mouseDown

on revCheckAndChangeMenuName
  if the htmlText of fld "Menu Name" is not lMenuNameHtml
  then send "revChangeMenuName" to fld "Menu Name"
end revCheckAndChangeMenuName

on mouseUp
  global gREVActiveMenuButton
  if the cAnswerDialog of fld "Menu Name" or the cAnswerDialog of fld "Item Name" then exit mouseUp
  lock screen
  put the hilitedLine of me into tHilitedLine
  put the scroll of me into tScroll
  put revMenuLongID(line tHilitedLine of the cREVMenuButtonIds of this stack) into gREVActiveMenuButton
  --insertion widgets
  if tHilitedLine is not empty
  then set the top of grp "Menu Insert" to the item 2 of the selectedLoc of me + 6
  else set the top of grp "Menu Insert" to the top of fld "Menu Buttons" -6
  set the cREVLine of grp "Menu Insert" to tHilitedLine
  set the cREVLastWidgetLine of grp "Menu Insert" to empty
  
  if the text of me is empty then
    --no menus
    disable btn "Preview"
    put empty into btn "Preview"
    set the textFont of btn "Preview" to empty
    set the cREVLabel of btn "Preview" to empty
    disable btn "Delete Menu"
    put empty into fld "Menu Name"
    disable fld "Menu Name" 
    set the cREVDisabled of btn "Move Menu Up" to true
    set the cREVDisabled of btn "Move Menu Down" to true
    unhilite btn "Disable Menu"
    disable btn "Disable Menu"
    unhilite btn "Menu Mnemonic"
    disable btn "Menu Mnemonic"
    set the label of btn "Menu Mnemonic Letter" to space
    disable btn "Menu Mnemonic Letter"
    disable btn "Edit Script"
    disable btn "Auto Script"
    put empty into fld "Menu Items"
    revResetTriangles    
  else
    --menus exist
     enable btn "Preview"
     set the unicodeLabel of button "preview" to the unicodeText of gREVActiveMenuButton
    --put the text of gREVActiveMenuButton into btn "Preview"
    --disable then enable grp to reliably enable everthing in it
    disable grp "Button Menus:"
    enable grp "Button Menus:"
    --disabling and enabling Button Menus here looses selection
    set the hilitedLine of me to tHilitedLine
    set the scroll of me to tScroll
    
    if tHilitedLine is 1 then set the cREVDisabled of btn "Move Menu Up" to true
    else set the cREVDisabled of btn "Move Menu Up" to false
    if tHilitedLine is the num of lines in me 
    then set the cREVDisabled of btn "Move Menu Down" to true
    else set the cREVDisabled of btn "Move Menu Down" to false
     
    --updating for selected menu button
    --if comma is in the effective textFont of gREVActiveMenuButton then 
      set the unicodeText of fld "Menu Name" to the unicodelabel of gREVActiveMenuButton
      disable btn "Menu Mnemonic"
      --set the textFont of btn "Preview" to the effective textFont of gREVActiveMenuButton
    --else 
      --set the htmlText of fld "Menu Name" to "<p>"& the label of gREVActiveMenuButton&"</p>"
      --enable btn "Menu Mnemonic"
      --set the textFont of btn "Preview" to empty
      --end if
      
    put the htmlText of fld "Menu Name" into lMenuNameHtml
    set the cREVLabel of btn "Preview" to the unicodeText of line tHilitedLine of me
    
    if the mnemonic of gREVActiveMenuButton is 0 or comma is in the effective textFont of gREVActiveMenuButton then 
      unhilite btn "Menu Mnemonic"
      set the label of btn "Menu Mnemonic Letter" to space
      disable btn "Menu Mnemonic Letter"
    else
      hilite btn "Menu Mnemonic"
      set the label of btn "Menu Mnemonic Letter" to char (the mnemonic of gREVActiveMenuButton) of the label of gREVActiveMenuButton
      enable btn "Menu Mnemonic Letter"
    end if
    set the hilite of btn "Disable Menu" to the disabled of gREVActiveMenuButton
    revGenerateItemsField
  end if
   
  revInitialiseForNoItemSelection
  revUpdateScrollbar
  set the thumbPosition of sb "Menu Items" to 0
  unlock screen
end mouseUp

on mouseRelease
  mouseUp
  pass mouseRelease
end mouseRelease

on scrollbarDrag
  global gREVTextHeight
  --update insertion widgets
  if the cREVLastWidgetLine of grp "Menu Insert" is empty then 
    put (item 2 of the loc of grp "Menu Insert" - the top of fld "Menu Buttons")/gREVTextHeight into tWidgetLine
    put round(tWidgetLine) into tWidgetLine
    set the cREVLastWidgetLine of grp "Menu Insert" to tWidgetLine
  end if
  put round(the cREVLastWidgetLine of grp "Menu Insert" + (the scroll of me/gREVTextHeight)) into tNewLine
  set the cREVLine of grp "Menu Insert" to tNewLine
  set the top of grp "Menu Insert" to the formattedTop of line tNewLine of me + 8
  pass scrollbarDrag
end scrollbarDrag
