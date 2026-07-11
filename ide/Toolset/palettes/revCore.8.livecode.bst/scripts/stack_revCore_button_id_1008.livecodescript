Script "stack_revCore_button_id_1008"

/*
# Name: button "tip_display_behavior" of card id 1002 of stack "revCore"
# ID: button id 1008 of card id 1002 of stack "revCore"
# Hash: wuRkHvMceSIxFvJNVCcyAw==
*/


on layoutTip
   local tMessageWidth,tMessageHeight
   
   set the rect of graphic "tip_background" of me to the rect of me
   
   set the height of field "tip_close" of me to the formattedHeight of field "tip_close" of me
   set the width of field "tip_close" of me to the formattedWidth of field "tip_close" of me
   
   put the width of me - the width of image "tip_icon" of me - the width of field "tip_close" - 20 into tMessageWidth
   put the height of me into tMessageHeight
   
   set the width of field "tip_message" of me to tMessageWidth
   set the height of field "tip_message" of me to the formattedHeight of field "tip_message" of me
   set the loc of field "tip_message" of me to the loc of me
   set the left of field "tip_message" of me to the right of image "tip_icon" of me
   
   set the loc of image "tip_icon" of me to (the left of me + 10 + round(the width of image "tip_icon" of me / 2)-1),the top of me + round(the height of me / 2)-1
   set the loc of field "tip_close" of me to (the right of me - 10 - round(the width of field "tip_close" of me / 2)-1),the top of me + round(the height of me / 2)
end layoutTip

on hideTip
   hide me
   dispatch "tipPreferenceSet" with "false"
   dispatch "tipDisplayUpdate"
end hideTip

on mouseUp
   launch url the cLink of me
end mouseUp

on mouseEnter
   lock cursor
   set the cursor to hand
   set the backgroundColor of graphic "tip_background" of me to ideCoreEditionHoverColour()
end mouseEnter

on mouseLeave
   if the mouseloc is not within the rect of me then
      unlock cursor
      set the backgroundColor of graphic "tip_background" of me to ideCoreEditionColour()
   end if
end mouseLeave
