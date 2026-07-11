Script "stack_revApplicationOverview_card_id_1582"

/*
# Name: card "Blank" of stack "revApplicationOverview"
# ID: card id 1582 of stack "revApplicationOverview"
# Hash: QWoOxecaDmTxceYldDNztQ==
*/


on preOpenCard
  if not (there is a field "select a card") then 
    exit preOpencard
  end if
  if the platform is "MacOS" then 
    set the textFont of field "select a card" to empty
  else 
    set the textFont of field "select a card" to "Helvetica"
  end if
  set the textSize of field "select a card" to 18
end preOpenCard
