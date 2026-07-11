Script "stack_revNavigator_button_id_1132"

/*
# Name: button "resizer" of card "display" of stack "revNavigator"
# ID: button id 1132 of card id 1002 of stack "revNavigator"
# Hash: mjZal7CmA2w+0WoooGg0Cw==
*/


local lMoving, lDistance, lFormattedWidth, lFormattedHeight
local tHilitedLines -- the hilitedlines of fld "list", so they can be restored

on mouseDown
  put true into lMoving
  put the right of this stack - item 1 of the screenMouseloc,the bottom of this stack - item 2 of the screenMouseLoc into lDistance
  put the formattedWidth of fld "command" into lFormattedWidth
  put the formattedHeight of fld "command" into lFormattedHeight
  put the hilitedLines of fld "list" into tHilitedLines
end mouseDown

on mouseUp
  put false into lMoving
  
  unlock cursor
end mouseUp

on mouseRelease
  put false into lMoving
  
  unlock Cursor
end mouseRelease

on mouseMove
  if lMoving then
    
    put item 1 to 2 of the rect of this stack,item 1 of the screenMouseloc+item 1 of lDistance,item 2 of the screenMouseloc+item 2 of lDistance into tRect
    if item 3 of tRect < (the minWidth of this stack+the left of this stack) then put (the minWidth of this stack+the left of this stack) into item 3 of tRect
    if item 4 of tRect < (the minHeight of this stack+the top of this stack) then put (the minHeight of this stack+the top of this stack) into item 4 of tRect
    if item 3 of tRect > (the maxWidth of this stack+the left of this stack) then put (the maxWidth of this stack+the left of this stack) into item 3 of tRect
    if item 4 of tRect > (the maxHeight of this stack+the top of this stack) then put (the maxHeight of this stack+the top of this stack) into item 4 of tRect
    lock screen
    set the rect of this stack to tRect
    put the width of this stack into tWidth
    put the height of this stack into tHeight
    put the rect of fld "filter" into tRect
    put tWidth - 5 into item 3 of tRect
    set the rect of fld "filter" to tRect
    put the rect of grc "fieldtop" into tRect
    put tWidth + 5 into item 3 of tRect
    set the rect of grc "fieldtop" to tRect
    set the bottomRight of me to tWidth,tHeight
    set the rect of fld "list" to -2,20,(tWidth+1),(tHeight+2)
    set the rect of grc "dragIndicator" to 5,-3,(tWidth-24),-1
    set the rect of fld "abouthead" to -2,-2,(tWidth+1),95
    set the rect of fld "aboutbody" to -2,95,(tWidth+1),(tHeight-12)
    put min(150,tHeight) into tCommandHeight
    set the rect of fld "command" to -2,-2,(tWidth+2),tCommandHeight - 25
    set the loc of group "commandControls" to 83,tCommandHeight - 14
    set the hScrollbar of fld "command" to (lFormattedWidth > tWidth+10)
    set the vScrollbar of fld "command" to (lFormattedHeight > tCommandHeight - 15)
    
    set the rect of group "CommandOption" to 0,-1,(tWidth+2),(tCommandHeight - 25)
    
    set the rect of btn "showNavigator" to -1,(tHeight - 17),(tWidth+1),(tHeight+1)
    set the rect of graphic "New Graphic 1"  to 0,-1,(tWidth+2),(tCommandHeight - 25)
    set the rect of field "CommandOptionList" to 0,-1,(tWidth+2),(tCommandHeight - 50)
    
    set the rect of field "CommandOptionLabel" to 0,(tCommandHeight - 47),(tWidth-95),(tCommandHeight - 27)
    set the rect of button "CommandOptionPopup1" to 8,13,(min((tWidth-20),200)),33
    set the rect of button "CommandOptionPopup2" to 8,39,(min((tWidth-20),200)),59
    set the loc of group "CommandOptionControls" to (tWidth - 48),(tCommandHeight - 38)
    
    set the hilitedLines of fld "list" to tHilitedLines
    
    
    unlock screen
  end if
end mouseMove

on mouseDoubleUp 
  hideNavigator
end mouseDoubleUp
