Script "stack_ScrollingGroups_group_id_1005"

/*
# Name: group id 1005 of card id 1002 of stack "ScrollingGroups"
# ID: group id 1005 of card id 1002 of stack "ScrollingGroups"
# Hash: pkysV7ZzlviNDUR9hD+WgA==
*/


on scrollWheel pDeltaX, pDeltaY
   -- If a field is under the pointer, let it scroll itself normally
   local tControl
   put the mouseControl into tControl
   if tControl is not empty and word 1 of the name of tControl is "field" AND (the formattedHeight of tControl > the height of tControl) then
      pass scrollWheel
   end if
   
   if pDeltaY <> 0 then
      local tVMax
      put the formattedHeight of me - the height of me into tVMax
      --      if (the naturalScrolling) then
      set the vScroll of me to max(0, min(the vScroll of me - pDeltaY * 10, tVMax))
      --   else
      --      set the vScroll of me to max(0, min(the vScroll of me - pDeltaY * 10, tVMax))
      --   end if
   end if
   --   if pDeltaX <> 0 then
   --      local tHMax
   --      put the formattedWidth of me - the width of me into tHMax
   --      set the hScroll of me to max(0, min(the hScroll of me + pDeltaX * 10, tHMax))
   --    set the hScroll of me to max(0, min(the hScroll of me - pDeltaX * 10, tHMax))
   --   end if
end scrollWheel
