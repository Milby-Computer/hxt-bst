Script "stack_Message_Box_button_id_141785"

/*
# Name: button "Open Stacks" of bkgnd "Stacks" of stack "Message Box"
# ID: button id 141785 of bkgnd id 141786 of stack "Message Box"
# Hash: pQ3SdSgfl9BY1leJvjfSsw==
*/


on mouseDown
   local tLabel, tOpenStacks, tFilterStacks
   
   set the opaque of me to true
   global gREVShowStacks
   lock messages
   set the wholeMatches to true
   put the label of me into tLabel
   put the openStacks into tOpenStacks
   put revFilterStacksList(tOpenStacks) into tFilterStacks
   
   switch
      case not gREVShowStacks and tFilterStacks is not empty
         put escapeStackList(tFilterStacks) into me
         break
      case not gREVShowStacks
         put tLabel into me
         break
      case gREVShowStacks
         put escapeStackList(tOpenStacks) into me
         break
   end switch
   
   if tLabel is among the lines of the text of me then set the menuHistory of me to lineOffset(tLabel,tOpenStacks)
   unlock messages 
   pass mouseDown
end mouseDown

on menuPick pItemName
   lock screen
   if pItemName is not empty then
      revIDESetPreference "IDEActiveStack", pItemName
      if revIDEGetPreference("IDELockedToStack") is true
      then revIDESetPreference "IDELinkedToStack", empty
      set the label of me to pItemName
      positionOpenStacksButton
   end if
   unlock screen
end menuPick

on mouseUp
  set the opaque of me to false
end mouseUp

on mouseRelease 
  set the opaque of me to false
end mouseRelease

function escapeStackList pList
   replace "!" with "!!" in pList
   replace "(" with "((" in pList
   replace "&" with "&&" in pList
   return pList
end escapeStackList
