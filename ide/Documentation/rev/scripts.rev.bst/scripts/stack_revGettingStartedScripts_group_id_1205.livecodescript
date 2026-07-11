Script "stack_revGettingStartedScripts_group_id_1205"

/*
# Name: group "Accepting only digit characters during data entry Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: group id 1205 of card id 1002 of stack "revGettingStartedScripts"
# Hash: G58OaR8ebJ7XW/OdCTMYoQ==
*/


on preOpenBackground
  put empty into field "Digits Only"
end preOpenBackground

on openBackGround
  select text of field "Digits Only"
end openBackGround
