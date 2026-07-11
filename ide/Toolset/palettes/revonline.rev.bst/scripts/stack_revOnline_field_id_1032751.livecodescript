Script "stack_revOnline_field_id_1032751"

/*
# Name: field "recent files" of group "stack upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 1032751 of group id 937651 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: yWj8ybry3J2vsx83c4U7RA==
*/


on mouseup
   local tLine, tPath
   put word 2 of the mouseLine into tLine
   if the mousetext is not empty then
      # stack ids stored in a custom property
      put line tLine of the cStackIds of me into tPath
      if the cMode of group "chooser" of group "stack" of group "viewing pane" of stack "revonline" is "update" then
         newStackFileUpdate tPath
      else
         newStackFile tPath
      end if
   end if
end mouseup



on mouseMove
   local tLine
   get the mouseLine
   put word 2 of it into tLine
   hiliteHoverText tLine, (the long id of me)
end mouseMove

on mouseLeave
   clearColors (the long id of me)
end mouseLeave

# Hilite selected tag or type
command hiliteText pText pFieldID
   lock screen
   repeat with x = 1 to the number of lines of the text of pFieldID
      set the textColor of line x of pFieldID to the foregroundColor of stack "revonline"
      set the textStyle of line x of pFieldID to empty
   end repeat
   local tLine 
   put lineoffset (pText, the text of pFieldID) into tLine
   set the textColor of line tLine of pFieldID to rvoHiliteColor()
   set the textStyle of line tLine of pFieldID to "bold"
   unlock screen
end hiliteText

# Hilite current mousetext
command hiliteHoverText pLine pFieldID
   lock screen
   clearColors pFieldID
   if the mouseText is not empty then
      set the textColor of line pLine of pFieldID to rvoHiliteColor()
   end if
   unlock screen
end hiliteHoverText

# Remove hiliting
command clearColors pFieldID
   repeat with x = 1 to the number of lines of the text of pFieldID
      if the textStyle of line x of pFieldID is not "bold" then
         set the textColor of line x of pFieldID to the foregroundColor of stack "revOnline"
      end if
   end repeat
end clearColors
