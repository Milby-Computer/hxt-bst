Script "stack_revOnline_button_id_864946"

/*
# Name: button "down" of group "search filter" of card "main" of stack "revOnline"
# ID: button id 864946 of group id 1007 of card id 1002 of stack "revOnline"
# Hash: jeD2vmZZthhyHHsrvPj8fA==
*/


local sScroll

on mouseEnter
   put true into sScroll
   scrollDown
   --set the vscroll of field "tags" of group "search filter" of this stack to the vscroll of field "tags" of group "search filter" of this stack + 1
end mouseEnter

command scrollDown
   if sScroll is true then
      local tScrollAmount
      put round((the formattedheight of field "tags" of group "search filter" of stack "revonline") / 1000) into tScrollAmount
      set the vscroll of field "tags" of group "search filter" of stack "revonline" to the vscroll of field "tags" of group "search filter" of stack "revonline" + tScrollAmount
      --put the vscroll of field "tags" of group "search filter" of this stack & ":" && the height of field "tags" of group "search filter" of this stack
      send "scrollDown" to me in 3 milliseconds
   end if
end scrollDown

on mouseLeave
   put false into sScroll
end mouseLeave
