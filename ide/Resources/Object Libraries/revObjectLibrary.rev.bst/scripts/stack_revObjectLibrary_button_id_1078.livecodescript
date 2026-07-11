Script "stack_revObjectLibrary_button_id_1078"

/*
# Name: button "Grey Disclosure Triangle with Label" of card "Grey Disclosure Triangle with Label" of stack "revObjectLibrary"
# ID: button id 1078 of card id 1077 of stack "revObjectLibrary"
# Hash: rpSA+7AIaiOOjIZ+Up8Hwg==
*/


local lIcon, lHiliteIcon, lResult

on mouseDown
  put the icon of me into lIcon
  if the cDisclosed of me is false then
    set the icon of me to the cHilitedIcon of me
    put the icon of me into lHiliteIcon
    withinCheck
  else
    set the icon of me to the cDisclosedHilitedIcon of me
    put the icon of me into lHiliteIcon
    withinCheck
  end if
end mouseDown

on mouseUp
  cancel lResult
  if the cDisclosed of me is false then
    set the icon of me to the cIntermediateIcon of me
    wait 10 milliseconds
    set the icon of me to the cDisclosedIcon of me
    set the cDisclosed of me to true
    set the rect of this stack to item 1 to 3 of the rect of this stack, item 2 of the rect of this stack + the cDisclosedStackHeight of me
  else
    set the icon of me to the cIntermediateIcon of me
    wait 10 milliseconds
    set the icon of me to the cIcon of me
    set the cDisclosed of me to false
    set the rect of this stack to item 1 to 3 of the rect of this stack, item 2 of the rect of this stack + the cUndisclosedStackHeight of me
  end if
end mouseUp

on mouseDoubleUp
  mouseUp
end mouseDoubleUp

on mouseRelease
  cancel lResult
  if the cDisclosed of me is false then set the icon of me to the cIcon of me
  else set the icon of me to the cDisclosedIcon of me
end mouseRelease

on withinCheck
  if within(me,the mouseLoc) then
    set the icon of me to lHiliteIcon
    send "withinCheck" to me in 20 milliseconds
    put the result into lResult
  else
    set the icon of me to lIcon
    send "withinCheck" to me in 20 milliseconds
    put the result into lResult
  end if
end withinCheck
