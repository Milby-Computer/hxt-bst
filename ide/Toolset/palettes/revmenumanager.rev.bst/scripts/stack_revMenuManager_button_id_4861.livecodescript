Script "stack_revMenuManager_button_id_4861"

/*
# Name: button "Item Disable" of bkgnd "Menu Item Controls" of stack "revMenuManager"
# ID: button id 4861 of bkgnd id 3265 of stack "revMenuManager"
# Hash: nGV07SG9CPLXvrCDZ6a/Fg==
*/


on mouseUp
   global gREVActiveMenuButton, gREVMMMenuItems
   lock screen
   revCheckNameChanged
   set the backPattern of me to empty
   --enable/disable selected menu items
   put the hilitedLines of fld "Menu Items" into tHilitedLines
   put the scroll of fld "Menu Items" into tScroll
   
   ## Bug 11110
   put the unicodetext of gREVActiveMenuButton into tText
   put true into tUnicode
   --   put uniEncode(tab) into tTab
   --   put uniEncode("(") into tBracket
   --   put "(" into tBracket
   --   put uniEncode("-") into tHyphen
   --   put uniEncode(cr) into tCr
   
   put tab into tTab
   put "(" into tBracket
   put "-" into tHyphen
   put return into tCr
   
   repeat for each item i in tHilitedLines
      put item 2 of line i of gREVMMMenuItems into tMenuItem
      put tMenuItem into tFilteredMenuItem
      replace tTab with empty in tFilteredMenuItem
      switch
         case char 1 of tFilteredMenuItem is "("
         case char 1 to 2 of tFilteredMenuItem is tBracket
         case tFilteredMenuItem is tHyphen
            put true into tAlreadyDisabled
            break
         default
            put false into tAlreadyDisabled
            break
      end switch
      
      put empty into tSpecialCharacters
      repeat for each char c in tMenuItem
         if c is tab then add 1 to tSpecialCharacters
         else exit repeat
      end repeat
      --if tUnicode then multiply tSpecialCharacters by 2
      
      if the hilite of me then
         --disable
         switch
            case tAlreadyDisabled
               next repeat
               break
            case tSpecialCharacters is not empty
               --not already disabled insert disable character after tabs
               put tBracket after char tSpecialCharacters of tMenuItem
               break
            default
               --insert disable character
               put tBracket before tMenuItem
               break          
         end switch
      else
         --enable
         if tAlreadyDisabled then
            if tUnicode then
               put offset(tBracket, tMenuItem) into tOffset
               delete char tOffset of tMenuItem
            else 
               delete char offset("(",tMenuItem) of tMenuItem
            end if
         end if
      end if
      put tMenuItem into item 2 of line i of gREVMMMenuItems
      put item 3 of line i of gREVMMMenuItems into tLine
      
      put revUniUpdateLine(tMenuItem,tLine,tText) into tText
   end repeat
   
   --update button contents
   set the unicodetext of gREVActiveMenuButton to tText
   put tText into btn "Preview"     
   revUpdateField false
   set the hilitedLines of fld "Menu Items" to tHilitedLines
   set the scroll of fld "Menu Items" to tScroll
   unlock screen
end mouseUp
