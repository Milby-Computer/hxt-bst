Script "stack_LiveCode_Docs_Editor_button_id_1186"

/*
# Name: button "set" of group "description" of group "xml editing" of card "card id 1002" of stack "LiveCode Docs Editor"
# ID: button id 1186 of group id 1114 of group id 1102 of card id 1002 of stack "LiveCode Docs Editor"
# Hash: 0uSU/lloUn2TiAVbuQvFCQ==
*/


on mouseUp
   put the hilitedText of field "formatting tag list" into tTagType
   put the selectedChunk into tChunk
   
   if tTagType is not among the items of "warning,note,cp_note,change,tip,important" then
      ask "Please enter the tag"
      if the result is not cancel then
         put it into tTagLabel
         
         --set the linkText of tChunk to (tTagType && "tag=" & quote & tTagLabel & quote)
         set the linkText of tChunk to (tTagType && "tag=" & tTagLabel)
      end if
   else
      set the linkText of tChunk to tTagType
      ## linkText doesn't work around eg <i> tags
      --      put word 2 of tChunk into tStartChar
      --      put word 4 of tChunk into tEndChar
      --      put word 7 of tChunk into tField
   end if
end mouseUp
