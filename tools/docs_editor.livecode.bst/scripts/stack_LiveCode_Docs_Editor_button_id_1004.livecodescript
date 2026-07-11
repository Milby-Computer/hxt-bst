Script "stack_LiveCode_Docs_Editor_button_id_1004"

/*
# Name: button "main tabs" of card "card id 1002" of stack "LiveCode Docs Editor"
# ID: button id 1004 of card id 1002 of stack "LiveCode Docs Editor"
# Hash: LtUSqk9+lPCUtO2/Ur/1Uw==
*/


on menuPick pItemName   
   lock screen
   hide group "xml editing"
   hide group "dictionary display"
   hide group "xml source"
   
   switch pItemName
      case "Editing"
         show group "xml editing"
         break
      case "Dictionary Display"
         set the htmlText of field "dictionary display" to empty
         put buildOldXML() into tDictionaryXML
         put revDocumentationFormatXML(tDictionaryXML, "") into tDisplay
         
         ## Show links
         replace "<command" with "<a><command" in tDisplay
         replace "</command>" with "</command></a>" in tDisplay
         
         replace "<function" with "<a><function" in tDisplay
         replace "</function>" with "</function></a>" in tDisplay
         
         replace "<message" with "<a><message" in tDisplay
         replace "</message>" with "</message></a>" in tDisplay
         
         replace "<property" with "<a><property" in tDisplay
         replace "</property>" with "</property></a>" in tDisplay
         
         replace "<operator" with "<a><operator" in tDisplay
         replace "</operator>" with "</operator></a>" in tDisplay
         
         replace "<keyword" with "<a><keyword" in tDisplay
         replace "</keyword>" with "</keyword></a>" in tDisplay
         
         replace "<constant" with "<a><constant" in tDisplay
         replace "</constant>" with "</constant></a>" in tDisplay
         
         replace "<object" with "<a><object" in tDisplay
         replace "</object>" with "</object></a>" in tDisplay
         
         replace "<control_st" with "<a><control_st" in tDisplay
         replace "</control_st>" with "</control_st></a>" in tDisplay
         
         replace "<glossary" with "<a><glossary" in tDisplay
         replace "</glossary>" with "</glossary></a>" in tDisplay
         
         set the itemdel to "/"
         put tDisplay into URL ("file:/Users/Ben 1/Desktop/html.html")
         set the htmlText of field "dictionary display" to tDisplay
         show group "dictionary display"
         break
      case "XML Source"
         put buildXML() into tXMLSource
         put tXMLSource into field "xml source text"
         show group "xml source"
         break
   end switch
end menuPick
