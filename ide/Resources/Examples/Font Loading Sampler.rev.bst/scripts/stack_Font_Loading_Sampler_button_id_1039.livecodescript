Script "stack_Font_Loading_Sampler_button_id_1039"

/*
# Name: button "18" of group "gFontSize" of card "card id 1002" of stack "Font Loading Sampler"
# ID: button id 1039 of group id 1033 of card id 1002 of stack "Font Loading Sampler"
# Hash: pF+ndEaMd/NTXAaaz1BBIA==
*/


on mouseEnter
  set the foreColor of me to 249,156,27
end mouseEnter

on mouseLeave
    set the foreColor of me to 145,152,160
end mouseLeave

on mouseDown
  if the icon of me is not the id of image "icon RadioON" then
    set the icon of me to the id of image "icon RadioOFF" 
    set the hiliteIcon of me to the id of image "icon RadioON"
  end if
end mouseDown

