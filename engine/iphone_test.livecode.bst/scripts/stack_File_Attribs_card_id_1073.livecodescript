Script "stack_File_Attribs_card_id_1073"

/*
# Name: card "Status Bar Configuration" of stack "File Attribs"
# ID: card id 1073 of stack "File Attribs"
# Hash: Bv529O7oRIQSNH8mLR3FGg==
*/


on openCard
   iphoneShowStatusBar
   iphoneSetStatusBarStyle ("default")
   set the hilite of button "Radio1" to true 
   set the hilite of button "StatusBarDisplayed" to true 
   set the text of field "nowTime" to the date && the long time
   set the text of field "cardSize" to "Card Size:" & the width of card "Status Bar Configuration" & "X" & the height of card "Status Bar Configuration"
end openCard

on resizeStack tNewWidth, tNewHeight
   set the text of field "nowTime" to the date && the long time
   set the text of field "cardSize" to "Card Size:" & the width of card "Status Bar Configuration" & "X" & the height of card "Status Bar Configuration" 
end resizeStack
