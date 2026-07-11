Script "stack_quality_button_id_1025"

/*
# Name: button "List Supported Platforms" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1025 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: ID3lvcuiQx37TONsFZVl9g==
*/


on mouseUp
   local tPlatforms, tKey, tLine
   put empty into field "TargetPlatforms"
   qualityListPlatforms
   put the result into tPlatforms
   if tPlatforms is an array then
      repeat for each line tKey in the keys of tPlatforms
         put tKey & return after field "TargetPlatforms"
         repeat for each line tLine in tPlatforms [tKey]
            qualityGetPlatformLabel tLine
            put tab & the result & tab & tab after field "TargetPlatforms"
            put tLine & return after field "TargetPlatforms"
         end repeat
      end repeat
   end if
end mouseUp
