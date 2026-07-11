Script "stack_File_Attribs_card_id_1064"

/*
# Name: card "Visual Effects" of stack "File Attribs"
# ID: card id 1064 of stack "File Attribs"
# Hash: Gjc7s0l50KOR7BCd3CHGCg==
*/


local sEffect="dissolve"
local sDirection="left"

on preOpenCard
   set the backgroundColor of this card to the effective backgroundColor of this card
   pass preOpenCard
end preOpenCard

on applyEffect
   local tEffect
   if sEffect is among the items of "scroll,push,reveal,curl,flip" then
      put (sEffect && sDirection) into tEffect
   else
      put sEffect into tEffect
   end if
   
   lock screen
   if the hilite of button "Change BG" then
      set the backgroundColor of this stack to 0, 0, 255
   end if
   if the visible of graphic "Test Rectangle" of me is true then
      show graphic "Test Oval" of me
      do ("hide graphic" && q("Test Rectangle") && "of me with visual effect tEffect")
   else
      hide graphic "Test Oval" of me
      do ("show graphic" && q("Test Rectangle") && "of me with visual effect tEffect")
   end if
   if the hilite of button "Change BG" then
      set the backgroundColor of this stack to empty
   end if
   unlock screen
end applyEffect

on setEffect pEffect
   put toLower(pEffect) into sEffect
   set the label of button "Effect" of me to sEffect
end setEffect

on setDirection pDirection
   put toLower(pDirection) into sDirection
   set the label of button "Direction" of me to sDirection
end setDirection

function q pStr
   return quote & pStr & quote
end q
