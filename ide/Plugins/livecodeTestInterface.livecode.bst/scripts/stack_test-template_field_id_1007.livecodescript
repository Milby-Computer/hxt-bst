Script "stack_test-template_field_id_1007"

/*
# Name: field "Field" of card "meta-data" of stack "test-template" of stack "livecodeTestInterface"
# ID: field id 1007 of card id 1002 of stack "test-template" of stack "livecodeTestInterface"
# Hash: Js2d7Yytv9RmHu8wQ80NZw==
*/


on linkClicked pLink
   switch pLink
      case "card script"
         edit the script of this card
         break
      case "stack script"
         edit the script of this stack
         break
   end switch
end linkClicked
