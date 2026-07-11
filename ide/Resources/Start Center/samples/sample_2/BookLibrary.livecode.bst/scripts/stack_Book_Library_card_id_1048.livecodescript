Script "stack_Book_Library_card_id_1048"

/*
# Name: card "intro" of stack "Book Library"
# ID: card id 1048 of stack "Book Library"
# Hash: gDJckA9bfDw5kexyryNkfQ==
*/


on layoutCard
   set the width of field "intro" of me to the width of this stack - 20
   set the height of field "intro" of me to the height of this stack  - 80
   set the topLeft of field "intro" of me to 10,10
   set the bottomRight of button "Go" of me to the width of this stack - 10, the height of this stack - 10
end layoutCard
