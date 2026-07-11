Script "stack_SQLite_Sampler_field_id_1193"

/*
# Name: field "Users" of card "Update Data" of stack "SQLite Sampler"
# ID: field id 1193 of card id 1108 of stack "SQLite Sampler"
# Hash: 4zpTA82TlKoQDHZ9YElFMw==
*/


on selectionChanged
  global gConID
  
  --> THIS HUNK OF CODE HAS NOTHING TO DO WITH SQLlite
  --> IT ONLY HELPS TO FIGURE OUT WHAT TABLE CELL YOU JUST CLICKED ON
  if the lockText of me is false then exit to top
  put word 2 of the clickLine into tLineNum
  put item 1 of the clickLoc into tXLoc
  
  subtract the left of me from tXLoc
  put the tabStops of me into tTabStops
  
  --> MAKE SURE THE LAST ITEM IN TABSTOPS IS > TXLOC
  --> JUST IN CASE THE TABSTOPS HAVE ONLY 1 ITEM
  --> CREATE tTabStops ITEMS
  repeat until last item of tTabStops > tXLoc
    put last item of tTabStops - item -2 of tTabStops into tIncrement
    put "," & last item of tTabStops + tIncrement after tTabStops
  end repeat
  put 1 into x
   
  repeat while item x of tTabStops < tXLoc
    add 1 to x
  end repeat 
  
  set itemDel to tab
  put item x of line tLineNum of me into tClickedText
  put item 1 of line tLineNum of me into tUserID
  
  --> BEGIN TO CREATE SQL STRING
  
  switch x
  case "1" --> userID
    answer warning "You may not change a Primary Key!"
    exit to top
    break
  case "2" --> name
    put "name" into tColumnToUpdate
    break
  case "3" --> email
    put "email" into tColumnToUpdate
    break
  case "4" --> emailList
    put "emailList" into tColumnToUpdate
    break
  end switch
  
  ask "New value for " & tColumnToUpdate &":" with tClickedText
  if it is empty or the result is "Cancel" then exit to top
  put "'" & cleanSQL(it) & "'" into tNewValue
  
  put "UPDATE users SET " & tColumnToUpdate & "=" & tNewValue & " WHERE userID=" & tUserID into tSQL
  put revdb_execute(gConID,tSQL) into tTmp
  
  handleRevDBerror tTmp
  if the result is not empty then 
    answer warning the result
    exit selectionChanged
  end if
  
  answer information "Number of rows changed: " & tTmp
  send mouseUp to btn "Refresh Table"
  
end selectionChanged

function cleanSQL pSQL
  --> THIS ESCAPES THE QUOTE PROBLEM IN SQL
  replace "'" with "''" in pSQL
  replace quote with quote & quote in pSQL
  --> THIS ESCAPES THE tab AND cr DELIMITERS
  replace cr with "*CR*" in pSQL
  replace tab with "*TAB*" in pSQL
  return pSQL
end cleanSQL
