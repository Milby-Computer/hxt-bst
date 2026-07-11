Script "stack_revMenuManager_card_id_1002"

/*
# Name: card "Menu Manager" of stack "revMenuManager"
# ID: card id 1002 of stack "revMenuManager"
# Hash: MwwibosAoNeyDsdFYSUcOg==
*/


constant kComma="#####REVCOMMA#####"

local lMenuItemHtml

on preOpenStack
   --window positioning
   local tTopLeft
   put the cREVMenuManagerTopLeft of stack "revPreferences" into tTopLeft
   if tTopLeft is not empty then
      if item 1 of tTopLeft + the width of this stack < item 3 of the windowBoundingRect \
      and item 2 of tTopLeft + the height of this stack < item 4 of the windowBoundingRect then
         set the topLeft of this stack to tTopLeft
      else 
         set loc of this stack to the screenLoc
      end if
   else set the loc of this stack to the screenLoc
   
   revMenuManagerInitialisation
   
   local tTopStack, tMenubar
   put the short name of the topStack into tTopStack
   put the menubar of stack tTopStack into tMenubar
   if tMenubar is not empty and there is a grp tMenubar of this cd of stack tTopStack then
      set the cREVMenuID of this stack to the id of grp tMenubar of this cd of stack tTopStack
      set the cREVDefaultStack of this stack to tTopStack
      set the cREVMenubar of this stack to tMenubar
      revEditMenubar
   else     
      revReset
      revInitialise
   end if
   
   
   set the left of button "Shortcut" of me to the right of me + 10
   
   #MJ: adding the window constrain function.
   revInternal__ConstrainStack the short name of the owner of me
   pass preOpenStack
end preOpenStack

on resumeStack
  if the hilite of btn "MacOS Preview"
  then set the defaultMenuBar to the short name of bg id (the cREVMenuID of this stack) \
      of stack (the cREVDefaultStack of this stack)
end resumeStack

on deleteKey
  if the target is me
  then click at the loc of btn "Delete Menu"
  pass deleteKey
end deleteKey

on revMenuManagerInitialisation
  global gREVTextHeight
  --stuff that only needs to be done once
  --initialisation
  
  set the textFont of fld "Menu Items" to empty
  set the textFont of fld "Menu Buttons" to empty
  if gREVTextHeight is empty then put 16 into gREVTextHeight
  set the textHeight of fld "Menu Buttons" to gREVTextHeight
  set the textHeight of fld "Menu Items" to gREVTextHeight
  revInitialiseFieldIcons
  
  --avoid sending message triggered by close field when the stack is closed
  set the cREVClosing of this stack to false
   
  --bug in the scrollbarwidth on motif  
  if the lookAndFeel is "Motif"
  then set the right of btn "Menu Insertion Arrow" to 178
  else set the right of btn "Menu Insertion Arrow" to 182
  
  --showInvisibles compatible selection of different preview according to platform
  --MacOS has checkbox to preview menu bar
  --Windows/Unix has a menu button which previews the selected menu
  
  if the platform is "MacOS"  then     
    set the topLeft of btn "MacOS Preview" to the cTopLeft of btn "MacOS Preview"
    set the bottom of grp "Windows Preview" to -100
  else 
    set the bottom of btn "MacOS Preview" to -100
    set the bottom of grp "Windows Preview" to 24
  end if   
   
  set the cREVFirstSelectedStack of this stack to empty
  
  set the cAnswerDialog of fld "Menu Name" to false
  set the cBroughtUpAnswerDialog of fld "Menu Name" to false
  set the cAnswerDialog of fld "Item Name" to false
  set the cBroughtUpAnswerDialog of fld "Item Name" to false
end revMenuManagerInitialisation

on revReset
   lock screen
   put empty into fld "Menubar"
   put empty into fld "Menu Buttons"
   set the cREVMenuButtonCardID of this stack to empty
   set the cREVMenubar of this stack to empty
   set the cREVDefaultStack of this stack to empty
   set the cREVMenuButtonIDs of this stack to empty
   set the cREVItemsDisabled of this stack to empty
   set the cREVMenubarNumber of this stack to 0
   set the cREVMenuID of this stack to empty
   set the title of this stack to "Menu Builder"
   unlock screen
end revReset

on closeStackRequest
  --avoid sending messages triggered by closeField
  --when the stack is actually closing
  set the cREVClosing of this stack to true
  pass closeStackRequest
end closeStackRequest

on closeStack
  set the defaultMenubar to the long id of grp "revMenuBar" of stack revIDEPaletteToStackName("menubar")
  set the cREVMenuManagerTopleft of stack "revPreferences" to the topLeft of this stack
  pass closeStack
end closeStack

on revInitialiseFieldIcons
  --clone foldout triangles according to size of Items fld
   global gREVTextHeight
   local tNumOldButtons
  lock screen
  lock messages
  put the num of btns in grp "Foldout Triangles" into tNumOldButtons
  if tNumOldButtons > 1 then
    repeat with i = tNumOldButtons down to 2
      delete btn i of grp "Foldout Triangles"
    end repeat
  end if
  
  if the platform is "MacOS" then
    set the icon of btn 1 of grp "Foldout Triangles" to 200946
    set the cREVIcon of btn 1 of grp "Foldout Triangles" to 200946
    set the hiliteIcon of btn 1 of grp "Foldout Triangles" to 200951
  else
    set the icon of btn 1 of grp "Foldout Triangles" to 200086
    set the cREVIcon of btn 1 of grp "Foldout Triangles" to 200086
    set the hiliteIcon of btn 1 of grp "Foldout Triangles" to 200087
  end if
  disable btn 1 of grp "Foldout Triangles"
  unhilite btn 1 of grp "Foldout Triangles"
  set the showIcon of btn 1 of grp "Foldout Triangles" to false
  
  local tNumLines, tTopLeft
  put round((the height of fld "Menu Items")/gREVTextHeight) into tNumLines
  put the topLeft of btn 1 of grp "Foldout Triangles" into tTopLeft
  repeat with i = 2 to tNumLines
    clone btn 1 of grp "Foldout Triangles"    
    add gREVTextHeight to item 2 of tTopLeft
    set the topLeft of btn i of grp "Foldout Triangles" to tTopLeft
  end repeat
  unlock messages
  unlock screen
end revInitialiseFieldIcons

on revLayoutMenuButtons
   local tMenuButtonIDs, tMenuButtonID, tMenuID, tCardID, tNextLeft
   lock screen
  --layout buttons from left to right according to order in Menu Buttons field
  --and set the visual representation of the menu mnemonics
  put the cREVMenuButtonIDs of this stack into tMenuButtonIDs
  put the cREVMenuID of this stack into tMenuID
  put the cREVMenuButtonCardID of this stack into tCardID
  put 1 into tNextLeft
   
  set the defaultStack to the cREVDefaultStack of this stack
  --arrange rect of btns for proper positioning in stack window
  repeat for each line l in tMenuButtonIDs
    set the rect of btn id l of bg id tMenuID to tNextLeft, -1, tNextLeft + the formattedWidth of btn id l of bg id tMenuID + 4, -1 + the formattedHeight of btn id l of bg id tMenuID -2
    add the width of btn id l of bg id tMenuID to tNextLeft
  end repeat
  --arrange layer of btns for proper positioning on MacOS menubar
  lock menus
  local tOriginalRelayerGroupedControls,tOriginalMenuBar,tOriginalDefaultMenuBar
  put the relayerGroupedControls into tOriginalRelayerGroupedControls
  put the menuBar of this stack into tOriginalMenuBar
  put the defaultMenuBar into tOriginalDefaultMenuBar
  
  local tNumLines, tLayer
  set the relayerGroupedControls to true
  put the num of lines in tMenuButtonIDs into tNumLines
  put the layer of bg id tMenuID + 1 into tLayer
  repeat with i = tNumLines down to 1
    --set layer to be correct for menubar without removing the button from the menu group
    put the long id of btn id (line i of tMenuButtonIDs) of bg id tMenuID into tMenuButtonID
    set the layer of tMenuButtonID to tLayer
    --the mnemonic visual representation in the Menu Buttons fld
    set the textStyle of char (the mnemonic of tMenuButtonID) of line i of fld "Menu Buttons" \
        of this cd of stack "revMenuManager" to "underline"
  end repeat
  
  set the relayerGroupedControls to tOriginalRelayerGroupedControls
  --need to reset the menubar to have it update
  set the menuBar of this stack to empty
  set the defaultMenuBar to the long id of group "revMenuBar" of stack revIDEPaletteToStackName("menubar")
  set the menuBar of this stack to tOriginalMenuBar
  set the defaultMenuBar to tOriginalDefaultMenuBar
  unlock menus
  set the defaultStack to "revMenuManager"
  unlock screen
end revLayoutMenuButtons

on revInitialise
   lock screen
   --disable everything
   global gREVMMMenuItems, gREVActiveMenuButton
   
   unhilite btn "MacOS Preview"
   set the defaultMenubar to the long id of grp "revMenuBar" of stack revIDEPaletteToStackName("menubar")
   put empty into gREVMMMenuItems
   put empty into gREVActiveMenuButton
   put empty into fld "Menu Items"
   put empty into fld "Menu Buttons"
   put empty into fld "Menubar"
   put empty into fld "Menu Name"
   unhilite btn "MacOS Menu Bar"
   put empty into fld "Item Name"
   set the bottom of grp "Menu Insert" to -1000
   set the bottom of grp "Item Insert" to -1000
   set the cREVLastWidgetLine of grp "Menu Insert" to empty
   set the cREVLine of grp "Menu Insert" to empty
   set the cREVLine of grp "Item Insert" to empty
   unhilite btn "Disable Menu" 
   unhilite btn "Menu Mnemonic"
   set the label of btn "Item Style" to "None"
   set the textFont of btn "Preview" to empty
   set the cREVLabel of btn "Preview" to empty
   local tNumControls
   put the num of controls into tNumControls
   repeat with i = 1 to tNumControls
      if not the cREVDontDisable of control i then disable control i
   end repeat
   set the cREVDisabled of btn "Move Menu Up" to true
   set the cREVDisabled of btn "Move Menu Down" to true
   set the cREVDisabled of btn "Reduce Item Nesting" to true
   set the cREVDisabled of btn "Increase Item Nesting" to true
   set the cREVDisabled of btn "Move Item Up" to true
   set the cREVDisabled of btn "Move Item Down" to true
   set the cREVDisabled of btn "Insert Divider" to true
   set the cREVDisabled of btn "Shortcut" to true
   ----------------------------------------
   -- LG 2008-08-26
   --breakpoint
   if the hilite of button "Shortcut Checkbox" is false then
      set the cREVDisabled of button "Control" to true
      set the cREVDisabled of button "Command" to true
      set the cREVDisabled of button "Shift" to true
      set the cREVDisabled of button "Option_Alt" to true
   else
      set the cREVDisabled of button "Control" to false
      set the cREVDisabled of button "Command" to false
      set the cREVDisabled of button "Shift" to false
      set the cREVDisabled of button "Option_Alt" to false
   end if
   unhilite button "Control"
   unhilite button "Command"
   unhilite button "Shift"
   unhilite button "Option_Alt"
   ----------------------------------------
   unhilite btn "Item Disable"
   unhilite btn "Item Mnemonic"
   unhilite btn "Shortcut Checkbox"
   put empty into fld "Shortcut"
   set the label of btn "Item Mnemonic Letter" to space
   set the label of btn "Menu Mnemonic Letter" to space
   
   local tNumButtons
   put the num of buttons in grp "Foldout Triangles" into tNumButtons
   repeat with i = 1 to tNumButtons
      enable btn 1 of grp "Foldout Triangles"
      unhilite btn 1 of grp "Foldout Triangles"
      set the showIcon of btn 1 of grp "Foldout Triangles" to false
   end repeat
   unlock screen
end revInitialise

on revInitialiseForNewMenu
   lock screen
  --update Menu Button controls for new menu
  global gREVActiveMenuButton
   
  --reset menubar preview
  set the defaultMenubar to the long id of grp "revMenuBar" of stack revIDEPaletteToStackName("menubar")
   
  --enable all button menu controls
  --disable then enable grp to reliably enable all its controls
  disable grp "Button Menus:"
  enable grp "Button Menus:"
  set the label of btn "Menu Mnemonic Letter" to space
  set the cREVDisabled of btn "Move Menu Up" to false
  set the cREVDisabled of btn "Move Menu Down" to false
  put line 1 of fld "Menu Buttons" into fld "Menu Name"
  
  enable btn "MacOS Preview"
  enable grp "Windows Preview"
  enable btn "Preview"
  enable fld "Menubar"
  enable btn "MacOS Menu Bar"   
  enable btn "Delete"
  enable btn "Edit Menu Bar Script"
  enable btn "top menu bar"
  
  enable btn "New Menu"
  set the hilitedLine of fld "Menu Buttons" to 1
  unlock screen
end revInitialiseForNewMenu

on revFilterItemName
   --filter out special characters from the menu item to show it as it would appear in its menu
   global gREVActiveMenuButton, gREVMMMenuItems
   local tUnicode,tTab,tBracket,tSlash,tAmpersand,tMarkCodes,t1,t2
   if comma is in the effective textFont of gREVActiveMenuButton then
      
      put true into tUnicode
      put uniEncode(tab) into tTab
      put uniEncode("(") into tBracket
      
      put uniEncode("/") into tSlash
      put uniEncode("&") into tAmpersand
      
      put uniEncode("!c"),uniEncode("!n"),uniEncode("!r"),uniEncode("!u") into tMarkCodes
      put 2 into t1
      put 4 into t2
   else
      put false into tUnicode
      put tab into tTab
      put "(" into tBracket
      
      put "!c,!n,!r,!u" into tMarkCodes
      put 1 into t1
      put 2 into t2
   end if
   
   local tHilitedLine,tMenuLine,tText,tItemName,tOrigItemName
   put the hilitedLine of fld "Menu Items" into tHilitedLine
   put item 3 of line tHilitedLine of gREVMMMenuItems into tMenuLine
   put the text of gREVActiveMenuButton into tText
   put item 2 of line tHilitedLine of gREVMMMenuItems into tItemName
   replace kComma with comma in tItemName
   put tItemName into tOrigItemName
   
   local tCommandKeyShortcut
   --filter out style/disable information etc
   put empty into tCommandKeyShortcut
   
   if tUnicode then
      if char -4 to -3 of tItemName is tSlash \
            and char -2 to -1 of tItemName is not tSlash \
            and char -6 to -5 of tItemName is not "/" then
         put char -4 to -1 of tItemName into tCommandKeyShortcut
         delete char -4 to -1 of tItemName
      end if
   else
      if char - 2 of tItemName is "/" \
            and char - 1 of tItemName is not "/" \
            and char - 3 of tItemName is not "/" then
         put char -2 to -1 of tItemName into tCommandKeyShortcut
         delete char -2 to -1 of tItemName
      end if
   end if
   
   local tSkip,tOffset,tMnemonic
   -- Alt key mnemonic
   put empty into tSkip
   put empty into tOffset
   put empty into tMnemonic 
   if tUnicode then
      repeat
         put offset(tAmpersand, tItemName, tSkip) into tOffset
         add tOffset to tSkip
         if tOffset is 0 then
            exit repeat
         else if char (tSkip - 2) to (tSkip -1) of tItemName is not tAmpersand \
               and char (tSkip + 1) to (tSkip + 2) of tItemName is not tAmpersand then
            put tSkip into tMnemonic
            delete char tSkip to (tSkip + 1) of tItemName
            exit repeat
         end if
      end repeat
   else
      repeat
         put offset("&", tItemName, tSkip) into tOffset
         add tOffset to tSkip
         if tOffset is 0 then
            exit repeat
         else if char tSkip -1 of tItemName is not "&" \
               and char tSkip + 1 of tItemName is not "&" then
            put tSkip into tMnemonic
            delete char tSkip of tItemName
            exit repeat
         end if
      end repeat
   end if
   
   local tTabCount
   --level of submenu
   put empty into tTabCount
   repeat for each char c in tItemName
      if c is tab then add 1 to tTabCount
   end repeat
   replace tTab with empty in tItemName
   
   if char 1 to t1 of tItemName is tBracket then delete char 1 to t1 of tItemName
   repeat for each item i in tMarkCodes
      if char 1 to t2 of tItemName is i then
         delete char 1 to t2 of tItemName
         exit repeat
      end if
   end repeat
   
   if tUnicode
   then set the unicodeText of fld "Item Name" to tItemName
   else set the htmlText of fld "Item Name" to "<p>"&tItemname&"</p>"
   put the htmlText of fld "Item Name" into lMenuItemHtml
   set the cREVCommandKeyShortcut of fld "Item Name" to tCommandKeyShortcut
   if tMnemonic is empty
   then set the cREVMnemonic of fld "Item Name" to empty
   else set the cREVMnemonic of fld "Item Name" to char (tMnemonic + 1) of tOrigItemName
   set the cREVTabCount of fld "Item Name" to tTabCount
end revFilterItemName

on revInitialiseForNoItemSelection
   lock screen
   global gREVActiveMenuButton
   --disable menu item functionality until one is selected
   if gREVActiveMenuButton is empty then 
      set the cREVItemsDisabled of this stack to true
      set the cREVDisabled of btn "Insert Divider" to true
      disable grp "Menu Items:" 
   else
      set the cREVItemsDisabled of this stack to false
      set the cREVDisabled of btn "Insert Divider" to false
      enable grp "Menu Items:"   
      disable btn "Delete Item"
      disable fld "Item Name"
      disable btn "Item Style"
   end if 
   
   put empty into fld "Item Name"
   disable fld "Mark Label"
   set the label of btn "Item Style" to "None"
   set the backPattern of btn "Item Style" to empty
   disable grp "Menu Item Controls"
   unhilite btn "Item Disable"
   set the backPattern of btn "Item Disable" to empty 
   unhilite btn "Item Mnemonic"
   unhilite btn "ShortCut Checkbox"
   
   put empty into fld "Shortcut"
   set the label of btn "Item Mnemonic Letter" to space
   
   
   set the cREVDisabled of btn "Reduce Item Nesting" to true
   set the cREVDisabled of btn "Increase Item Nesting" to true
   set the cREVDisabled of btn "Move Item Up" to true
   set the cREVDisabled of btn "Move Item Down" to true
   set the cREVDisabled of btn "ShortCut" to true
   ------------------------------------------
   -- LG 2008-08-26
   unhilite button "Control"
   unhilite button "Command"
   unhilite button "Shift"
   unhilite button "Option_Alt"
   set the cREVDisabled of button "Control" to true
   set the cREVDisabled of button "Command" to true
   set the cREVDisabled of button "Shift" to true
   set the cREVDisabled of button "Option_Alt" to true
   -------------------------------------------
   unlock screen
end revInitialiseForNoItemSelection
  
function revMenuLongID pShortID
  --return the long id of the menu button currently being edited
  if there is a btn id pShortID of bg id (the cREVMenuID of this stack) of stack (the cREVDefaultStack of this stack) then
    return the long id of btn id pShortID of bg id (the cREVMenuID of this stack) of stack (the cREVDefaultStack of this stack)
  else
    return empty
  end if
end revMenuLongID

on revUpdateScrollbar
   lock screen
  --update the menu items scrollbar
  global gREVTextHeight
  set the endValue of scrollBar "Menu Items" to the formattedHeight of field "Menu Items" - the topMargin of fld "Menu Items"
  set the thumbSize of scrollBar "Menu Items" to the height of field "Menu Items"
  set the lineInc of scrollBar "Menu Items" to gREVTextHeight
  set the pageInc of scrollBar "Menu Items" to the height of field "Menu Items"
  if the endValue of sb "Menu Items" > the height of fld "Menu Items" then enable sb "Menu Items"
  else disable sb "Menu Items"
  unlock screen
end revUpdateScrollbar

on revResetTriangles
   lock screen
  --update the foldout triangles in the menu items fld
   global gREVMMMenuItems, gREVTextHeight
   local tLine,tNumTriangles,tIcon
  put round(the scroll of fld "Menu Items"/gREVTextHeight) into tLine
  put the num of btns in grp "Foldout Triangles" into tNumTriangles
  repeat with i = 1 to tNumTriangles
    add 1 to tLine
    put item 1 of line tLine of gREVMMMenuItems into tIcon
    switch tIcon      
    case false
      enable btn i of grp "Foldout Triangles"
      unhilite btn i of grp "Foldout Triangles"
      set the icon of btn i of grp "Foldout Triangles" to the cREVIcon of btn i of grp "Foldout Triangles"
      break
    case true
      enable btn i of grp "Foldout Triangles"
      hilite btn i of grp "Foldout Triangles"
      set the showIcon of btn i of grp "Foldout Triangles" to true
      break
    default
      disable btn i of grp "Foldout Triangles"
      unhilite btn i of grp "Foldout Triangles"
      set the showIcon of btn i of grp "Foldout Triangles" to false
      break      
    end switch
 end repeat
 unlock screen
end revResetTriangles

on revUpdateField pUnicode
   lock screen
   --update the contents of the Menu Items fld
   global gREVMMMenuItems
   local tMenuItems, tCr, tTab
   put empty into tMenuItems
   if pUnicode then
      put uniEncode(cr) into tCr
      put uniEncode(tab) into tTab
      repeat for each line l in gREVMMMenuItems
         put tab & item 2 of l & return after tMenuItems
      end repeat
      delete char -1 of tMenuItems
      replace kComma with comma in tMenuItems
      set the unicodeText of fld "Menu Items" to uniEncode(tMenuItems,"UTF8")
   else
      repeat for each line l in gREVMMMenuItems
         put tab & item 2 of l & cr after tMenuItems
      end repeat
      delete last char of tMenuItems
      replace kComma with comma in tMenuItems
      put tMenuItems into fld "Menu Items"
   end if
   unlock screen
end revUpdateField



on revGenerateItemsField
   --set the contents of the menu Items fld, its variable and initialise the foldout triangles
   global gREVTextHeight, gREVMMMenuItems, gREVActiveMenuButton
   local tMenuItems
   lock messages
   put the unicodetext of gREVActiveMenuButton into tMenuItems
   put uniDecode(tMenuItems,"UTF8") into tMenuItems
   
   local tCounter, tMenuItemsField, tNotCascade, tMenuItem
   put 0 into tCounter
   put empty into gREVMMMenuItems
   put empty into tMenuItemsField
   repeat for each line l in tMenuItems
      add 1 to tCounter
      if tab is in l then
         --if last item was cascade menu, set its icon
         if tNotCascade then put false into item 1 of the last line of gREVMMMenuItems
         put false into tNotCascade
      else
         put true into tNotCascade
         put l into tMenuItem
         replace comma with kComma in tMenuItem
         put empty, tMenuItem, tCounter & cr after gREVMMMenuItems
         put tab & l & return after tMenuItemsField
      end if
   end repeat
   delete last char of gREVMMMenuItems
   
   set the unicodeText of fld "Menu Items" to uniEncode(tMenuItemsField,"UTF8")
   
   --insertion widget
   local tWidgetLine, tNumButtons, tIcon
   put round((item 2 of the loc of grp "Item Insert" - the top of fld "Menu Items")/gREVTextHeight) into tWidgetLine
   if the num of lines in tMenuItemsField < tWidgetLine then 
      put the num of lines in tMenuItemsField into tWidgetLine
      set the top of grp "Item Insert" to the top of fld "Menu Items" + (tWidgetLine * gREVTextHeight) - the topMargin of fld "Menu Items" + 3
   end if
   if the bottom of grp "Item Insert" is - 1000 then
      set the top of grp "Item Insert" to the top of fld "Menu Items" - 7
      set the cREVLine of grp "Item Insert" to 0
   else
      set the cREVLine of grp "Item Insert" to tWidgetLine
   end if
   --foldout triangles
   put the num of btns in grp "Foldout Triangles" into tNumButtons
   repeat with i = 1 to tNumButtons
      put item 1 of line i of gREVMMMenuItems into tIcon
      if tIcon is false then
         enable btn i of grp "Foldout Triangles"
         unhilite btn i of grp "Foldout Triangles"
         set the icon of btn i of grp "Foldout Triangles" to the cREVIcon of btn i of grp "Foldout Triangles"
      else
         disable btn i of grp "Foldout Triangles" 
         unhilite btn i of grp "Foldout Triangles"    
         set the showIcon of btn i of grp "Foldout Triangles" to false
      end if
   end repeat
   unlock messages
end revGenerateItemsField

command log pMessage
   put pMessage & return after msg
end log

on revNewMenuItem pItem
   global gREVActiveMenuButton, gREVMMMenuItems, gREVTextHeight
   if the cAnswerDialog of fld "Item Name" then exit revNewMenuItem
   
   lock screen
   revCheckNameChanged
   
   local tTab,tCr,tUnicode,tHilitedLines,tScroll,tText,tFieldLine,tMenuLine,tNextMenuLine,tItemNum
   put uniEncode(tab) into tTab
   put uniEncode(cr) into tCr

   put true into tUnicode   
   --create new item divider
   put the hilitedLines of fld "Menu Items" into tHilitedLines
   put the scroll of fld "Menu Items" into tScroll
   put the unicodetext of gREVActiveMenuButton into tText
   replace tCr with cr in tText
   put the cREVLine of grp "Item Insert" into tFieldLine
   put item 3 of line tFieldLine of gREVMMMenuItems into tMenuLine
   put item 3 of line (tFieldLine + 1) of gREVMMMenuItems into tNextMenuLine
   put the num of lines in tText + 1 into tItemNum
   
   local tItemContents,tNumTabs,tTabIndent,tNewItem
   --update gREVMMMenuItems for new item
   put item 2 of line tFieldLine of gREVMMMenuItems into tItemContents
   put empty into tNumTabs
   repeat for each char c in tItemContents
      if c is tTab then add 1 to tNumTabs
   end repeat
   if item 1 of line tFieldLine of gREVMMMenuItems is true then add 1 to tNumTabs
   put empty into tTabIndent
   repeat tNumTabs
      put tTab before tTabIndent
   end repeat
   
   if pItem is "divider" then put tTabIndent & "-" into tNewItem
   else put tTabIndent & "Item" && tItemNum into tNewItem
   if tUnicode then
      put uniEncode(tNewItem) into tNewItem
      set the unicodeText of fld "Item Name" to tNewItem
   else put tNewItem into fld "Item Name"
   
   local tButtonContentsLine,tNewItem2
   if tNextMenuLine is not empty then put tNextMenuLine into tButtonContentsLine
   else put the num of lines in tText + 1 into tButtonContentsLine
   
   put uniDecode(tNewItem,"UTF8") into tNewItem2
   
   replace comma with kComma in tNewItem2
   
   if tFieldLine is 0 then
      if gREVMMMenuItems is empty then
         put comma & tNewItem2, tButtonContentsLine into gREVMMMenuItems
      else
         put comma & tNewItem2, tButtonContentsLine & cr before line 1 of gREVMMMenuItems
      end if
   else put cr & comma & tNewItem2, tButtonContentsLine after line tFieldLine of gREVMMMenuItems
   
   --update references to button contents line numbers
   local tStartLine,tFinishLine
   put tFieldLine + 2 into tStartLine
   put the num of lines in gREVMMMenuItems into tFinishLine
   repeat with i = tStartLine to tFinishLine
      add 1 to item 3 of line i of gREVMMMenuItems
   end repeat
   
   --update button contents
   switch
      case tText is empty
         put tNewItem into tText
         break
      case tNextMenuLine is empty
         put cr & tNewItem after tText
         break
      default
         put tNewItem & cr before line tNextMenuLine of tText
         break
   end switch
   
   replace cr with tCr in tText
   set the unicodetext of gREVActiveMenuButton to tText
   set the unicodeText of button "Preview" to tText
   --put tText into btn "Preview"
   
   revUpdateField tUnicode
   set the hilitedLine of fld "Menu Items" to tFieldLine + 1
   set the scroll of fld "Menu Items" to tScroll
   revResetTriangles
   revUpdateScrollbar
   
   --update widget
   local tWidgetLoc
   put item 2 of the loc of grp "Item Insert" + gREVTextHeight into tWidgetLoc
   if not (tWidgetLoc > the bottom of fld "Menu Items") 
   then set the loc of grp "Item Insert" to item 1 of the loc of grp "Item Insert", tWidgetLoc
   set the cREVLine of grp "Item Insert" to tFieldLine + 1
   send "mouseUp" to fld "Menu Items"
   select the text of fld "Item Name"
   unlock screen
end revNewMenuItem

on revCheckNameChanged
  if the short name of the focusedObject is "Menu Name"
  then send "revCheckAndChangeMenuName" to fld "Menu Buttons"
  if the short name of the focusedObject is "Item Name"
  then revCheckandChangeMenuItemName
end revCheckNameChanged

on revCheckandChangeMenuItemName
  if the htmlText of fld "Item Name" is not lMenuItemHtml
  then send "revChangeMenuItemName" to fld "Item Name"
end revCheckandChangeMenuItemName

on revDeleteMenuManagerGroup
  lock screen
  --reset menu bar
  revReset
  revInitialise
  revResetTriangles
  unlock screen
end revDeleteMenuManagerGroup

on revEditMenubar
   local tMenuBar
   put the cREVMenubar of this stack into tMenubar
   put tMenubar into fld "Menubar"
   
   local tDefaultStack, tMenuID
   put the cREVDefaultstack of this stack into tDefaultStack
   put the cREVMenuID of this stack into tMenuID
   set the title of this stack to "Menu Builder:" && tMenubar && "(" & "Stack:" && quote & tDefaultStack & quote & ")"   
   
   local tHCAddressing,tNumButtons
   put the hcAddressing of stack tDefaultStack into tHCAddressing
   set the hcAddressing of stack tDefaultStack to false
   --list menu btns in bg to sort them from leftermost
   set the defaultStack to tDefaultStack
   put the num of btns in bg id tMenuID of this stack into tNumButtons
   
   local tMenuButtonsList
   put empty into tMenuButtonsList
   repeat with i = 1 to tNumButtons
      if the style of btn i of bg id tMenuID is among the items of "menu,popup" then
         put the left of btn i of bg id tMenuID, the id of btn i of bg id tMenuID & cr after tMenuButtonsList
         if the label of btn i of bg id tMenuID is empty
         then set the label of btn i of bg id tMenuID to the short name of btn i of bg id tMenuID
      end if
   end repeat
   delete the last char of tMenuButtonsList
   
   
   --make list of menu buttons from leftermost to rightermost
   local tMenuButtonIDs,tMenuButtonNames
   sort lines of tMenuButtonsList numeric ascending by item 1 of each
   put empty into tMenuButtonIDs
   put empty into tMenuButtonNames
   repeat for each line l in tMenuButtonsList
      put item 2 of l & cr after tMenuButtonIDs
      put the label of btn id (item 2 of l) & cr after tMenuButtonNames
   end repeat
   
   delete last char of tMenuButtonNames
   delete last char of tMenuButtonIDs
   set the defaultStack to "revMenuManager"
   put tMenuButtonNames into fld "Menu Buttons"
   --show mnemonics
   local tNumMenus, tMenuButton, tMnemonic
   put the num of lines in tMenuButtonIDs into tNumMenus
   repeat with i = 1 to tNumMenus
      put the long id of btn id (line i of tMenuButtonIDs) of bg id tMenuID of stack tDefaultStack into tMenuButton
      set the textFont of line i of fld "Menu Buttons" to the  effective textFont of tMenuButton
      put the mnemonic of tMenuButton into tMnemonic    
      set the textStyle of char tMnemonic of line i of fld "Menu Buttons" to "underline"
   end repeat  
   set the cREVMenuButtonIDs of this stack to tMenuButtonIDs
   --ordered list of ids from leftermost to rightermost, each line corresponding with the line in fld "Menu Buttons"
   revIDESetEdited tDefaultStack
   revInitialiseForNewMenu
   send "mouseUp" to fld "Menu Buttons"
   revInitialiseForNoItemSelection
   
   --initialise menuBar checkbox
   if the menuBar of stack tDefaultstack is the short name of bg id tMenuID of stack tDefaultStack
   then hilite btn "MacOS Menu Bar"
   else unhilite btn "MacOS Menu Bar"
   
   set the hcAddressing of stack tDefaultStack to tHCAddressing
   
   select the text of fld "Menubar"
   unlock screen
end revEditMenubar

function revMenuDescription
   global gREVActiveMenuButton
   local tReturn,tHtml,tOffset
  put "menu button" && the short name of gREVActiveMenuButton into tReturn
  if comma is in the effective textFont of gREVActiveMenuButton then
    if the hilitedLine of fld "Menu Buttons" is empty then return tReturn
    put line (the hilitedLine of fld "Menu Buttons") of the htmlText of fld "Menu Buttons" into tHtml
    put offset("<p>", tHtml) into tOffset
    if tOffset is not 0 then delete char tOffset to (tOffset + 2) of tHtml
    put offset("</p>", tHtml) into tOffset
    if tOffset is not 0 then delete char tOffset to (tOffset + 3) of tHtml  
    put " (labelled" && tHtml & ")" after tReturn
  end if
  return tReturn   
end revMenuDescription

function revNewMenuName pMenuGroup, pMinNum
   local tNumBtns,tName,tButtonName
  put the num of btns in pMenuGroup into tNumBtns
  repeat with i = 1 to tNumBtns
    put the short name of btn i of pMenuGroup into tName
    if word 1 of tName is "Menu" and word 2 of tName is a number then
      if word 2 of tName >= pMinNum then 
        put (word 2 of tName) + 1 into pMinNum
      end if
    end if
  end repeat
  return "Menu" && pMinNum into tButtonName
end revNewMenuName

function revUniUpdateLine pLineContents, pLine, pText, pUnicode
   global gREVActiveMenuButton
   
   local tCr
   if pUnicode then
      put uniEncode(cr) into tCr
   else 
      put cr into tCr
   end if
   
   put uniEncode(pLineContents,"UTF8") into pLineContents
   
   if pLine = 1 then 
      put pLineContents into line 1 of pText
   else
      --unicode compatible way of 'putting into line'
      put uniEncode(cr) & pLineContents after line pLine of pText
      delete line pLine of pText
   end if
   return pText
end revUniUpdateLine

----------------------------------------------
-- LG 2008-08-28

-- Parameters
--   pMenuLine : a line of text from the menu eg "&Open/O"
-- Description
--   Updates all appropriate controls to reflect the specified menu item. In this case
--   The command key checkbox would be hilited, the disabled checkbox would not be hillited
--   and the key field would contain the letter "O", etc.
command updateControls pMenuLine
   lock screen
   local tMenuItem
   put pMenuLine into tMenuItem
   
   local tMnemonicOffset
   put offset("&", tMenuItem) into tMnemonicOffset
   if tMnemonicOffset <> 0 then
      set the hilite of button "Item Mnemonic" to true
      
      local tMnemonic
      put char tMnemonicOffset + 1 of tMenuItem into tMnemonic
      set the label of button "Item Mnemonic Letter" to "tempLabel"
      set the label of button "Item Mnemonic Letter" to tMnemonic
      enable button "Item Mnemonic Letter"
      
      delete char tMnemonicOffset of tMenuItem
   else
      set the hilite of button "Item Mnemonic" to false
      set the label of button "Item Mnemonic Letter" to "tempLabel"
      set the label of button "Item Mnemonic Letter" to empty
      disable button "Item Mnemonic Letter"
   end if
   
   local tDisabled
   put (char 1 of tMenuItem is "(") into tDisabled
   if tDisabled then
      set the hilite of button "Item Disable" to true
      delete char 1 of tMenuItem
   else
      set the hilite of button "Item Disable" to false
   end if
   
   local tMark
   put char 1 to 2 of tMenuItem into tMark
   
   
   local tMarkLabel
   switch tMark
      case "!n"
         put "None" into tMarkLabel
         delete char 1 to 2 of tMenuItem
      break
      case "!r"
         put "Diamond" into tMarkLabel
         delete char 1 to 2 of tMenuItem
      break
      case "!c"
         put "Checked" into tMarkLabel
         delete char 1 to 2 of tMenuItem
      break
      default
         put "None" into tMarkLabel
      break
   end switch
   
   set the label of button "Item Style" to "tempLabel"
   set the label of button "Item Style" to tMarkLabel
   
   local tSlashOffset
   put offset(slash, tMenuItem) into tSlashOffset
   
   if tSlashOffset = 0 then
      set the hilite of button "Shortcut Checkbox" to false
      set the hilite of button "Control" to "false"
      set the hilite of button "Command" to "false"
      set the hilite of button "Option_Alt" to "false"
      set the hilite of button "Shift" to "false"
      disable button "Control"
      disable button "Command"
      disable button "Shift"
      disable button "Option_Alt"
      disable field "Shortcut"
      set the text of field "Shortcut" to empty
      set the label of button "Shortcut" to empty
   else
      local tShortcut
      put char tSlashOffset + 1 to -1 of tMenuItem into tShortcut
      
      local tShortcutKeys
      
      if tShortcut contains "%" then
         put true into tShortcutKeys["Control"]
      end if
      
      if tShortcut contains "@" then
         put true into tShortcutKeys["Shift"]
      end if
      
      if tShortcut contains "^" then
         put true into tShortcutKeys["Command"]
      end if
      
      if tShortcut contains "#" then
         put true into tShortcutKeys["Option_Alt"]
      end if
      
      if the keys of tShortcutKeys is empty then
         set the hilite of button "Shortcut Checkbox" to false
         disable button "Control"
         disable button "Command"
         disable button "Shift"
         disable button "Option_Alt"
         disable field "Shortcut"
         set the text of field "Shortcut" to empty
         set the label of button "Shortcut" to empty
      else
         set the hilite of button "Shortcut Checkbox" to true
         set the hilite of button "Control" to (tShortcutKeys["Control"] = true)
         set the hilite of button "Command" to (tShortcutKeys["Command"] = true)
         set the hilite of button "Shift" to (tShortcutKeys["Shift"] = true)
         set the hilite of button "Option_Alt" to (tShortcutKeys["Option_Alt"] = true)
         enable field "Shortcut"
         set the label of button "Shortcut" to empty
         put char -1 of tMenuItem into field "Shortcut"
      end if
      delete char tSlashOffset to -1 of tMenuItem
   end if
   
   set the text of field "Item Name" to tMenuItem
   unlock screen
end updateControls


-- Returns
--   A menu line eg "&Open/O". This function looks at the current values of all appropriate controls,
--   and produces the menu line that they represent.
function createMenuLine
   local tAcceleratorKeys, tItemName, tMenuName, tShortcutKey, tGotAccelerator
   put "false" into tGotAccelerator
   
   put the text of field "Item Name" after tMenuName
   
   if the hilite of button "Item Mnemonic" is true then
      local tIndex
      put the menuHistory of button "Item Mnemonic Letter" into tIndex
      put "&" before char tIndex of tMenuName
   end if
   
   local tMark
   put the label of button "Item Style" into tMark
   if tMark is "Checked" then
      put "!c" before tMenuName
   else if tMark is "Diamond" then
      put "!r" before tMenuName
   else
      --
   end if
   
   if the hilite of button "Item Disable" then
      put "(" before tMenuName
   end if
   
   if the hilite of button "Shortcut Checkbox" then
      put slash after tMenuName
      
      if the hilite of button "Control" then
         put "true" into tGotAccelerator
         put "%" after tMenuName
      end if
      
      if the hilite of button "Command" then
         put "true" into tGotAccelerator
         # TH-03/04/09 - bug 7140
         if the hilite of button "Option_Alt" or the hilite of button "Shift" or the hilite of button "Control" then
            put "^" after tMenuName
         end if
      end if
      
      if the hilite of button "Option_Alt" then
         put "true" into tGotAccelerator
         put "#" after tMenuName
      end if
      
      if the hilite of button "Shift" then
         put "true" into tGotAccelerator
         put "@" after tMenuName
      end if
      
      if tGotAccelerator is "false" then
         delete the last char of tMenuName
      else
         put the text of field "Shortcut" into tShortcutKey
         put tShortcutKey after tMenuName
      end if
   end if
   
   --put tMenuName into field "Result"
   return tMenuName
end createMenuLine

command updateMenuLine
   lock screen
   local tNewMenuLine
   put createMenuLine() into tNewMenuLine
   
   local tOldHilitedLine
   put the hilitedLine of field "Menu Items" of me into tOldHilitedLine
   
   local tHilitedLine
   put line(the hilitedLine of field "Menu Items" of me) of the text of field "Menu Items" of me into tHilitedLine
   
   local tIndent
   repeat for each char tChar in tHilitedLine
      if tChar is not tab then
         exit repeat
      end if
      
      put tChar after tIndent
   end repeat
   
   put tIndent & tNewMenuLine into line(the hilitedLine of field "Menu Items" of me) of field "Menu Items" of me
   set the hilitedLine of field "Menu Items" of me to tOldHilitedLine
   
   global gREVActiveMenuButton
   
   local tText
   put the text of gREVActiveMenuButton into tText
   
   delete char 1 of tIndent
   put tIndent & tNewMenuLine into line tOldHilitedLine of tText
   set the text of gREVActiveMenuButton to tText 
   
   --set the text of gREVActiveMenuButton to the text of field "Menu Items" of me
   --put tText into btn "Preview"     
   --revUpdateField tUnicode
   --set the hilitedLines of fld "Menu Items" to tHilitedLines
   --set the scroll of fld "Menu Items" to tScroll
   unlock screen
end updateMenuLine
