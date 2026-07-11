Script "stack_revMenuManager_field_id_4847"

/*
# Name: field "Item Name" of bkgnd "Menu Items:" of stack "revMenuManager"
# ID: field id 4847 of bkgnd id 3226 of stack "revMenuManager"
# Hash: rWlKH2cP5SbQFZeTo+iVlQ==
*/


on closeField
  revChangeMenuItemName
end closeField

on revChangeMenuItemName
   global gREVMMMenuItems, gREVActiveMenuButton
   if the cAnswerDialog of me or the disabled of me then exit revChangeMenuItemName
   
   local tUnicode
   put true into tUnicode
   
   local tHilitedLine
   put the hilitedLine of fld "Menu Items" into tHilitedLine
   
   local tNewItemName
   put the unicodeText of me into tNewItemName
   put uniDecode(tNewItemName,"UTF8") into tNewItemName
   
   local tTab, tBracket, tCheck, tRadio, tHyphen, tAnphasand, tMenuLine
   if tUnicode then      
      put tab into tTab
      put "(" into tBracket
      put "!c" into tCheck
      put "!r" into tRadio
      put "-" into tHyphen
      put "&" into tAnphasand
   else 
      
      put item 3 of line tHilitedLine of gREVMMMenuItems into tMenuLine
      set the cAnswerDialog of me to true
      if tMenuLine is the num of lines in the text of gREVActiveMenuButton - 1 and the text of me is not "-" then
         switch
            case the hilitedLine of fld "Menu Buttons" is 1
               set the cBroughtUpAnswerDialog of me to true
               answer warning "As the Quit menu item is moved to the Application menu on Mac OS X, LiveCode expects this menu item to be a divider, and removes it on Mac OS X.  Are you sure you don't want a divider here?" with "No" or "Yes"
               break
            case line (the hilitedLine of fld "Menu Buttons") of fld "Menu Buttons" is "Edit"
               set the cBroughtUpAnswerDialog of me to true
               answer warning "As the Preferences menu item is moved to the Application menu on Mac OS X, LiveCode expects this menu item to be a divider, and removes it on Mac OS X.  Are you sure you don't want a divider here?" with "No" or "Yes"
               break
            case the hilitedLine of fld "Menu Buttons" is the num of lines in fld "Menu Buttons"
               set the cBroughtUpAnswerDialog of me to true
               answer warning "As the About menu item is moved to a different menu on Mac OS, LiveCode expects this menu item to be a divider, and removes it on Mac OS.  Are you sure you don't want a divider here?" with "No" or "Yes"
               break
         end switch
         if it is "No" then
            lock messages
            put "-" into me
            unlock messages
         end if
      else if tMenuLine is the num of lines in the text of gREVActiveMenuButton \
            and line (the hilitedLine of fld "Menu Buttons") of fld "Menu Buttons" is "Edit" \
            and the text of me is not among the items of "Preferences,Preferences..." then
         set the cBroughtUpAnswerDialog of me to true
         answer warning "The Preferences menu item is moved to the Application menu on Mac OS X and so must appear as Preferences... on this platform. Are you sure you want to name the menu item something other than Preferences?" with "No" or "Yes"
         if it is "No" then
            lock messages
            put "Preferences" into me
            unlock messages
         end if
      end if
      set the cAnswerDialog of me to false
      
      put the text of me into tNewItemName
      put tab into tTab
      put "(" into tBracket
      put "!c" into tCheck
      put "!r" into tRadio
      put "-" into tHyphen
      put "&" into tAnphasand
   end if
   
   local tCommandKeyShortcut, tTabCount, tScroll
   put the cREVCommandKeyShortcut of fld "Item Name" into tCommandKeyShortcut
   
   put the cREVTabCount of fld "Item Name" into tTabCount
   put the scroll of fld "Menu Items" into tScroll
   put item 3 of line tHilitedLine of gREVMMMenuItems into tMenuLine
   
   local tText
   if tUnicode then
      put the unicodeText of gREVActiveMenuButton into tText
   else
      put the text of gREVActiveMenuButton into tText
   end if
   
   if the label of btn "Item Style" is "Checked" 
   then put tCheck before tNewItemName
   else if the label of btn "Item Style" is "Diamond" 
   then put tRadio before tNewItemName
   if tNewItemName is not tHyphen and the hilite of btn "Item Disable" 
   then put tBracket before tNewItemName
   
   repeat tTabCount
      put tTab before tNewItemName      
   end repeat
   
   local tOffset
   put offset(the cREVMnemonic of fld "Item Name", tNewItemName) into tOffset
   if tOffset is not 0 then put tAnphasand before char tOffset of tNewItemName
   
   if tCommandKeyShortcut is not empty then put tCommandKeyShortcut after tNewItemName
   put revUniUpdateLine(tNewItemName, tMenuLine, tText, tUnicode) into tText
   replace comma with "#####REVCOMMA#####" in tNewItemName
   
   put tNewItemName into item 2 of line tHilitedLine of gREVMMMenuItems
   
   if tUnicode then
      set the unicodetext of gREVActiveMenuButton to tText
   else
      set the text of gREVActiveMenuButton to tText
   end if
   
   lock screen
   
   if tUnicode then
      set the unicodeText of button "preview" to tText
   else
      put tText into btn "Preview"
   end if
   
   revUpdateField tUnicode
   set the hilitedLines of fld "Menu Items" to tHilitedLine
   set the scroll of fld "Menu Items" to tScroll
   
   unlock screen
   if not the cREVClosing of this stack
   then send "mouseUp" to fld "Menu Items" in 10 milliseconds
end revChangeMenuItemName

on returnInField
  revChangeMenuItemName
  send "revSelectRenameText" to me in 50 milliseconds
end returnInField

on revSelectRenameText
  select the text of me
end revSelectRenameText

on enterInField
  returnInField
end enterInField
