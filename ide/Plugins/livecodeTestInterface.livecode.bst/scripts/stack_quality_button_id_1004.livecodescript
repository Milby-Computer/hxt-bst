Script "stack_quality_button_id_1004"

/*
# Name: button "List Tests" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1004 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: KZYgtzKc1hI06tiSPs61EQ==
*/


on mouseUp
   local tTests, tKey, tLine
   put empty into field "Tests"
   qualityListTests
   put the result into tTests
   if tTests is an array then
      repeat for each line tKey in the keys of tTests
         put tKey & return after field "Tests"
         repeat for each line tLine in tTests [tKey]
            qualityGetTestLabel tLine
            put tab & the result & tab & tab after field "Tests"
            put tLine & return after field "Tests"
         end repeat
      end repeat
   end if
end mouseUp
