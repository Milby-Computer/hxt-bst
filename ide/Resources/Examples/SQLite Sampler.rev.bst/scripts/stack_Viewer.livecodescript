Script "stack_Viewer"

/*
# Name: stack "Viewer" of stack "SQLite Sampler"
# ID: stack "Viewer" of stack "SQLite Sampler"
# Hash: XrTkrBiJi1OgZa6v1HsCMw==
*/


on mouseDoubleUp
  
end mouseDoubleUp

global gAltChecking, gAltOldRect
local lHasDividerBeenUsed

function checkHasDividerBeenUsed
  return lHasDividerBeenUsed
end checkHasDividerBeenUsed()

on setHasDividerBeenUsed pFlag
  put pFlag into lHasDividerBeenUsed
end setHasDividerBeenUsed

on initAltLayoutLib
  switch the platform
  case "MacOS"
    altSetLayoutMode "Mac OSX"
    break
  case "Win32"
    altSetLayoutMode "Win XP"
    break
  default
    altSetLayoutMode "Other"
    break
  end switch
  put false into lHasDividerBeenUsed
end initAltLayoutLib

on altSetLayoutMode pMode
  
  put the short name of this stack into tTheStackName
  
  if tTheStackName is "LayoutManager" then
    answer "Can't edit the Layout Manager stack!"
    exit to top
  end if
   
  replace space with "" in pMode
  #set the defaultStack to tTheStackName
  
  if pMode is "WinXP" then
    if there is a btn "altDrag" then 
      show btn "altDrag"
    end if
  else
    if there is a btn "altDrag" then
      hide btn "altDrag"
    end if
  end if
   
  --> RESIZE STACK
  put the rect of stack tTheStackName into tRect
   
  --> MINWIDTH
  put pMode & "altMinWidth" into tProp
  if "altMinWidth" is among the lines of the customKeys of stack tTheStackName then
    if tProp is among the lines of the customKeys of stack tTheStackName then
      put "put the " & tProp & " of stack " & quote & tTheStackName & quote & " into tPropValue" into tDo
      do tDo
      if isNumber(tPropValue) and tPropValue > 32 then 
        set the altMinWidth of stack tTheStackName to tPropValue
      end if
    end if
    set the minWidth of stack tTheStackName to the altMinWidth of stack tTheStackName
  end if
   
  --> MINHEIGHT
  put pMode & "altMinHeight" into tProp
  if "altMinHeight" is among the lines of the customKeys of stack tTheStackName then
    if tProp is among the lines of the customKeys of stack tTheStackName then
      put "put the " & tProp & " of stack " & quote & tTheStackName & quote & " into tPropValue" into tDo
      do tDo
      if isNumber(tPropValue) and tPropValue > 32 then 
        set the altMinHeight of stack tTheStackName to tPropValue
      end if
    end if
    set the minHeight of stack tTheStackName to the altMinHeight of stack tTheStackName
    #set the height of stack tTheStackName to the altMinHeight of stack tTheStackName
  end if
   
  --> MAXWIDTH
  put pMode & "altMaxWidth" into tProp
  if "altMaxWidth" is among the lines of the customKeys of stack tTheStackName then
    if tProp is among the lines of the customKeys of stack tTheStackName then
      put "put the " & tProp & " of stack " & quote & tTheStackName & quote & " into tPropValue" into tDo
      do tDo
      if isNumber(tPropValue) and tPropValue > 32 then 
        set the altMaxWidth of stack tTheStackName to tPropValue
      end if
    end if
    set the maxWidth of stack tTheStackName to the altMaxWidth of stack tTheStackName
    #set the width of stack tTheStackName to the altMaxWidth of stack tTheStackName
  end if
   
  --> MAXHEIGHT
  put pMode & "altMaxHeight" into tProp
  if "altMaxHeight" is among the lines of the customKeys of stack tTheStackName then
    if tProp is among the lines of the customKeys of stack tTheStackName then
      put "put the " & tProp & " of stack " & quote & tTheStackName & quote & " into tPropValue" into tDo
      do tDo
      if isNumber(tPropValue) and tPropValue > 32 then 
        set the altMaxHeight of stack tTheStackName to tPropValue
      end if
    end if
    set the maxHeight of stack tTheStackName to the altMaxHeight of stack tTheStackName
    #set the height of stack tTheStackName to the altMaxHeight of stack tTheStackName
  end if
   
  --> SET THE STACK RECT USING MIN NUMBERS
  set the rect of stack tTheStackName to \
      item 1 of tRect, \
      item 2 of tRect, \
      item 1 of tRect + the minWidth of stack tTheStackName, \
      item 2 of tRect + the minHeight of stack tTheStackName
   
   
  --> SET CONTROL RECTS AND BEHAVIOR
   
  put the environment into tEnvironment
  --> NEVER WALK THRU CONTROLS...JUST USE CONTROL LIST
  if tEnvironment is "development" then
     
    --> WALK THRU EACH CONTROL ON EACH CD (SLOWER BUT BETTER FOR EDITING)
    repeat with x = 1 to the number of cds in stack tTheStackName
       
      repeat with y = 1 to the number of controls in the current card of stack tTheStackName
        if "altLayoutManager" is among the lines of the customPropertySets of control y then
          set the customPropertySet of control y to "altLayoutManager"
          
          --> SET THE ALTVIS OF CONTROL PER PLATFORM
          put pMode & "altVis" into tProp
          put "put the " & tProp & " of control y into tPropValue" into tDo
          do tDo
          if tPropValue is false then hide control y
          if tPropValue is true then show control y

           
          --> SET THE ALTRECT OF CONTROL PER PLATFORM
          if "altRect" is among the lines of the customKeys of control y then
            put pMode & "altRect" into tProp
            put "put the " & tProp & " of control y into tPropValue" into tDo
            do tDo
            if tPropValue is "" then
              put the altRect of control y into tPropValue
            end if
            set the rect of control y to tPropValue
          end if
           
          if "altCmd" is among the lines of the customKeys of control y then
            put pMode & "altCmd" into tProp
            if tProp is among the lines of the customKeys of control y then
              put "put the " & tProp & " of control y into tPropValue" into tDo
              do tDo
              set the altCmd of control y to tPropValue
            end if
          end if
          set the customPropertySet of control y to empty
        end if
      end repeat
    end repeat
     
  else
    --> WALK THRU CONTROL LIST
    put the altResizeControlList of stack tTheStackName into tControlList
    
    --> CORRECT STACK NAMES
    put the effective fileName of stack tTheStackName into tStackName
    repeat for each line L in tControlList
      put L into tStr
      replace "<stackname>" with tStackName in tStr
      put tStr & cr after tList
    end repeat
    
    repeat for each line L in tList
      
      --> TEST TO SEE IF CONTROL NAME EXISTS
      if exists(L) then
        if "altLayoutManager" is among the lines of the customPropertySets of L then
          set the customPropertySet of L to "altLayoutManager"
          
          --> SET THE ALTVIS OF CONTROL PER PLATFORM
          put the customKeys of L into tKeysList
          filter tKeysList with "*altVis"
          if the number of lines in tKeysList > 0 then
            put pMode & "altVis" into tProp
            if tProp is among the lines of the customKeys of L then
              put "put the " & tProp & " of L into tPropValue" into tDo
              do tDo
              if tPropValue is false then 
                hide L
              else
                show L
              end if
            else
              show L
            end if
          end if

          
          --> SET THE ALTRECT OF CONTROL PER PLATFORM
          if "altRect" is among the lines of the customKeys of L then
            put pMode & "altRect" into tProp
            put "put the " & tProp & " of L into tPropValue" into tDo
            do tDo
            if tPropValue is "" then
              put the altRect of L into tPropValue
            end if
            set the rect of L to tPropValue
          end if
           
          if "altCmd" is among the lines of the customKeys of L then
            put pMode & "altCmd" into tProp
            if tProp is among the lines of the customKeys of L then
              put "put the " & tProp & " of L into tPropValue" into tDo
              do tDo
              set the altCmd of L to tPropValue
            end if
          end if
          set the customPropertySet of L to empty
        end if
      else
        answer warning "Control not found. Exiting Now. Control name: " &cr& L with "Exit to Top" or "OK"
        if it is "exit to top" then
          exit to top
        end if
      end if
    end repeat
  end if
   
end altSetLayoutMode

on altSetRect pObj,pCommands
  if the vis of pObj is false then exit altSetRect
  
  put long id of this card into pRelativeTo
   
  -- ANOTHER OBJECT PASSED AS LONG ID
  
  put the left of pRelativeTo into tLeft
  put the top of pRelativeTo into tTop
  put the right of pRelativeTo into tRight
  put the bottom of pRelativeTo into tBot
   
  put the rect of pObj into tRect
  put the rect of pObj into tRectNew
   
  replace comma with cr in pCommands
  replace ":" with comma in pCommands
  repeat for each line tCmd in pCommands
    switch (item 1 of tCmd)
    case "SX" -->SCALES RIGHT
      put (tRight + (item 2 of tCmd)) into item 3 of tRectNew
      break
    case "SY" -->SCALES DOWN
      put (tBot + (item 2 of tCmd)) into item 4 of tRectNew
      break
    case "MX" --> MOVES RIGHT
      put (tRight + (item 2 of tCmd)) into tRightNew
      put tRightNew - (item 3 of tRect - item 1 of tRect) into item 1 of tRectNew
      put tRightNew into item 3 of tRectNew
      break
    case "MY" --> MOVES DOWN
      put (tBot + (item 2 of tCmd)) into tBotNew --item 4 of tRectNew
      put tBotNew - (item 4 of tRect - item 2 of tRect) into item 2 of tRectNew
      put tBotNew into item 4 of tRectNew
      break
    case "CX" --> CENTERS ALONG THE X AXIS (NO SCALE)
      put (item 3 of tRect - item 1 of tRect) into tWidth
      put round((tRight/2) - (tWidth/2)) into tLeftNew
      put tLeftNew + tWidth into item 3 of tRectNew
      put tLeftNew into item 1 of tRectNew
      break
    case "CY" --> CENTERS ALONG THE Y AXIS (NO SCALE)
      put (item 4 of tRect - item 2 of tRect) into tHeight
      put round((tBot/2) - (tHeight/2)) into tTopNew
      put tTopNew + tHeight into item 4 of tRectNew
      put tTopNew into item 2 of tRectNew
      break
    end switch
  end repeat
   
  set the rect of pObj to tRectNew
end altSetRect

on setStackRect pRect
  --> CALLED FROM END OF RESIZE STACK HANDLER WHEN A DIVIDER HAS BEEN USED
  set the rect of this stack to pRect
end setStackRect

on doneResizing
  put false into gAltChecking
  put the rect of this stack into tRect
  put item 3 of tRect into tRight
  put item 4 of tRect into tBottom
  if item 3 of gAltOldRect > tRight or item 4 of gAltOldRect > tBottom then
    if checkHasDividerBeenUsed() is true then
      initAltLayoutLib
      send setStackRect && quote& tRect &quote to this stack in 50 milliseconds
    end if
  end if
end doneResizing

on CheckMouseState
  put true into gAltChecking
  if the mouse is up then
    doneResizing
  else
    if "CheckMouseState" is not among the items of the pendingMessages then
      send CheckMouseState to me in 10 milliseconds
    end if
  end if
end CheckMouseState

--> END ALTLAYOUT SCRIPTS
