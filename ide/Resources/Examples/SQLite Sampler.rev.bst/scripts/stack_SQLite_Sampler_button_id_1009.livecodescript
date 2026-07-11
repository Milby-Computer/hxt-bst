Script "stack_SQLite_Sampler_button_id_1009"

/*
# Name: button "RightBtn" of bkgnd "altFldHeader" of stack "SQLite Sampler"
# ID: button id 1009 of bkgnd id 1031 of stack "SQLite Sampler"
# Hash: 6H2Hr9GCIRT46o3XCZmatQ==
*/


--on mouseEnter
--  set the showBorder of me to true
--end mouseEnter
--
--on mouseLeave
--  set the showBorder of me to false
--end mouseLeave
--
--on mouseDown
--  if the icon of me is not the id of img "icon RightArrow2" of cd 1
--  then set the icon of me to the id of img "icon RightArrow2" of cd 1
--end mouseDown


on mouseUp
  put the number of this cd into tVal
  if tVal < the number of cds of this stack
  then set the altValue of fld "sliderValue" of grp "ChapterSlider" to tVal+1
  else beep
end mouseUp
