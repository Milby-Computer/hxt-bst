Script "stack_Print_Dialog_scrollbar_id_5738"

/*
# Name: scrollbar "Copy scroll" of group id 5712 of group "Copies" of card id 1002 of stack "Print Dialog"
# ID: scrollbar id 5738 of group id 5712 of group id 1417 of card id 1002 of stack "Print Dialog"
# Hash: caAr4D0ugc2jYiqU3BsOCQ==
*/


# Code for the inc/decrement arrows in the number of print copies field
on scrollbarLineDec
  lock screen
  subtract 1 from field "No of copies"
  if field "No of copies" < 1 then
    put 1 into field "No of copies"
  end if
  unlock screen
end scrollbarLineDec

on scrollbarLineInc
  add 1 to field "No of copies"
end scrollbarLineInc
