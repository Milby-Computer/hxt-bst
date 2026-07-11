Script "stack_LCLibraryTest_button_id_1004"

/*
# Name: button "Button" of card id 1002 of stack "LCLibraryTest"
# ID: button id 1004 of card id 1002 of stack "LCLibraryTest"
# Hash: prr12v1k7vhupItrtv/C9Q==
*/


on mouseUp
   set the itemDelimiter to slash
   local tPath
   put item 1 to -4 of the filename of stack "home" into tPath
   put tPath & "/_build/mac/Debug" into tPath
   
   put field 1 into url ("binfile:~/Desktop/testlclibscript.lc")
   get shell(tPath & "/lc-compile -output ~/Desktop/testlclibscript.lcm ~/Desktop/testlclibscript.lc")
   put it into field 2
   
   if it is empty or it contains "Generated module" then
      load extension "~/Desktop/testlclibscript.lcm"
      answer the result
      answer myTest(100)
      unload extension "~/Desktop/testlclibscript.lcm"
   end if
   
end mouseUp
