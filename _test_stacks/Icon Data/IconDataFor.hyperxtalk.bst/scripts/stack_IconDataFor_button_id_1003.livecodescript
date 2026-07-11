Script "stack_IconDataFor_button_id_1003"

/*
# Name: button "Button" of card id 1002 of stack "IconDataFor"
# ID: button id 1003 of card id 1002 of stack "IconDataFor"
# Hash: 9aoyLop5Ic6/cbtP7N3M+g==
*/


on MouseUp
   local tPNGData
   put iconDataForExtension("doc", 256) into tPNGData
   set the text of image "Image" to tPNGData
end MouseUp
