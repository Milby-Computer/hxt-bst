Script "stack_revTitleBarSelector_bkgnd_id_1011"

/*
# Name: bkgnd "decorations" of stack "revTitleBarSelector" of stack "com.livecode.pi.decorations"
# ID: bkgnd id 1011 of stack "revTitleBarSelector" of stack "com.livecode.pi.decorations"
# Hash: UhzJevqS5y0N+LUvWtiQKg==
*/


on openCard
   if the platform is "MacOS" then 
      set the itemDel to "."
      if item 1 of the systemVersion < 10 then
         put the hiliteColor into tColor
      else
         put "57,115,193" into tColor
      end if   
   else
      put the accentColor into tColor
   end if
   repeat with i = 1 to the num of controls
      if the owner of control i is me then
         set the hiliteColor of control i to tColor
      end if
   end repeat
   put the cDecorations of this stack into tDecorations
   if tDecorations is empty then
      put "empty" into tDecorations
   else if tDecorations is "title,menu,minimize,maximize,close" then
      put "default" into tDecorations
   end if
   
   hilite button tDecorations of me
   revUpdateDescription tDecorations
end openCard

on mouseUp
  if the owner of the target is the name of me then
    put the short name of the target into tDecorations
    revUpdateDescription tDecorations   
  end if
end mouseUp

on revUpdateDescription pDecorations
  put toUpper(char 1 of pDecorations) into char 1 of pDecorations
  replace comma with comma & space in pDecorations    
  put pDecorations into fld "Description"
end revUpdateDescription

on mouseDoubleUp
  local tTarget
  put the short name of the target into tTarget
  setDecorations tTarget, true
end mouseDoubleUp


