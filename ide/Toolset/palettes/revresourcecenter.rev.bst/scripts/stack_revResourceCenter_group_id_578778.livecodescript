Script "stack_revResourceCenter_group_id_578778"

/*
# Name: group "Example" of group id 571864 of group "mainContent" of card "Acceptingonlydigitcharactersduringdataentry" of stack "revResourceCenter"
# ID: group id 578778 of group id 571864 of group id 80390 of card id 80380 of stack "revResourceCenter"
# Hash: G58OaR8ebJ7XW/OdCTMYoQ==
*/


on preOpenBackground
  put empty into field "Digits Only"
end preOpenBackground

on openBackGround
  select text of field "Digits Only"
end openBackGround
