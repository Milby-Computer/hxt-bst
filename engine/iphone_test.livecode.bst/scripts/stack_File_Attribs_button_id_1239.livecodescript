Script "stack_File_Attribs_button_id_1239"

/*
# Name: button "Test SQLite" of card "Externals" of stack "File Attribs"
# ID: button id 1239 of card id 1222 of stack "File Attribs"
# Hash: NN3/n5ND9NLUjWMgsFX2aw==
*/


on mouseUp
   local tDbFile
   put specialFolderPath("Documents") & slash & "mydl.sqlite" into tDbFile
   
   local tId
   put revdb_connect("sqlite", tDbFile,,,,) into tId
   put "Connect: " & tId & return after field 1
   if tId is not an integer then
      exit mouseUp
   end if
   get revdb_execute(tId, "DROP TABLE test")
   get revdb_execute(tId, "CREATE TABLE test(a NUMERIC, b BLOB)")
   put "Create:" && it & return after field 1
   
   if 1 then
      local tArray
      put "Mark" into tArray[1]
      put "abc" into tArray[2]
      get revdb_execute(tId, "INSERT INTO test(a, b) VALUES (:1, :2)", "tArray")
   else
      local tName, tData
      put "Mark" into tName
      put "abc" into tData
      get revdb_execute(tId, "INSERT INTO test(a, b) VALUES (:1, :2)", "tName", "*btData")
   end if
   put "Insert:" && it & return after field 1
   
   local tCursor
   put revQueryDatabase(tId, "SELECT * FROM test") into tCursor
   put "Query:" && tCursor & return after field 1
   
   local tA, tB
   put revDatabaseColumnNumbered(tCursor, 1) into tA
   put revDatabaseColumnNumbered(tCursor, 2) into tB
   
   put "Result:" && tA, tB & return after field 1
   
   revCloseCursor tCursor
   
   get revdb_disconnect(tId)
end mouseUp
