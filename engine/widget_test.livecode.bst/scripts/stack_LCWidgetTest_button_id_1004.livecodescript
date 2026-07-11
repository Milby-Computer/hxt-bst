Script "stack_LCWidgetTest_button_id_1004"

/*
# Name: button "Button" of card id 1002 of stack "LCWidgetTest"
# ID: button id 1004 of card id 1002 of stack "LCWidgetTest"
# Hash: 2FQ8det3o3umqV9jbFUwxw==
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
      try
         delete the last widget
      end try
      unload extension "~/Desktop/testlclibscript.lcm"
      load extension "~/Desktop/testlclibscript.lcm"
      answer the result
      create widget as "bar.test"
      set the rect of it to the rect of graphic 1
   end if
   
end mouseUp
