Script "stack_revImageLibrary_scrollbar_id_1066"

/*
# Name: scrollbar id 1066 of bkgnd "Images In Library" of stack "revImageLibrary"
# ID: scrollbar id 1066 of bkgnd id 1063 of stack "revImageLibrary"
# Hash: XoPa2SXkXVFLva1Eh5zmSg==
*/


local lTimerID, lRestore

on scrollbarDrag x
  if lRestore is empty then put the repeatRate into lRestore
  set the repeatRate to 500
  put the milliseconds into lWait
  put ((trunc(x / 10))*10) into x
  add 1 to x
  if x is 0 then put 1 into x
  lock screen
  put lineOffset(the icon of btn 1 of group "images in library",the cIconsList of this cd) into tCurrent
  if tCurrent is not x then
    put 0 into tButtonNumber
    put the cIconsList of this cd into tList
    repeat with i = x to (x + 29)
      add 1 to tButtonNumber
      set the icon of btn tButtonNumber of group "images in library" to line i of tList
      if the line i of tList is word -1 of fld "image id" then
        put true into tMatch 
        set the rect of grc "marquee" to the rect of btn tButtonNumber
      end if
    end repeat
    if not tMatch then
      set the loc of grc "marquee" to -100,-100
    end if
  end if
  unlock screen
  if lTimerID is not empty then cancel lTimerID
  send "revRestoreRate" to me in 500 milliseconds
  put the result into lTimerID
end scrollbarDrag

on revRestoreRate
  set the repeatRate to lRestore
end revRestoreRate
