Script "stack_revGettingStartedScripts_group_id_1040"

/*
# Name: group "Combine random text strings Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: group id 1040 of card id 1002 of stack "revGettingStartedScripts"
# Hash: oQWuwkp2pX8oqxndA3RwLw==
*/


--on closeField
  do "set the" && the short name of the target \
      && "of button" && quote & "Generate Insult" & quote \
      && "to" && quote & replaceText(target,return,space) & quote
end closeField
