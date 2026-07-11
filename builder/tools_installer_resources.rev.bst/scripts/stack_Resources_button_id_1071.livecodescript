Script "stack_Resources_button_id_1071"

/*
# Name: button "Scrolling List Behavior" of card "Resources" of stack "Resources"
# ID: button id 1071 of card id 1023 of stack "Resources"
# Hash: T/74YKaFIULg3Ev45/YZ4w==
*/


local sExtent
local sScroll
local sDragging
local sDraggingOffset

on preOpenControl
   put 0 into sScroll
   put the formattedHeight of field "Text" of me into sExtent
   put false into sDragging
   set the text of image "Bar" of me to the text of resolveImageLongId("scroll-bar")
   resizeControl
end preOpenControl

on resizeControl
   local tTop, tLeft, tRight, tBottom, tWidth, tHeight
   put the top of me into tTop
   put the left of me into tLeft
   put the right of me into tRight
   put the bottom of me into tBottom
   put tRight - tLeft into tWidth
   put tBottom - tTop into tHeight
   
   set the rect of field "Text" of me to tLeft, tTop, tRight - 11, tBottom
   set the topRight of button "Up" of me to tRight, tTop
   set the bottomRight of button "Down" of me to tRight, tBottom
   set the rect of button "Well" of me to tRight - 11, tTop + 13, tRight,  tBottom - 13
   updateScroller
   updateScrollerEnabled
end resizeControl

setProp uText pNewText
   put pNewText into field "Text" of me
   put the formattedHeight of field "Text" of me into sExtent
   put 0 into sScroll
   updateScroller
   updateScrollerEnabled
end uText

setProp uFormattedTextArray pNewText
   local tMktIndex
   put 1 into tMktIndex
   put empty into field "Text" of me
   repeat while pNewText[tMktIndex]["content"] is not empty
      switch pNewText[tMktIndex]["type"]
         case "html" 
            set the HTMLText of char (the number of chars in field "Text" + 1) field "Text" of me to pNewText[tMktIndex]["content"]
            break
         case "rtf" 
            set the RTFText of char (the number of chars in field "Text" + 1) field "Text" of me to pNewText[tMktIndex]["content"]
            break
         case "unicode"
            set the unicodeText of char (the number of chars in field "Text" + 1) field "Text" of me to pNewText[tMktIndex]["content"]
            break
         case "utf8" 
            set the unicodeText of char (the number of chars in field "Text" + 1) field "Text" of me to unidecode(pNewText[tMktIndex]["content"], "UTF8")
            break
         case "plain"
         default
            set the text of char (the number of chars in field "Text" + 1) field "Text" of me to pNewText[tMktIndex]["content"]
            break            
      end switch
      --set the text of char (the number of chars in field "Text" + 1) field "Text" of me to return
      put return after field "Text" of me
      add 1 to tMktIndex
   end repeat
   put the formattedHeight of field "Text" of me into sExtent
   put 0 into sScroll
   updateScroller
   updateScrollerEnabled
end uFormattedTextArray


on mouseDown
   put true into sDragging
   if the short name of the target is among the words of "Up Down" then
      buttonAction the short name of the target, "down"
   else if the short name of the target is "Bar" then
      put the clickV - the top of control "Bar" into sDraggingOffset
   else if the short name of the target is "Well" then
      if the clickV < the top of control "Bar" then
         moveOnePage "Up"
      else if the clickV > the bottom of control "Bar" then
         moveOnePage "Down"
      end if
   end if
end mouseDown

on mouseUp
   put false into sDragging
   if the short name of the target is among the words of "Up Down" then
      buttonAction the short name of the target, "up"
   end if
end mouseUp

on mouseRelease
   if the short name of the target is among the words of "Up Down" then
      buttonAction the short name of the target, "release"
   end if
end mouseRelease

on mouseMove pX, pY
   if the short name of the target is among the words of "Up Down" then
      if sDragging then
         buttonAction the short name of the target, "drag"
      else
         buttonAction the short name of the target, "move"
      end if
   else if the short name of the target is "Bar" then
      if sDragging then
         local tOffset
         put pY - sDraggingOffset - the top of control "Well" into tOffset
         put min(max(0, tOffset), the height of control "Well" - the height of control "Bar") into tOffset
         put tOffset * (sExtent - the height of me) div (the height of control "Well" - the height of control "Bar") into sScroll
         updateScroller
      end if
   end if
end mouseMove

on mouseEnter
   if the short name of the target is among the words of "Up Down" then
      buttonAction the short name of the target, "enter"
   end if
end mouseEnter

on mouseLeave
   if the short name of the target is among the words of "Up Down" then
      buttonAction the short name of the target, "leave"
   end if
end mouseLeave

on mouseStillDown
   if the short name of the target is among the words of "Up Down" then
      moveOneLine the short name of the target
   else if the short name of the target is "Well" then
      if the clickV < the top of control "Bar" then
         moveOnePage "Up"
      else if the clickV > the bottom of control "Bar" then
         moveOnePage "Down"
      end if
   end if
end mouseStillDown

on rawKeyDown pKey
   if pKey is 65308 then -- wheel up
      moveOneLine "Down"
   else if pKey is 65309 then -- wheel down
      moveOneLine "Up"
   end if
end rawKeyDown

private command moveOneLine pDirection
   if pDirection is "Up" then
      put max(0, sScroll - the effective textHeight of field "Text" of me) into sScroll
   else 
      put min(sExtent - the height of me, sScroll + the effective textHeight of field "Text" of me) into sScroll
   end if
   updateScroller
end moveOneLine

private command moveOnePage pDirection
   if pDirection is "Up" then
      put max(0, sScroll - the height of field "Text" of me) into sScroll
   else 
      put min(sExtent - the height of me, sScroll + the height of field "Text" of me) into sScroll
   end if
   updateScroller
end moveOnePage

private command updateScroller
   if sExtent > the height of me then
      local tOffset, tHeight
      put min(the height of button "Well" of me, the height of button "Well" of me * the height of me div (sExtent - the height of me)) into tHeight
      put (the height of button "Well" of me - tHeight) * sScroll div (sExtent - the height of me) into tOffset
      set the rect of image "Bar" of me to the left of button "Well" of me, the top of button "Well" of me + tOffset, the right of button "Well" of me, the top of button "Well" of me + tOffset + tHeight - 1
      set the vScroll of field "Text" of me to sScroll
   end if
end updateScroller

private command buttonAction pButton, pAction
   if sExtent <= the height of me then
      exit buttonAction
   end if
   
   switch pAction
      case "down"
         set the idleRate to 75
         moveOneLine pButton
         updateButtonState pButton, true, true
         break
      case "up"
         set the idleRate to 200
         updateButtonState pButton, false, true
         break
      case "release"
         set the idleRate to 200
         updateButtonState pButton, false, false
         break
      case "enter"
         updateButtonState pButton, false, true
         break
      case "leave"
         updateButtonState pButton, false, false
         break
      case "move"
         updateButtonState pButton, false, the mouseLoc is within the rect of button pButton of me
         break
      case "drag"
         updateButtonState pButton, true, the mouseLoc is within the rect of button pButton of me
         break
   end switch
end buttonAction

private command updateScrollerEnabled
   local tEnabled
   put sExtent > the height of me into tEnabled
   
   local tState
   if tEnabled then
      put "default" into tState
   else
      put "disabled" into tState
   end if
   set the icon of button "Up" of me to resolveImageId("scroll-up-" & tState)
   set the icon of button "Down" of me to resolveImageId("scroll-down-" & tState)
   
   if tEnabled then
      set the icon of button "Well" of me to 0
      set the backColor of button "Well"of me to "#1e1e1e"
      set the opaque of button "Well" of me to true
   else
      set the icon of button "Well" of me to resolveImageId("scroll-bar-disabled")
      set the opaque of button "Well" of me to false
   end if
   set the visible of image "Bar" of me to tEnabled
end updateScrollerEnabled

private command updateButtonState pButton, pPressed, pInside
   local tState
   if pPressed then
      if the mouseLoc is within the rect of button pButton of me then
         put "pressed" into tState
      else
         put "default" into tState
      end if
   else if pInside then
      put "hover" into tState
   else
      put "default" into tState
   end if
   set the icon of button pButton me to resolveImageId("scroll-" & pButton & "-" & tState)
end updateButtonState
