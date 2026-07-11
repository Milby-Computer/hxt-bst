Script "stack_quality_button_id_1003"

/*
# Name: button "Configure Test Framework" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1003 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: rZHZGtZU0/bZfwZMkw+uNA==
*/


on mouseUp
   local tLine
   qualityInitialise
   repeat for each line tLine in field "ConfigurationData"
      qualityConfigure word 1 of tLine, word 2 to -1 of tLine 
   end repeat
end mouseUp
