Script "stack_revStandaloneSettings_bkgnd_id_1010"

/*
# Name: bkgnd "cards" of stack "revStandaloneSettings"
# ID: bkgnd id 1010 of stack "revStandaloneSettings"
# Hash: faZl6eDvcMQ5mgBZHQfhlg==
*/


on mouseEnter
  if the owner of the target is me and word 1 of the target is "button" then
      set the showBorder of the target to true
  end if
end mouseEnter

on mouseLeave 
  if the owner of the target is me and word 1 of the target is "button" then
    set the showBorder of the target to false
  end if
end mouseLeave

on mouseUp
   if the owner of the target is me and word 1 of the target is "button" then
      navigateToCard the short name of the target
   end if
end mouseUp
