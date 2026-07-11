Script "stack_IconDataFor_button_id_1007"

/*
# Name: button "Button" of card id 1002 of stack "IconDataFor"
# ID: button id 1007 of card id 1002 of stack "IconDataFor"
# Hash: KdPzkV6UtCSoQzKPOuO6Mw==
*/


on MouseUp
   answer file "Moo"
   
   local tPNGData
   put iconDataForFile(it, 256) into tPNGData
   set the text of image "Image" to tPNGData
end MouseUp
