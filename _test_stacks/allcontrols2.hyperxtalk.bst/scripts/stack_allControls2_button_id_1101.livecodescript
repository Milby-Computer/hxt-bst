Script "stack_allControls2_button_id_1101"

/*
# Name: button "Button" of card id 1002 of stack "allControls2"
# ID: button id 1101 of card id 1002 of stack "allControls2"
# Hash: Sb6OIgMHQ0wC19rkJGNpVQ==
*/


on MouseUp
   local tDBID
   put revOpenDatabase("mysql", "sql.freedb.tech", "freedb_mysqltest16", "freedb_mysqltest16", "pZafBy%bK4AD8DH") into tDBID
   answer tDBID
   if (tDBID is a number) then
      revCloseDatabase tDBID
   end if
   
   local tSQLitePath
   if (the platform = "macOS") then
      put "/Users/emily-elizabethhoward/Downloads/mydb.sqlite" into tSQLitePath
   else
      put "c:\Users\user\mydb.sqlite" into tSQLitePath
   end if
   
   put revOpenDatabase("sqlite", tSQLitePath) into tDBID
   answer tDBID
   if (tDBID is a number) then
      revCloseDatabase tDBID
   end if
end MouseUp
