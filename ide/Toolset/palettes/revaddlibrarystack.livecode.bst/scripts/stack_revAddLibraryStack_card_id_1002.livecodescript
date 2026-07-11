Script "stack_revAddLibraryStack_card_id_1002"

/*
# Name: card id 1002 of stack "revAddLibraryStack"
# ID: card id 1002 of stack "revAddLibraryStack"
# Hash: JKr4fCIz+acjsxV5pzBiBw==
*/


on preOpenStack
  global gREVShowStacks
  set the cREVResult of this stack to empty
  put the short name of the topStack into tStack
  if not gREVShowStacks and \
      (char 1 to 3 of tStack is "rev" or tStack is among the items of "Message Box,Home,answer dialog,ask dialog,script debugger,file selector") then 
    set the label of btn "Stack" to space
    disable btn "OK"
  else 
    set the label of btn "Stack" to tStack
    enable btn "OK"
  end if
  pass preOpenStack
end preOpenStack
