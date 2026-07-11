Script "stack_Answer_Dialog_card_id_1002"

/*
# Name: card "card id 1002" of stack "Answer Dialog"
# ID: card id 1002 of stack "Answer Dialog"
# Hash: WKyhliq3Gir64O+Rcmk11Q==
*/


on preOpenStack
   global gAnswerDebugInfo
   global gAPKLargeFonts, gREVSmallAppIcon, gREVAppIcon
   local tIcons, tMacOSX, tMargin, tNumber, tIconWord, tIconAllowance, tText
   local tButtonNames, tNoOfButtons, tTotalBtnWidth, tMnemonicString, tNo
   local tFieldScript, tFieldSubtract, t, tWidth, tNewWidth, oldwidth, tAddition
   local tStartEdge, tHeight
   
   // HXT dark mode
   set the backgroundColor of me to (the systemWindowColor)
   set the foregroundColor of me to (the systemTextColor)
   
   // AL-2014-05-21: [[ Bug 12074 ]] Tidied up and rearranged to support 
   //  RTL layout, as determined by item 5 of the dialogData
   
   --platform specific font adjustments
   set the default of button 3 to false
   set the bottomRight of button "icon 2" to -100,-100
   
   local tStackLoc
   local tScreenRect
   put line (the screen of this stack) of the screenRects into tScreenRect
   
   local tScreenWidth
   put item 3 of tScreenRect - item 1 of tScreenRect into tScreenWidth
   
   local tScreenHeight
   put item 4 of tScreenRect - item 2 of tScreenRect into tScreenHeight
   
   put item 1 of tScreenRect + (tScreenWidth div 2),item 2 of tScreenRect + (tScreenHeight div 2) into tStackLoc
   
   switch the platform
      case "MacOS"
         put true into tMacOSX
         set the loc of this stack to tStackLoc
         set the top of this stack to item 2 of tScreenRect + round(tScreenHeight/5)
         repeat with i = 3 to the number of btns
            set the margins of button i to 4
            set the height of button i to 23
         end repeat
         set the textFont of this stack to "Lucida Grande"
         set the textSize of this stack to 13
         set the textSize of field 1 of me to 13
         put "210093 210092 210094 210093" into tIcons
         break
      case "Win32"
         if gAPKLargeFonts then
            put 26 into tNumber
            put 7 into tMargin
         else
            put 21 into tNumber
            put 5 into tMargin
         end if
         repeat with i = 3 to the number of btns
            set the bottomMargin of button i to tMargin
            set the height of button i to tNumber
            set the traversalOn of button i to false
            set the mnemonic of button i to 0
         end repeat
         --> BELOW ADDED BY CHIPP WALTERS
         ##set the textFont of this stack to "Tahoma"
         ##set the textSize of this stack to 11
         
         ## Removed by EJB 18/07/2013 - Bug 11054
         ## Cleared so uses default font and size
         set the textFont of this stack to empty
         set the textSize of this stack to empty
         
         --> BELOW COMMENTED OUT BY CHIPP WALTERS
         #set the textFont of this stack to "MS Sans Serif"
         #set the textSize of this stack to 10
         
         set the textFont of field 1 of me to empty
         put "210005 210011 210003 210004" into tIcons
         break
      default
         repeat with i = 3 to the number of btns
            set the bottomMargin of button i to 4
            set the height of button i to 22
            set the traversalOn of button i to false
            set the mnemonic of button i to 0
         end repeat
         set the textFont of this stack to "Helvetica"
         if gAPKLargeFonts then set the textSize of this stack to 14
         else set the textSize of this stack to 12
         set the textFont of field 1 of me to empty
         put "210008 210010 210006 210010" into tIcons
         break
   end switch
   
   set the itemDelimiter to numToChar(0)
   
   local tRTL
   get item 5 of the dialogdata 
   if it is empty then
      put false into tRTL
   else
      put it is "true" into tRTL
   end if
   
   -- field alignment
   if tRTL then
      set the textAlign of field 1 to "right"
   else
      set the textAlign of field 1 to "left"
   end if
   
   --is there an icon to display or not?
   local tHasIcon, tIconX, tIconTop
   if word 2 of item 1 of the dialogData is "plain" and (not tMacOSX and gREVAppIcon is not empty) then
      set the loc of button 1 to -100,21
      put 0 into tIconAllowance
      put false into tHasIcon
   else
      put true into tHasIcon
      if tMacOSX then
         put 87 into tIconAllowance
         put 52 into tIconX
         put 18 into tIconTop
      else
         put 40 into tIconAllowance
         put 26 into tIconX
         put 6 into tIconTop
      end if
      
      put wordOffset(word 2 of item 1 of the dialogData, "information error warning question") into tIconWord
      if tMacOSX and tIconWord is 0 then --large app icon
         set the icon of button "icon" to gREVAppIcon
      else
         set the icon of button "icon" to word tIconWord of tIcons
      end if
   end if
   
   --title
   if item 2 of the dialogData is empty then set the title of this stack to space
   else set the title of this stack to item 2 of the dialogData
   put item 3 of dialogData into tText
   if "<p>" is in tText or matchChunk(tText, "<(.+>.+</.+)>") then set the htmlText of field 1 of me to tText
   else set the text of field 1 of me to tText
   
   --buttons
   
   # TH-2008-02-07 :: Bug 6427, answer dialog will display all buttons 
   # specified up to tButtonLimit
   local tButtonNamesList, tButtonLimit
   put item 4 of dialogData into tButtonNamesList
   put 7 into tButtonLimit
   repeat with x = 1 to min(tButtonLimit, the number of lines of tButtonNamesList)
      put line x of tButtonNamesList & return after tButtonNames
   end repeat
   delete the last char of tButtonNames  
   
   if tButtonNames is empty then
      put "OK" into tButtonNames
   end if
   put the number of lines in tButtonNames into tNoOfButtons
   
   put 32 into tTotalBtnWidth
   --truncate more buttons to the maximum allowed (7)
   if tNoOfButtons > the number of buttons - 2 then put the number of buttons - 2 into tNoOfButtons
   put empty into tMnemonicString
   repeat with i = 3 to (tNoOfButtons + 3)
      set the name of button i to line tNoOfButtons - (i - 3) of tButtonNames
      if the platform is "Win32" and the short name of button i is not in "OKCancel" then
         put 0 into tNo
         repeat for each char x in the short name of button i
            add 1 to tNo
            if x is not in tMnemonicString then
               put x after tMnemonicString
               set the mnemonic of button i to tNo
               exit repeat
            end if
         end repeat
      end if
      set the width of button i to 82
      if the width of button i < the formattedWidth of button i +28 then set the width of button i to the formattedWidth of button i + 28
      add the width of button i + 12 to tTotalBtnWidth
   end repeat
   set the dontWrap of field 1 of me to true
   if tMacOSX then put 4 into tFieldSubtract else put 0 into tFieldSubtract
   
   put max(400, max(the formattedWidth of field 1 of me + tIconAllowance + 16, tTotalBtnWidth) + tFieldSubtract) into tWidth
   
   # Marcus: fix to bug 4830..
   # Above and below I wrapped a second max around the calculation.
   -- Fix integrated
   --  if tWidth < 400 then 
   --    put 400 into tWidth
   --  end if
   --  if tTotalBtnWidth > 400 then 
   --    put tTotalBtnWidth into tWidth
   --    set the width of field 1 to twidth - tIconAllowance - 16
   --    set the dontWrap of field 1 to false
   --     
   --  else if tWidth > 400 then
   --    put 400 into twidth
   --    set the width of field 1 to twidth - tIconAllowance - 16
   --    set the dontWrap of field 1 to false
   --    put the formattedWidth of field 1 into tNewWidth
   --    if tNewWidth > (400 - tIconAllowance - 16 - tFieldSubtract) then
   --      put max(the formattedWidth of field 1 + tIconAllowance + 16, tTotalBtnWidth)+tFieldSubtract into tWidth
   --      set the width of field 1 to twidth - tIconAllowance - 16
   --    end if
   --    
   --  end if
   
   if tWidth > 400 then
      -- The nonwrapped text does not fit in a minimal message box, thus allow to wrap, recalculating the width.
      set the width of field 1 of me to 1
      set the dontWrap of field 1 of me to false
      put max(400, max(the formattedWidth of field 1 of me + tIconAllowance + 16, tTotalBtnWidth) + tFieldSubtract) into tWidth
   end if
   
   put the width of this stack into oldwidth
   set the width of this stack to tWidth
   
   --set icon position in light of possible new stack width
   if tHasIcon then
      if tRTL then put tWidth - tIconX into tIconX
      set the loc of button "icon" to tIconX,0
      set the top of button "icon" to tIconTop
   end if
   
   set the itemDel to comma
   if tRTL then      
      set the topRight of field 1 of me to tWidth - (tIconAllowance + 8), 12
      get the rect of field 1 of me
      put 12 into item 1 of it
   else
      set the topLeft of field 1 of me to tIconAllowance + 8, 12
      get the rect of field 1 of me
      put tWidth - 12 into item 3 of it
   end if
   set the rect of field 1 of me to it
   
   
   #debugLog "Rect of field 1 after setting:" && ( the rect of field 1) & return
   if tMacOSX then put 5 into tAddition else put 0 into tAddition
   
   if tRTL then
      put 12 + tAddition into tStartEdge
   else
      put tWidth -12 - tAddition into tStartEdge
   end if
   
   -- [[ Bug 17001]] Ensure the dialog is tall enough for the icon + margin
   put the formattedHeight of field 1 of me + 58 into tHeight
   if tHasIcon then
      put max(tHeight, the bottom of button "icon" + tIconTop) into tHeight
   end if
   
   if tHeight > 400 then
      set the vScrollbar of field 1 of me to true
      put 400 into tHeight
   else set the vScrollbar of field 1 of me to false
   local tTop
   put the top of field 1 of me into tTop
   set the height of this stack to tHeight
   set the height of field 1 of me to tHeight - 58
   set the top of field 1 of me to tTop
   --set the topLeft of field 1 of me to tIconAllowance + 8, 12
   
   // AL-2014-05-21: [[ Bug 11493 ]] Linux confirmation button should be on the right
   if the platform is in "MacOSLinux" then
      if tMacOSX then put 6 into tAddition else put 0 into tAddition
      repeat with i = 3 to tNoOfButtons + 2
         if tRTL then
            set the left of button i to tStartEdge
            add the width of button i + 10 to tStartEdge
         else
            set the right of button i to tStartEdge        
            subtract the width of button i + 10 from tStartEdge
         end if
         
         set the bottom of button i to the height of this stack - 12 - tAddition
         if i is 5 and tNoOfButtons is 3 and word 1 of the short name of button i is "Don't" then
            --move don't save to the side
            if tRTL then
               set the right of button i to the right of field 1 of me - 5
            else
               set the left of button i to the left of field 1 of me + 5
            end if
         end if
      end repeat
   else
      repeat with i = (tNoOfButtons + 2) down to 3
         if tRTL then
            set the left of button i to tStartEdge
            add the width of button i + 12 to tStartEdge
         else
            set the right of button i to tStartEdge        
            subtract the width of button i + 12 from tStartEdge
         end if
         set the bottom of button i to the height of this stack - 12
      end repeat
   end if
   if the platform is "MacOS" then set the top of this stack to round(item 4 of the screenRect/5)
   set the default of button 3 to true
   #debugLog "DONE"
   
   -- Provide keyboard navigation on Linux and Windows but not OSX
   if the platform is not "MacOS" then
      -- Make sure that we don't make the icon buttons navigable
      repeat with i = (tNoOfButtons + 2) down to 3
         set the traversalOn of button i to true
      end repeat
   end if
   
   --get the rect of field 1 of me
   --put the width of this stack - 12 into item 3 of it
   --set the rect of field 1 of me to it
end preOpenStack

on commandKeyDown pKey
   if pKey is "." then
      if there is a button "Cancel" then
         click at the loc of button "cancel"
         exit commandKeyDown
      end if
   end if
   repeat with i = 3 to the number of btns
      if item 1 of the loc of button i < 1 then next repeat
      if char 1 of the short name of button i is pKey then
         set the hilite of button i to true
         wait 50 milliseconds
         set the hilite of button i to false
         send "mouseUp" to button i
         exit repeat
      end if
   end repeat
end commandKeyDown

on escapeKey
   if there is a button "cancel" then click at the loc of button "cancel"
end escapeKey

on closeStack
   revCleanUpAnswerDialog
end closeStack

on revCleanUpAnswerDialog
   --show invisibles compatible removal of btns
   repeat with i = 3 to the number of buttons
      set the cPrevLoc of button i to the loc of button i
      set the loc of button i to -100,-100
   end repeat
   set the dialogData to empty
   
   if the environment is "development" then
      send "ideMessageSend" && "ideAnswerDialogClosed" to stack "revIDELibrary" in 0 millisecs
   end if
end revCleanUpAnswerDialog

on mouseUp
  if the name of the target contains "button" then
    lock messages--prevents user stack getting refocusing messages
    close this stack
    revCleanUpAnswerDialog--won't get closeStack
    unlock messages
    set the dialogData to the short name of the target
  end if
end mouseUp

on returnKey
  pass returnKey to top
end returnKey

on linkClicked pLink
  if "@" is in pLink then revMail pLink
  else revGoURL pLink
end linkClicked

on debugLog pMsg, pDel
  --  global gAnswerDebugInfo
  --  repeat for each line tLine in pMsg
  --    put pDel & tLine & return after gAnswerDebugInfo
  --  end repeat
end debugLog


on SystemAppearanceChanged pMode, pWindowColor, pTextColor
   set the backgroundColor of me to pWindowColor
   set the foregroundColor of me to pTextColor
end SystemAppearanceChanged
