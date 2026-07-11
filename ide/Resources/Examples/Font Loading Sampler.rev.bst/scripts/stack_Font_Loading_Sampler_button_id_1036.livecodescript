Script "stack_Font_Loading_Sampler_button_id_1036"

/*
# Name: button "horizDivider1" of card "card id 1002" of stack "Font Loading Sampler"
# ID: button id 1036 of card id 1002 of stack "Font Loading Sampler"
# Hash: nWt/9rY2JlGaFuKOybRBKw==
*/


local sMoving, sXLoc, sTopStop, sBotStop

on mouseDown
  setHasDividerBeenUsed true
  put true into sMoving
  
  put item 1 of the loc of me into sXLoc 
  
  put the cTopObjects of me into tList
   
  repeat for each line L in tList
    put item 1 of L into tObj
    put the top of me - the bottom of tObj into tOffset
    put the rect of tObj &","& tOffset & return after tObjRects
  end repeat
   
  delete last char of tObjRects
  set the c_priv_TopObjRects of me to tObjRects
  
  put the cBotObjects of me into tList
  put "" into tObjRects
   
  repeat for each line L in tList
    put item 1 of L into tObj
    put the top of tObj - the bottom of me into tOffset
    put the rect of tObj &","& tOffset & return after tObjRects
  end repeat
   
  delete last char of tObjRects
  set the c_priv_BotObjRects of me to tObjRects  
  
  put the cTopStop of me into sTopStop
  put the cBotStop of me into sBotStop
end mouseDown

on mouseUp
  mouseRelease
end mouseUp

on mouseRelease
  updateFldProps
  put false into sMoving
  unlock Cursor 
end mouseRelease

on mouseMove x, y
  put min(max(y, sTopStop), the height of this cd - sBotStop) into y
  
  if sMoving is true then
    lock screen
    set the loc of me to sXLoc, y
    
    put the cTopObjects of me into tObjList
    put the c_priv_TopObjRects of me into tRectList
    
    repeat with x =1 to the number of lines in tObjList
      put item 1 of line x of tObjList into tObj
      put item 2 of line x of tObjList into tBehavior
      put line x of tRectList into tRect
      put item 5 of tRect into tOffset
      switch tBehavior
      case "S" -->SCALE
        set the rect of tObj to \
            item 1 of tRect, \
            item 2 of tRect, \
            item 3 of tRect, \
            the top of me-tOffset
        break
      case "M" -->MOVE
        put item 4 of tRect - item 2 of tRect into tHeight
        set the rect of tObj to \
            item 1 of tRect, \
            the top of me - tOffset - tHeight, \
            item 3 of tRect, \
            the top of me - tOffset
        break
      end switch
    end repeat
    
    put the cBotObjects of me into tObjList
    put the c_priv_BotObjRects of me into tRectList
     
    repeat with x =1 to the number of lines in tObjList
      put item 1 of line x of tObjList into tObj
      put item 2 of line x of tObjList into tBehavior
      put line x of tRectList into tRect
      put item 5 of tRect into tOffset
      switch tBehavior
      case "S"
        set the rect of tObj to \
            item 1 of tRect, \
            the bottom of me + tOffset, \
            item 3 of tRect, \
            item 4 of tRect
        break
      case "M"
        put item 4 of tRect - item 2 of tRect into tHeight
        set the rect of tObj to \
            item 1 of tRect, \
            the bottom of me + tOffset, \
            item 3 of tRect, \
            the bottom of me + tHeight + tOffset
        break
      end switch
    end repeat
    
    unlock screen
  end if
end mouseMove

on mouseEnter
 lock cursor
 set cursor to the id of img "hDivideCursor.gif"
end mouseEnter

on mouseLeave
  put false into sMoving
  unlock cursor
end mouseLeave

on updateFldProps
end updateFldProps
