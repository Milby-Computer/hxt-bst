Script "stack_revMenuManager_button_id_4854"

/*
# Name: button "Increase Item Nesting" of bkgnd "Menu Items:" of stack "revMenuManager"
# ID: button id 4854 of bkgnd id 3226 of stack "revMenuManager"
# Hash: IkAvfFl+QNUAU7sQf7AuhA==
*/


on mouseUp
   --increase item nesting
   global gREVActiveMenuButton, gREVMMMenuItems
   lock screen
   revCheckNameChanged
   
   --if comma is in the effective textFont of gREVActiveMenuButton then
   put true into tUnicode
   --put uniEncode(tab) into tTab
   --put uniEncode("(") into tBracket
   --else
   --put false into tUnicode
   --put tab into tTab
   --put "(" into tBracket
   --end if
   
   put the hilitedLines of fld "Menu Items" into tHilitedLines
   put the scroll of fld "Menu Items" into tScroll
   
   put the unicodetext of gREVActiveMenuButton into tText
   put uniDecode(tText,"UTF8") into tText
   
   put (item 1 of tHilitedLines) - 1 into tPrevLineNum
   put line (item 1 of tHilitedLines) of fld "Menu Items" into tLine
   put line tPrevLineNum of fld "Menu Items" into tPrevLine
   put 0 into tNumTabs
   repeat for each char c in tLine
      if c is tab then add 1 to tNumTabs
   end repeat
   put 0 into tPrevNumTabs
   repeat for each char c in tPrevLine
      if c is tab then add 1 to tPrevNumTabs
   end repeat
   
   if tNumTabs is 1 and tPrevNumTabs is 1 then 
      put true into item 1 of line tPrevLineNum of gREVMMMenuItems
   end if
   
   repeat for each item i in tHilitedLines
      put item 2 of line i of gREVMMMenuItems into tMenuItem
      --put offset(tCheck, tMenuItem) into tOffset
      put tab before tMenuItem
      put tMenuItem into item 2 of line i of gREVMMMenuItems
      put revUniUpdateLine(tMenuItem, item 3 of line i of gREVMMMenuItems, the unicodetext of gREVActiveMenuButton,true) into tText
   end repeat
   
   --update button contents
   replace "#####REVCOMMA#####" with comma in tText
   
   --   set the text of gREVActiveMenuButton to tText
   --   put tText into btn "Preview"     
   set the unicodeText of gREVActiveMenuButton to tText
   set the unicodeText of button "Preview" to tText
   
   revUpdateField tUnicode
   set the hilitedLines of fld "Menu Items" to tHilitedLines
   set the scroll of fld "Menu Items" to tScroll
   revResetTriangles
   send "mouseUp" to fld "Menu Items" in 10 milliseconds
   unlock screen
end mouseUp
  
    
      
setProp cREVDisabled pDisabled
  if pDisabled then
    disable me
  else
    enable me
  end if
end cREVDisabled
