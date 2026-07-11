Script "stack_DataGridsTour_group_id_1323"

/*
# Name: group "Scroller" of bkgnd "Chrome" of stack "DataGridsTour"
# ID: group id 1323 of bkgnd id 1321 of stack "DataGridsTour"
# Hash: yp6I2+7DtOGLrqi8YhjJrg==
*/


local maydrag, maxleft, maxright, w

on mouseleave
   unlock cursor
end mouseleave

on mouseenter
   set cursor to hand
   set the lockcursor to true
   put trunc(the width of me / 2) into w
   put the left of grc "Scroll Well" + w into maxleft
   put the right of grc "Scroll Well" - w into maxright
end mouseenter

on mousedown
   put true into maydrag
end mousedown

on mouseup
   put false into maydrag
   go to cd fld "Scroll Page"
   adjustSlider
end mouseup

on mouserelease
   mouseup
end mouserelease

on mousemove x,y
   if not maydrag then exit mousemove
   put max(maxleft, min(maxright, x)) into x
   set the loc of me to x, item 2 of the loc of me
   
   -- find which segment i'm within
   repeat with i = 1 to the numSegs of group "Scroll Well" 
      if the loc of me is within the rect of grc ("s" && i) then exit repeat
   end repeat
   
   -- update thumb display
   if the left of me <= left of grc "Scroll Well" then put 1 into i
   if the right of me >= right of grc "Scroll Well" then put the number of cards into i
   put i into fld "Scroll Page"
   put the short name of cd i into fld "Page Title"
   
   unlock screen

end mousemove
