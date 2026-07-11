Script "stack_array_benchmark_button_id_1003"

/*
# Name: button "Button" of card id 1002 of stack "array benchmark"
# ID: button id 1003 of card id 1002 of stack "array benchmark"
# Hash: ur/wUDUbWlW0qR7nroWYjg==
*/


on mouseUp
   -- warmup pass (not measured)
   local tArray, tVal
   repeat with x = 1 to 1000
      put x into tArray[x]
   end repeat
   
   -- measured: array store
   local tTimer
   put the microseconds into tTimer
   repeat with x = 1 to 100000
      put x into tArray[x]
   end repeat
   --   put "Store[]:" && (the microseconds - tTimer) && "µs"
   local tResults
   put "Store[]:" && (the microseconds - tTimer) && "µs" into tResults
   -- at the end:
   answer tResults
   
   -- measured: array fetch
   put the microseconds into tTimer
   repeat with x = 1 to 100000
      put tArray[x] into tVal
   end repeat
   --   put "Fetch[]:" && (the microseconds - tTimer) && "µs"
   
   put "Store[]:" && (the microseconds - tTimer) && "µs" into tResults
   -- at the end:
   answer tResults
end mouseUp
