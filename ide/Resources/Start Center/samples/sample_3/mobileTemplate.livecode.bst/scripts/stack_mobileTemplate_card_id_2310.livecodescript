Script "stack_mobileTemplate_card_id_2310"

/*
# Name: card "asdfasdf" of stack "mobileTemplate"
# ID: card id 2310 of stack "mobileTemplate"
# Hash: +3GpRfj6rzFO4TzQbZINog==
*/


on preOpenCard
   set the theme of this stack to "green"
   set the headerTitle of this stack to "New Card"
   set the headerButtonBackVisible of this stack to false
   set the headerButtonAddVisible of this stack to false
   set the headerButtonUploadVisible of this stack to false
   set the headerButtonDeleteVisible of this stack to false
  set the navigationSelectedItem of this stack to the cNavID of me
end preOpenCard
