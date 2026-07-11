Script "stack_Message_Box_group_id_2535"

/*
# Name: group "controls" of card "Global Properties" of stack "Message Box"
# ID: group id 2535 of card id 2525 of stack "Message Box"
# Hash: faWuxvUblQcsaGyNqBmu4A==
*/


on resizeControl
   local tLeft, tTop, tRight, tBottom
   
   lock messages
   lock screen
   
   put the left of me into tLeft
   put the top of me into tTop
   put the right of me into tRight
   put the bottom of me into tBottom
   
   set the rect of field "type" to tLeft,(tTop + 30),(tLeft +200),tBottom
   set the rect of field "contents" to (tLeft + 200), (tTop + 30), tRight,tBottom
   set the rect of field "filter label" to tLeft,(tTop + 5),(tLeft + 50),(tTop + 25)
   set the rect of field "filter" to (tLeft + 45),(tTop + 5),(tLeft + 165),(tTop + 25)
   set the rect of field "values range" to (tRight - 200),tTop+5,(tRight - 5),(tTop + 25)
   
   unlock screen
   unlock messages
end resizeControl
