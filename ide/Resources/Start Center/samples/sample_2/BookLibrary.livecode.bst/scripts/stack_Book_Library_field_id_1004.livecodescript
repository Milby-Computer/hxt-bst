Script "stack_Book_Library_field_id_1004"

/*
# Name: field "Search Term" of card "book data" of stack "Book Library"
# ID: field id 1004 of card id 1002 of stack "Book Library"
# Hash: X0I/AndjcIl5nRNYOeLyOg==
*/


on returnInField
   ## This message is sent when the retun key is pressed
   ## By handling it here we "trap" it meaning there cannot be multiple lines in the field
   ## Call searchBooks so the list is filtered when return is pressed
   searchBooks
end returnInField

on enterInField
   ## As with return but for enter
   searchBooks
end enterInField
