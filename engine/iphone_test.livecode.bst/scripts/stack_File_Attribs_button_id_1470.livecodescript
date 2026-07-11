Script "stack_File_Attribs_button_id_1470"

/*
# Name: button "Test MySQL" of card "Externals" of stack "File Attribs"
# ID: button id 1470 of card id 1222 of stack "File Attribs"
# Hash: ulFsZqFW5y8/QvE0yszskA==
*/


on mouseUp
   local tId
   put revdb_connect("mysql", "michael.on-rev.com", "michael_test", "michael_test", "runlogtest", false) into tId
   put "Connect: " & tId & return after field 1
   if tId is not an integer then
      exit mouseUp
   end if
   get revdb_execute(tId, "DROP TABLE ios_test")
   get revdb_execute(tId, "CREATE TABLE ios_test(a NUMERIC, b BLOB)")
   put "Create:" && it & return after field 1
   
   if 1 then
      local tArray
      put "Mark" into tArray[1]
      put "abc" into tArray[2]
      get revdb_execute(tId, "INSERT INTO ios_test(a, b) VALUES (:1, :2)", "tArray")
   else
      local tName, tData
      put "Mark" into tName
      put "abc" into tData
      get revdb_execute(tId, "INSERT INTO ios_test(a, b) VALUES (:1, :2)", "tName", "*btData")
   end if
   put "Insert:" && it & return after field 1
   
   local tCursor
   put revQueryDatabase(tId, "SELECT * FROM ios_test") into tCursor
   put "Query:" && tCursor & return after field 1
   
   local tA, tB
   put revDatabaseColumnNumbered(tCursor, 1) into tA
   put revDatabaseColumnNumbered(tCursor, 2) into tB
   
   put "Result:" && tA, tB & return after field 1
   
   revCloseCursor tCursor
   
   get revdb_disconnect(tId)
end mouseUp
