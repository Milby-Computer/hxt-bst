Script "stack_File_Attribs_bkgnd_id_1008"

/*
# Name: bkgnd "navControl" of stack "File Attribs"
# ID: bkgnd id 1008 of stack "File Attribs"
# Hash: apQd+xpjENqZeAyUUn+wVw==
*/


on mouseUp
   local tTarget
   put the long id of the target into tTarget
   
   if the long id of button "<" of me is tTarget then
      visual effect push right
      go card (the number of the current card - 1)
   else if the long id of button ">" of me is tTarget then
      visual effect push left
      go card (the number of the current card + 1)
   else
      pass mouseUp
   end if
end mouseUp

on menuPick pItem
   if the long id of the target is the long id of button "CardList" of me then
      go card pItem
      updateNav
   else
      pass menuPick
   end if
end menuPick

local sCardList
local sCardCount

on updateNav
   local tCardNumber
   getCardList
   put sCardList into button "CardList" of me
   set the label of button "CardList" of me to the short name of the current card
   set the label of this stack to the short name of the current card
   put the number of the current card into tCardNumber
   
   set the enabled of button "<" of me to (tCardnumber > 1)
   set the enabled of button ">" of me to (tCardNumber < sCardCount)
end updateNav

on getCardList
   put the number of cards into sCardCount
   
   put empty into sCardList
   repeat with i = 1 to sCardCount
      put the short name of card i & return after sCardList
   end repeat
end getCardList
