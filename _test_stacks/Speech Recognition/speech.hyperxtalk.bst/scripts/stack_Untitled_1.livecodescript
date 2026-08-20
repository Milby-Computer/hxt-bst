Script "stack_Untitled_1"

/*
# Name: stack "Untitled 1"
# ID: stack "Untitled 1"
# Hash: XweWu/C9FOzRr/yFvkENhw==
*/


on voiceCommand pPhrase
   switch pPhrase
      case "next slide"
         go next card
         break
      case "previous slide"
         go prev card
         break
      case "save stack"
         save this stack
         break
   end switch
end voiceCommand

