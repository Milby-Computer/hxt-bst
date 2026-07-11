Script "stack_revObjectLibrary_field_id_1058"

/*
# Name: field "Auto Scrolling Field" of card "Auto Scrolling Field" of stack "revObjectLibrary"
# ID: field id 1058 of card id 1057 of stack "revObjectLibrary"
# Hash: qo10g8mXgRK4WgPoVsaOYg==
*/


local lScroll, lCount

on mouseUp
  put empty into lCount
  put the formattedHeight of me - the height of me into lScroll
  hScrollDown
end mouseUp

on hScrollDown
  if lCount < lScroll then
    add 1 to lCount
    set the scroll of me to lCount
    send "hScrollDown" to me in (the cScrollInterval of me) millisecs
  else
    hScrollBack
  end if
end hScrollDown

on hScrollBack
  set the scroll of me to 0
end hScrollBack
