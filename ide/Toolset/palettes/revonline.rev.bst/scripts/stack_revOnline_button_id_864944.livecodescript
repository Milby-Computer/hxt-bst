Script "stack_revOnline_button_id_864944"

/*
# Name: button "up" of group "search filter" of card "main" of stack "revOnline"
# ID: button id 864944 of group id 1007 of card id 1002 of stack "revOnline"
# Hash: rID+zy6O3CkjjPPPqUu2PA==
*/


local sScroll

on mouseEnter
   put true into sScroll
   scrollUp
end mouseEnter

command scrollUp
   if sScroll is true then
      local tScrollAmount
      put round(((the formattedheight of field "tags" of group "search filter" of stack "revonline") / (the height of field "tags" of group "search filter" of stack "revonline"))) into tScrollAmount
      set the vscroll of field "tags" of group "search filter" of this stack to the vscroll of field "tags" of group "search filter" of this stack - tScrollAmount
      send "scrollUp" to me in 3 milliseconds
   end if
end scrollUp

on mouseLeave
   put false into sScroll
end mouseLeave
