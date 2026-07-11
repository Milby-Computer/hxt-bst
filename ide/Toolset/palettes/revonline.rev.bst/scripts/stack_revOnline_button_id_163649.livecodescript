Script "stack_revOnline_button_id_163649"

/*
# Name: button "Set Rating" of card "templates" of stack "revOnline"
# ID: button id 163649 of card id 157677 of stack "revOnline"
# Hash: sHWHcnoZceWXXwHrCK6YjA==
*/


on mouseUp
   local tRating
   put the text of field "Rating test" of card "templates" of this stack into tRating
   send "setRating tRating" to group "Rater Template"
   
   local tTrue
   put "true" into tTrue
   send "setCanRate tTrue" to group "Rater Template"
   
   local tId
   put "1" into tId
   send "setId tId" to group "Rater Template"
   
   local tCallback, tCallbackTarget
   put "rateCallback" into tCallback
   put the long id of me into tCallbackTarget
   send "setRateCallback tCallback, tCallbackTarget" to group "Rater Template"
end mouseUp

command rateCallback pId, pRating
   put "Rated: " & pId && pRating
end rateCallback
