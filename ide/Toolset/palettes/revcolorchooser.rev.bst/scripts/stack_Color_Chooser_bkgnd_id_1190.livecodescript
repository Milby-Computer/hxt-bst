Script "stack_Color_Chooser_bkgnd_id_1190"

/*
# Name: bkgnd "Name" of stack "Color Chooser"
# ID: bkgnd id 1190 of stack "Color Chooser"
# Hash: hjeg5YZ0yOIck3BycBp/eA==
*/


on resetControls
  put getcolor(true) into field "Color Name"
  get the short name of button (the hilitedButton of group "Index") of group "Index"
  set the disabled of button "Clear" to it is "Pen" or it is "Brush"
end resetControls
