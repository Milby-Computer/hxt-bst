Script "stack_File_Selector_field_id_1015"

/*
# Name: field "Directory" of card "File Selector Card" of stack "File Selector"
# ID: field id 1015 of card id 1002 of stack "File Selector"
# Hash: aJKD+DC2eitnaFxwSY49JQ==
*/


on closeField
  local olddir, newdir
  put the directory into olddir
  put me into newdir
  if newdir contains "/" then
    repeat until the last char of newdir is "/"
      delete last char of newdir
    end repeat
  end if
  set the directory to newdir
  if the result is not empty then
    answer "Can't set to that directory."
    set the directory to olddir
    put olddir into me
  else refresh
end closeField

on openField
  select after last char of me
end openField
