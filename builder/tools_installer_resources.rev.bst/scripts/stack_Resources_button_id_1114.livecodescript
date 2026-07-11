Script "stack_Resources_button_id_1114"

/*
# Name: button "Update Nav Behavior" of card "Resources" of stack "Resources"
# ID: button id 1114 of card id 1023 of stack "Resources"
# Hash: cMyL2m5POmPJtnin5itPfg==
*/


local sEnabled
local sDefault
local sInside
local sPressed

on preOpenControl
   set the style of button 1 of me to "transparent"
   set the textColor of field 1 of me to "white"
   set the textAlign of field 1 of me to "left"
   set the textSize of field 1 of me to 16
   set the textStyle of field 1 of me to "bold"
   put true into sEnabled
   put false into sDefault
   put false into sInside
   put false into sPressed
   updateChild
end preOpenControl

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

private command updateChild
   if not sEnabled then
      get "nav-disabled"
   else if sPressed then
      if sInside then
         get "nav-pressed"
      else
         get "nav-standard"
      end if
   else if sDefault then
      get "nav-default"
   else if sInside then
      get "nav-hover"
   else
      get "nav-standard"
   end if
   set the icon of button 1 of me to resolveImageId(it)
   if sEnabled then
      set the textColor of field 1 of me to "#ffffff"
   else
      set the textColor of field 1 of me to "#474747"
   end if
end updateChild

setProp uEnabled pValue
   put pValue into sEnabled
   updateChild
end uEnabled

setProp uDefault pValue
   put pValue into sDefault
   updateChild
end uDefault

local sType

setProp uType pType
   put pType into sType
   switch sType
      case "free"
         get "badge-free"
         break
      case "test"
         get "badge-test"
         break
      case "paid"
         get "badge-paid"
         break
      default
         get empty
         break
   end switch
   if it is not empty then
      set the icon of button "option" of me to resolveImageId(it)
   end if
end uType

getProp uType
   return sType
end uType

setProp uLabel pNewLabel
   set the text of field "label" of me to pNewLabel
end uLabel

setProp uVisible pVisible
   set the visible of me to pVisible
end uVisible
