Script "stack_revGettingStartedScripts_group_id_1006"

/*
# Name: group "Displaying a count down (non-blocking) Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: group id 1006 of card id 1002 of stack "revGettingStartedScripts"
# Hash: 0AVXIxRCj1Y7XIHVv98UTQ==
*/


on closeBackGround
  if "displayCurrentVerse" is in the pendingMessages then send "mouseUp" to button "Example"
end closeBackGround
