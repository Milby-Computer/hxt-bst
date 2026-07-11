Script "stack_revResourceCenter_group_id_578821"

/*
# Name: group "Example" of group id 109220 of group "mainContent" of card "Combinerandomtextstrings" of stack "revResourceCenter"
# ID: group id 578821 of group id 109220 of group id 109225 of card id 109204 of stack "revResourceCenter"
# Hash: oQWuwkp2pX8oqxndA3RwLw==
*/


--on closeField
  do "set the" && the short name of the target \
      && "of button" && quote & "Generate Insult" & quote \
      && "to" && quote & replaceText(target,return,space) & quote
end closeField
