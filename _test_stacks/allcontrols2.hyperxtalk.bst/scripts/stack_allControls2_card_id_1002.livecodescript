Script "stack_allControls2_card_id_1002"

/*
# Name: card id 1002 of stack "allControls2"
# ID: card id 1002 of stack "allControls2"
# Hash: nzckLYFBKuNzCmtw5i+DaQ==
*/


on OpenCard
   set the URL of widget "browser" to "https://hyperxtalk.com"
   set the backgroundColor of this stack to (the systemWindowColor)
   set the foregroundColor of this stack to (the systemTextColor)
end OpenCard


on systemAppearanceChanged pMode, pWindowColor, pTextColor
   set the backgroundColor of this stack to pWindowColor
   set the foregroundColor of this stack to pTextColor
end systemAppearanceChanged
