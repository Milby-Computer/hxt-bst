Script "stack_revGettingStartedScripts_button_id_1047"

/*
# Name: button "Generate Insult" of group "Combine random text strings Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1047 of group id 1040 of card id 1002 of stack "revGettingStartedScripts"
# Hash: 9LeJ47R4ZmFDqhK8iPvdaQ==
*/


on mouseUp
  answer shakespeareanInsult() with "Gahk!"
end mouseUp

function shakespeareanInsult
  return "Begone, thou" \
      && any word of the firstAdjectiveList of me \
      && any word of the secondAdjectiveList of me \
      && any word of the nounsList of me & "!"
end shakespeareanInsult
