Script "stack_Resources_button_id_1049"

/*
# Name: button "Push Button Behavior" of card "Resources" of stack "Resources"
# ID: button id 1049 of card id 1023 of stack "Resources"
# Hash: SfjgTyBziEAfE2XRw8hOhw==
*/


local sEnabled
local sDefault
local sInside
local sPressed
local sWide

on mouseDown
   put true into sPressed
   updateChild
end mouseDown

on mouseUp
   put false into sPressed
   updateChild
   
   if sEnabled then
      dispatch "onClick" to me
   end if
end mouseUp

on mouseRelease
   put false into sPressed
   updateChild
end mouseRelease

on mouseEnter
   if sEnabled then
      put true into sInside
      updateChild
   end if
end mouseEnter

on mouseMove
   if sPressed then
      put the mouseLoc is within the rect of me into sInside
      updateChild
   end if
end mouseMove

on mouseLeave
   put false into sInside
   updateChild
end mouseLeave

on preOpenControl
   set the width of button 1 of me to 84
   set the height of button 1 of me to 24
   set the width of field 1 of me to 84
   set the height of field 1 of me to 24
   set the style of button 1 of me to "transparent"
   set the textColor of field 1 of me to "white"
   set the textAlign of field 1 of me to "center"
   put true into sEnabled
   put false into sDefault
   put false into sInside
   put false into sPressed
   put false into sWide
   updateChild
end preOpenControl

setProp uWide pWide
   put pWide into sWide
   if sWide then
      set the width of button 1 of me to 110
      set the width of field 1 of me to 110
   else
      set the width of button 1 of me to 84
      set the width of field 1 of me to 84
   end if
   updateChild
end uWide

setProp uEnabled pValue
   put pValue into sEnabled
   updateChild
end uEnabled

setProp uDefault pValue
   put pValue into sDefault
   updateChild
end uDefault

setProp uLabel pValue
   set the text of field 1 of me to pValue
end uLabel

private command updateChild
   if not sEnabled then
      get "button-disabled"
   else if sPressed then
      if sInside then
         get "button-pressed"
      else
         get "button-standard"
      end if
   else if sInside then
      get "button-hover"
   else if sDefault then
      get "button-default"
   else
      get "button-standard"
   end if
   if sWide then
      put "-wide" after it
   end if
   set the icon of button 1 of me to resolveImageId(it)
   if sEnabled then
      set the textColor of field 1 of me to "#ffffff"
   else
      set the textColor of field 1 of me to "#474747"
   end if
end updateChild
