Script "stack_revMenuManager_button_id_4852"

/*
# Name: button "Item Style" of bkgnd "Menu Items:" of stack "revMenuManager"
# ID: button id 4852 of bkgnd id 3226 of stack "revMenuManager"
# Hash: zykxT+6JCF2qH3pKcc838Q==
*/


on mouseDown
  revCheckNameChanged
  pass mouseDown
end mouseDown

on menuPick pWhich
  global gREVActiveMenuButton, gREVMMMenuItems
  lock screen
  put the hilitedLines of fld "Menu Items" into tHilitedLines
  put the scroll of fld "Menu Items" into tScroll
  put the text of gREVActiveMenuButton into tText
  
  if comma is in the effective textFont of gREVActiveMenuButton then
    put true into tUnicode
    put uniEncode(tab) into tTab
    put uniEncode("(") into tBracket
    put uniEncode("!c") into tCheck
    put uniEncode("!n") into tUncheck
    put uniEncode("!r") into tRadio
    put uniEncode("!u") into tUnRadio
    put uniEncode("!c"),uniEncode("!n"),uniEncode("!r"),uniEncode("!u") into tMarkCodes
    put 3 into tAdd
    put 4 into t2
  else
    put false into tUnicode
    put tab into tTab
    put "(" into tBracket
    put "!c" into tCheck
    put "!u" into tUnCheck
    put "!r" into tRadio
    put "!u" into tUnRadio
    put "!c,!n,!r,!u" into tMarkCodes
    put 1 into tAdd
    put 2 into t2
  end if
  
  switch pWhich
  case "None"
    --make the selected menu items not radiobuttons or checkboxes
    repeat for each item i in tHilitedLines
      put item 2 of line i of gREVMMMenuItems into tMenuItem
      put tMenuItem into tFilteredMenuItem
      replace tTab with empty in tFilteredMenuItem
      replace tBracket with empty in tFilteredMenuItem
      put empty into tStyleToDelete
      repeat for each item j in tMarkCodes
        if char 1 to t2 of tFilteredMenuItem is j then
          put j into tStyleTextToDelete
          exit repeat
        end if
      end repeat
      
      if tStyleTextToDelete is not empty then
        put offset(tStyleTextToDelete,tMenuItem) into tOffset
        delete char tOffset to (tOffset + tAdd) of tMenuItem
        put tMenuItem into item 2 of line i of gREVMMMenuItems
        put revUniUpdateLine(tMenuItem, item 3 of line i of gREVMMMenuItems, tText) into tText
      end if
    end repeat
    break
     
  case "Checked"
    --make the selected menu items checkboxes
    repeat for each item i in tHilitedLines
      put item 2 of line i of gREVMMMenuItems into tMenuItem
      put tMenuItem into tFilteredMenuItem
      replace tTab with empty in tFilteredMenuItem
      replace tBracket with empty in tFilteredMenuItem
      put empty into tExistingStyle
      repeat for each item j in tMarkCodes
        if char 1 to t2 of tFilteredMenuItem is j then
          put j into tExistingStyle
          exit repeat
        end if
      end repeat
       
      switch tExistingStyle
      case empty
        --add checkbox chars
        put 0 into tSpecialCharacters
        put true into tNotHadBracket
        repeat for each char c in tMenuItem
          switch
          case c is "(" and tNotHadBracket
            add 1 to tSpecialCharacters
            put false into tNotHadBracket
            break
          default
            exit repeat
            break
          end switch
        end repeat
        if tUnicode then multiply tSpecialCharacters by 2
        if tSpecialCharacters is not 0 then
          put tCheck after char tSpecialCharacters of tMenuItem
        else put tCheck before tMenuItem
        break
      case tCheck
      case tUnCheck
        --if already checkbox then leave alone
        next repeat
        break
      case tRadio
      case tUnRadio
        --if radio button then change to checkbox
        put offset(tExistingStyle,tMenuItem) into tOffset
        put tCheck into char tOffset to (tOffset + tAdd) of tMenuItem
        break
      end switch
      put tMenuItem into item 2 of line i of gREVMMMenuItems
      put revUniUpdateLine(tMenuItem, item 3 of line i of gREVMMMenuItems, tText) into tText
    end repeat
    break
     
     
  case "Diamond"
    --make the selected menu items radio buttons
    repeat for each item i in tHilitedLines
      put item 2 of line i of gREVMMMenuItems into tMenuItem
      put tMenuItem into tFilteredMenuItem
      replace tTab with empty in tFilteredMenuItem
      replace tBracket with empty in tFilteredMenuItem
      put empty into tExistingStyle
      repeat for each item j in tMarkCodes
        if char 1 to t2 of tFilteredMenuItem is j then
          put j into tExistingStyle
          exit repeat
        end if
      end repeat
       
      switch tExistingStyle
      case empty
        --add radio btn chars
        put 0 into tSpecialCharacters
        put true into tNotHadBracket
        repeat for each char c in tMenuItem
          switch
          case c is "(" and tNotHadBracket
            add 1 to tSpecialCharacters
            put false into tNotHadBracket
            break
          default
            exit repeat
            break
          end switch
        end repeat
        if tUnicode then multiply tSpecialCharacters by 2
        if tSpecialCharacters is not 0 then
          put tRadio after char tSpecialCharacters of tMenuItem
        else put tRadio before tMenuItem
        break        
      case tRadio
      case tUnRadio
        --if already checkbox then leave alone
        next repeat
        break
      case tCheck
      case tUncheck
        --if checkbox then change to radio button
        put offset(tExistingStyle,tMenuItem) into tOffset
        put tRadio into char tOffset to (tOffset + tAdd) of tMenuItem
        break
      end switch
      put tMenuItem into item 2 of line i of gREVMMMenuItems
      put revUniUpdateLine(tMenuItem, item 3 of line i of gREVMMMenuItems, tText) into tText
    end repeat
    break
  end switch
   
  --update button contents
  set the text of gREVActiveMenuButton to tText
  put tText into btn "Preview"     
  revUpdateField tUnicode
  set the hilitedLines of fld "Menu Items" to tHilitedLines
  set the scroll of fld "Menu Items" to tScroll
  send "mouseUp" to fld "Menu Items" in 10 milliseconds
  unlock screen
end menuPick
