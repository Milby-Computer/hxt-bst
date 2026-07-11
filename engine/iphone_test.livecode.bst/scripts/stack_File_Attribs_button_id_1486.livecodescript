Script "stack_File_Attribs_button_id_1486"

/*
# Name: button "Print" of card "PDF Printing" of stack "File Attribs"
# ID: button id 1486 of card id 1474 of stack "File Attribs"
# Hash: Wqh8ssFKfP4hZ+hgv38EfQ==
*/


on mouseUp
   local tRoot
   put "G:/Scratch" into tRoot
   if there is no folder tRoot then
      put "C:/Scratch" into tRoot
   end if
   if there is no folder tRoot then
      put specialFolderPath("documents") into tRoot
   end if
   local tOptions
   put "Custom Print Test" into tOptions["Creator"]
   open printing to pdf tRoot & "/test_output.pdf" with options tOptions
   local tTest = "print"
   if tTest is "linktype" then
      local tUri, tAnchor
      put "http://www.runrev.com" into tUri
      put "anchor 1" into tAnchor
      set the width of the templatefield to 200
      create group
      set the name of it to "tempgroup"
      create field in group "tempgroup"
      set the name of it to "auto:uri"
      set the topleft of it to 50,50
      set the text of it to "auto:" && tUri
      create field in group "tempgroup"
      set the name of it to "auto:anchor"
      set the topleft of it to the bottomleft of field "auto:uri"
      set the text of it to "auto:" && tAnchor
      create field in group "tempgroup"
      set the name of it to "url:uri"
      set the topleft of it to the bottomleft of field "auto:anchor"
      set the text of it to "url:" && tUri
      create field in group "tempgroup"
      set the name of it to "anchor:anchor"
      set the topleft of it to the bottomleft of field "url:uri"
      set the text of it to "anchor:" && tAnchor
      create field in group "tempgroup"
      set the name of it to "anchor:uri"
      set the topleft of it to the bottomleft of field "anchor:anchor"
      set the text of it to "anchor:" && tUri
      create field in group "tempgroup"
      set the name of it to "url:anchor"
      set the topleft of it to the bottomleft of field "anchor:uri"
      set the text of it to "url:" && tAnchor
      
      print this card into rect (the rect of this card)
      print anchor tUri at 0, 0
      print anchor tAnchor at ((the width of this card) / 2), ((the height of this card) / 2)
      
      print link to tUri with rectangle (the rect of field "auto:uri")
      print link to tAnchor with rectangle (the rect of field "auto:anchor")
      print link to url tUri with rectangle (the rect of field "url:uri")
      print link to anchor tAnchor with rectangle (the rect of field "anchor:anchor")
      print link to url tAnchor with rectangle (the rect of field "url:anchor")
      print link to anchor tUri with rectangle (the rect of field "anchor:uri")
      delete group "tempgroup"
   else if tTest is "bookmark" then
      local tOutline = "Section 1,1,closed/Section 2,1,closed/Section 2.1,2,open/Section 2.2,2,closed/Section 2.2.1,3,open/Section 3,1,open"
      --      print bookmark "unicode test"
      --      repeat for each line tUnicode in uniDecode(the unicodetext of field "unicode", "utf8")
      --         print bookmark "line" with level 2
      --         print bookmark "(native)" && uniDecode(uniEncode(tUnicode, "utf8"), "native") with level 3
      --         print unicode bookmark uniEncode("(unicode) ", "native") & uniencode(tUnicode, "utf8")
      --      end repeat
      replace "/" with return in tOutline
      repeat for each line tEntry in tOutline
         print this card
         print bookmark (item 1 of tEntry) with level (item 2 of tEntry) initially (item 3 of tEntry)
         print bookmark ((item 1 of tEntry) && "- Field 1") with level ((item 2 of tEntry) + 1) at (the topleft of field 1)
         print bookmark ((item 1 of tEntry) && "- Field 2") at (the topleft of field 2)
         print break
      end repeat
   else if tTest is "print" then
      print this card
   else if tTest is "link" then
      local tIndex, tNextIndex, tPages
      put 1 into tIndex
      local tRects
      local tPWidth, tPHeight
      if the hilite of button "Landscape" then
         set the printPaperOrientation to "landscape"
      else
         set the printPaperOrientation to "portrait"
      end if
      put item 1 of the printPaperSize into tPWidth
      put item 2 of the printPaperSize into tPHeight
      put empty into tRects
      put           0,            0, tPWidth / 2, tPHeight / 2 into tRects[1]
      put tPWidth / 2,            0,     tPWidth, tPHeight / 2 into tRects[2]
      put           0, tPHeight / 2, tPWidth / 2,     tPHeight into tRects[3]
      put tPWidth / 2, tPHeight / 2,     tPWidth,     tPHeight into tRects[4]
      put 3 into tPages
      repeat with tIndex = 1 to tPages
         repeat for each line tKey in (the keys of tRects)
            print this card into rect tRects[tKey]
         end repeat
         print anchor "test dest" && tIndex at 36, 36
         if tIndex is tPages then
            put 1 into tNextIndex
         else
            put tIndex + 1 into tNextIndex
         end if
         print link to "test dest" && tNextIndex with rectangle tRects[line -1 of (the keys of tRects)]
         print break
      end repeat
   end if
   close printing
   if the result is not empty then
      answer the result
   else
      launch url ("file://" & tRoot & "/test_output.pdf")
   end if
end mouseUp
