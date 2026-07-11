Script "stack_revResourceCenter_button_id_578828"

/*
# Name: button "Generate Insult" of group "Example" of group id 109220 of group "mainContent" of card "Combinerandomtextstrings" of stack "revResourceCenter"
# ID: button id 578828 of group id 578821 of group id 109220 of group id 109225 of card id 109204 of stack "revResourceCenter"
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
