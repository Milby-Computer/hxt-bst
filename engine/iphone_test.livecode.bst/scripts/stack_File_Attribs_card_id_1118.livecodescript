Script "stack_File_Attribs_card_id_1118"

/*
# Name: card "Scroller Control" of stack "File Attribs"
# ID: card id 1118 of stack "File Attribs"
# Hash: 9+RnFqKyMj08rRqYVgtd+A==
*/


on preOpenCard
   setupScroller
   pass preOpenCard
end preOpenCard

local s_scroller_props="contentrectangle,canbounce,vscroll,hscroll,canscrolltotop,cancanceltouches,delaytouches,decelerationrate,indicatorstyle,indicatorinsets,pagingenabled"
local s_scroller_id

on setupScroller
   local tContentRect
   put 0,0,(the formattedWidth of group "scrollgroup"),(the formattedHeight of group "scrollgroup") into tContentRect
   iphoneControlCreate "scroller"
   put the result into s_scroller_id
   iphoneControlSet s_scroller_id, "rectangle", the rect of group "scrollgroup"
   iphoneControlSet s_scroller_id, "contentRectangle", tContentRect
   iphoneControlSet s_scroller_id, "hscroll", the hscroll of group "scrollgroup"
   iphoneControlSet s_scroller_id, "vscroll", the vscroll of group "scrollgroup"
   iphoneControlSet s_scroller_id, "canbounce", true
   iphoneControlSet s_scroller_id, "canscrolltotop", true
   iphoneControlSet s_scroller_id, "decelerationrate", "fast"
   iphoneControlSet s_scroller_id, "indicatorstyle", "white"
   iphoneControlSet s_scroller_id, "cancanceltouches", false
   iphoneControlSet s_scroller_id, "visible", true
end setupScroller

on openCard
   if the environment is "mobile" then
      iphoneControlDo s_scroller_id, "flashscrollindicators"
   end if
end openCard

on closeCard
   if the environment is "mobile" then
      iphoneControlDelete s_scroller_id
   end if
end closeCard

on updatePropertyList
   lock screen
   put empty into field "scrollerprops"
   repeat for each item tProp in s_scroller_props
      iphoneControlGet s_scroller_id, tProp
      put tProp && the result & return after field "scrollerprops"
   end repeat
   unlock screen
end updatePropertyList

on scrollerBeginDrag
   put "scrollerBeginDrag" & return into field "msg"
end scrollerBeginDrag

on scrollerDidScroll pHScroll, pVScroll
   lock screen
   set the hscroll of group "scrollgroup" to pHScroll
   set the vscroll of group "scrollgroup" to pVScroll
   unlock screen
   --put "scrollerDidScroll" & return into field "msg"
   put phscroll,pvscroll into field "offset"
end scrollerDidScroll

on scrollerEndDrag pDecelerate
   if not pDecelerate then updatePropertyList
   put "scrollerEndDrag" & pDecelerate & return before field "msg"
end scrollerEndDrag

on scrollerBeginDecelerate
   put "scrollerBeginDecelerate" & return before field "msg"
end scrollerBeginDecelerate

on scrollerEndDecelerate
   updatePropertyList
   put "scrollerEndDecelerate" & return before field "msg"
end scrollerEndDecelerate

on scrollerScrollToTop
   put "scrollerScrollToTop" & return into field "msg"
end scrollerScrollToTop

on touchStart pId
   put "started" into field "msg"
end touchStart

on touchMove pId, pX, pY
   put "moved to" && pX, pY into field "msg"
end touchMove

on touchEnd pId
   put "ended" & return before field "msg"
end touchEnd

on touchRelease pId
   put "released" & return before field "msg"
end touchRelease
