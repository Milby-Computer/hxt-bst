Script "stack_quality_button_id_1024"

/*
# Name: button "List LiveCode Versions" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1024 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: eWM/MoZ4LwuZE0nVE9Ebsw==
*/


on mouseUp
   local tVersions, tLine
   put empty into field "LiveCodeVersions"
   qualityListVersions
   put the result into tVersions
   repeat for each line tLine in tVersions
      qualityGetVersionLabel tLine
      put the result & tab & tab after field "LiveCodeVersions"
      put tLine & return after field "LiveCodeVersions"
   end repeat
end mouseUp
