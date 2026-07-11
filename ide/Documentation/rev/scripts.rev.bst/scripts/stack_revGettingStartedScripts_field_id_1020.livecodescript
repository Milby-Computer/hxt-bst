Script "stack_revGettingStartedScripts_field_id_1020"

/*
# Name: field "Highlighted Text Sample" of group "Link text roll over effect Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1020 of group id 1019 of card id 1002 of stack "revGettingStartedScripts"
# Hash: a5A6g7swKGhQC+ax8N4UTg==
*/


local storedHilitedChunk

on mouseMove
  -- first unhighlight the "old" phrase if necessary:
  if storedHilitedChunk is not empty \
      and storedHilitedChunk is not the mouseChunk then
    do "set the backgroundColor of" && \
        storedHilitedChunk && "to empty"
    put empty into storedHilitedChunk
  end if
  -- highlight if the text under the mouse is linked:
  if the mouseChunk is not empty \
      and "link" is in the textStyle of the mouseChunk then
    set the backgroundColor of the mouseChunk to "yellow"
    -- saved for later unhighlighting
    put the mouseChunk into storedHilitedChunk
  end if
  pass mouseMove 
end mouseMove

on mouseLeave
  -- unhighlight any currently highlighted text:
  if storedHilitedChunk is not empty then
    do "set the backgroundColor of" && \
       storedHilitedChunk && "to empty"
    put empty into storedHilitedChunk
  end if
  pass mouseLeave
end mouseLeave
