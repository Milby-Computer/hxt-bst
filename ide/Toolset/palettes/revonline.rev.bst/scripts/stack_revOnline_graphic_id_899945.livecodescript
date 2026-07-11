Script "stack_revOnline_graphic_id_899945"

/*
# Name: graphic "message catcher" of group "search list" of card "main" of stack "revOnline"
# ID: graphic id 899945 of group id 1691 of card id 1002 of stack "revOnline"
# Hash: oJY96IE/LH5lcTBI3CtJnw==
*/


--on rawkeydown pKey
--   if pKey is 65308 then
--      scrollUp
--   else if pKey is 65309 then
--      scrollDown
--   end if
--   --put pKey && ":" && tScrollValue
--end rawkeydown

--command scrollUp
--   local tScrollValue
--   put round(the formattedheight of the owner of me / 20) into tScrollValue
--   --lock messages
--   set the vScroll of the owner of me to (the vScroll of the owner of me + tScrollValue)
--   --updateScrollbar      
--   --unlock messages
--end scrollUp

--command scrollDown
--   local tScrollValue
--   put round(the formattedheight of the owner of me / 20) into tScrollValue
--   set the vScroll of the owner of me to (the vScroll of the owner of me - tScrollValue)
--   --updateScrollbar
--end scrollDown
