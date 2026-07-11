Script "stack_LCBenchMarks_field_id_1011"

/*
# Name: field "Field" of card id 1002 of stack "LCBenchMarks"
# ID: field id 1011 of card id 1002 of stack "LCBenchMarks"
# Hash: wknyH9zlfsJcLp65xTEJ8Q==
*/


--on mouseMove pX, pY
--   if the mouseText is not empty then
--      lock cursor
--      if the textStyle of the mouseText is "link" then
--         beep
--         set the cursor to hand
--      else
--         --set the cursor to none
--         reset cursors
--      end if
--   end if
--end mouseMove

on mouseUp
   if the textStyle of the mouseText is "link" then put the mouseText into tLink
   launch url tLink
end mouseUp

--on mouseEnter
--   set the cursor to hand
--end mouseEnter

--on mouseLeave
--   reset cursors
--end mouseLeave
