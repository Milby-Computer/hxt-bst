Script "stack_Browser_Sampler_button_id_1012"

/*
# Name: button "LeftBtn" of bkgnd "bgGrp" of stack "Browser Sampler"
# ID: button id 1012 of bkgnd id 1031 of stack "Browser Sampler"
# Hash: ZshDDgXzp0wS45m4FN3Fgw==
*/


--on mouseEnter
--  set the showBorder of me to true
--end mouseEnter
--
--on mouseLeave
--  set the showBorder of me to false
--end mouseLeave
--
on mouseDown
  --  if the icon of me is not the id of img "icon LeftArrow2" of cd 1
  --  then set the icon of me to the id of img "icon LeftArrow2" of cd 1
end mouseDown

on mouseUp
  local tVal
  put the number of this cd into tVal
  if tVal > 1
  then set the altValue of fld "sliderValue" of grp "ChapterSlider" to tVal-1
  else beep
end mouseUp
