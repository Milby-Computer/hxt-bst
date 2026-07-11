Script "stack_LiveCode_Docs_Editor_card_id_1002"

/*
# Name: card "card id 1002" of stack "LiveCode Docs Editor"
# ID: card id 1002 of stack "LiveCode Docs Editor"
# Hash: HJNApKPW/ZxThgnzDwA6Vw==
*/


local sTreeID

on preopencard
   clearfields
end preopencard

on loadXML
   local tXMLFile, tXMLData
   put field "file" into tXMLFile
   put url ("file:" & tXMLFile) into tXMLData
   
   put tXMLData into field "xml source text" of group "xml source"
   
   ## Show the dictionary display
   
   put revCreateXMLTree(tXMLData, false, true, false) into sTreeID
   if sTreeID is not a number then
      breakpoint
   end if
end loadXML

on processXML   
   local tTree, tDescriptionStart, tDescriptionNames, tChildNames
   put getTreeID() into tTree
   
   displayFormattedTagContents "/doc/legacy_id","legacy_id"
   displayFormattedTagContents "/doc/name","name"
   displayFormattedTagContents "/doc/type","type"
   
   ## Basics
   displayFormattedTagList "/doc/syntax", "example", "syntax"
   displayFormattedTagList "/doc/synonyms", "synonym", "synonyms"
   displayFormattedTagContents "/doc/summary", "summary"
   --displayFormattedTagList "/doc/examples", "example", "examples"
   displayExamplesList "/doc/examples", "example"
   
   ## History
   displayFormattedTagContents "/doc/history/introduced", "introduced", true
   displayFormattedTagList "/doc/history", "changed", "changed"
   displayFormattedTagContents "/doc/history/deprecated", "deprecated", true
   displayFormattedTagContents "/doc/history/removed", "removed", true
   displayFormattedTagContents "/doc/history/experimental", "experimental", true
   displayFormattedTagContents "/doc/history/nonexperimental", "nonexperimental", true
   
   ## Properties
   displayTagListOptions "/doc/objects", "objects"
   displayTagListOptions "/doc/platforms", "supported_platforms"
   displayTagListOptions "/doc/classes", "classes"
   displayTagListOptions "/doc/security", "security_settings"
   
   ## Classifications
   displayFormattedTagList "/doc/classification", "category", "categories"
   displayTagListOptions2 "/doc/classification", "concept", "concepts"
   
   ## References
   displayFormattedTagList "/doc/references", "function", "functions"
   displayFormattedTagList "/doc/references", "command", "commands"
   displayFormattedTagList "/doc/references", "lesson", "lessons"
   displayFormattedTagList "/doc/references", "link", "links"
   displayFormattedTagList "/doc/references", "keyword", "keywords"
   displayFormattedTagList "/doc/references", "message", "messages"
   displayFormattedTagList "/doc/references", "property", "properties"
   displayFormattedTagList "/doc/references", "operator", "operators"
   displayFormattedTagList "/doc/references", "control_st", "control_sts"
   
   ## Description
   ## Is this an old or new description format
   put revXMLChildNames(tTree,"/doc/description",comma,,true) into tDescriptionNames
   
   if tDescriptionNames contains "overview" or tDescriptionNames contains "value" or tDescriptionNames contains "comments" then
      ## New format
      ## Overview
      displayFormattedTagContents "/doc/description/overview", "overview"
      
      ## Parameters
      put revXMLChildNames(tTree,"/doc/description/parameters",comma,,true) into tChildNames
      if tChildNames is empty then
         put empty into field "parameters"
      else
         --         repeat for each item tChild in tChildNames
         --            if tChild contains "parameter" then
         --               put revXMLChildContents(tTree,"/doc/description/parameters/" & tChild,":" ,comma, false, -1) into tParameterContents
         --               split tParameterContents by comma and ":"
         --               put tParameterContents["name"] & tab & tParameterContents["description"] & return after tParameters
         --            end if
         --         end repeat
         --         delete the last char of tParameters
         --         put tParameters into field "parameters"
         --displayFormattedTagContents "/doc/description/parameters", "parameters"
         displayPartialXML "/doc/description/parameters", "parameter", "parameters"
      end if 
      
      ## Value
      displayFormattedTagContents "/doc/description/value", "value"
      
      ## Comments
      displayFormattedTagContents "/doc/description/comments", "comments"
   else
      ## Old style description
      displayFormattedTagContents "/doc/description", "description"
   end if
end processXML

function buildXML
   local tXMLData,  tFunctions, tCommands, tLessons, tLinks, tProperties, tOperators, tKeywords, tMessages, tControlStructures
   
   put "<doc>" & return after tXMLData
   
   put tab & getFormattedTagValue("legacy_id") & return after tXMLData
   put tab & getFormattedTagValue("name") & return after tXMLData
   put tab & getFormattedTagValue("type") & return after tXMLData
   
   put return after tXMLData   
   
   ## Basics
   put tab & "<syntax>" & return after tXMLData
   put getTagList("example","syntax") after tXMLData
   put tab & "</syntax>" & return after tXMLData
   
   put return after tXMLData   
   
   put tab & "<synonyms>" & return after tXMLData
   put getTagList("synonym","synonyms") after tXMLData
   put tab & "</synonyms>" & return after tXMLData
   
   put return after tXMLData   
   
   put tab & getFormattedTagValue("summary") & return after tXMLData
   
   put return after tXMLData   
   
   put tab & "<examples>" & return after tXMLData
   put getExampleTagList("example","examples") after tXMLData
   put tab & "</examples>" & return after tXMLData
   
   ## History
   put return after tXMLData
   put tab & "<history>" & return after tXMLData
   put tab & tab & getTagValueWithAttributes("introduced","version") & return after tXMLData
   put tab & tab & getTagValueWithAttributes("deprecated","version") & return after tXMLData
   put tab & tab & getTagValueWithAttributes("removed","version") & return after tXMLData
   put tab & tab & getTagListWithAttributes("changed","changed","version") & return after tXMLData
   put tab & tab & getTagValueWithAttributes("experimental","version") & return after tXMLData
   put tab & tab & getTagValueWithAttributes("nonexperimental","version") & return after tXMLData
   put tab & "</history>" & return after tXMLData
   
   put return after tXMLData
   
   ## Properties
   put tab & "<objects>" & return after tXMLData
   put getTagList(,"objects") after tXMLData
   put tab & "</objects>" & return after tXMLData
   
   put return after tXMLData
   
   put tab & "<platforms>" & return after tXMLData
   put getTagList(,"supported_platforms") after tXMLData
   put tab & "</platforms>" & return after tXMLData
   
   put return after tXMLData
   
   put tab & "<classes>" & return after tXMLData
   put getTagList(,"classes") after tXMLData
   put tab & "</classes>" & return after tXMLData
   
   put return after tXMLData
   
   put tab & "<security>" & return after tXMLData
   put getTagList(,"security_settings") after tXMLData
   put tab & "</security>" & return after tXMLData
   
   put return after tXMLData
   
   ## Classifications
   put return after tXMLData
   
   put tab &  "<classification>" & return after tXMLData
   put getTagList("category","categories") after tXMLData
   put getTagList("concept","concepts") after tXMLData
   put tab &  "</classification>" & return after tXMLData
   
   put return after tXMLData
   
   ## References
   put tab & "<references>" & return after tXMLData
   put getTagListWithAttributes("function","functions","tag") into tFunctions
   put getTagListWithAttributes("command","commands","tag") into tCommands
   put getTagListWithAttributes("lesson","lessons","tag") into tLessons
   put getTagListWithAttributes("link","links","tag") into tLinks
   put getTagListWithAttributes("property","properties","tag") into tProperties
   put getTagListWithAttributes("operator","operators","tag") into tOperators
   put getTagListWithAttributes("keyword","keywords","tag") into tKeywords
   put getTagListWithAttributes("message","messages","tag") into tMessages
   put getTagListWithAttributes("control_st","control_sts","tag") into tControlStructures
   
   if tFunctions is not empty then put tabFormat(tFunctions,2) & return after tXMLData
   if tCommands is not empty then put tabFormat(tCommands,2) & return after tXMLData
   if tLessons is not empty then put tabFormat(tLessons,2) & return after tXMLData
   if tLinks is not empty then put tabFormat(tLinks,2) & return after tXMLData
   if tProperties is not empty then put tabFormat(tProperties,2) & return after tXMLData
   if tOperators is not empty then put tabFormat(tOperators,2) & return after tXMLData
   if tKeywords is not empty then put tabFormat(tKeywords,2) & return after tXMLData
   if tMessages is not empty then put tabFormat(tMessages,2) & return after tXMLData
   if tControlStructures is not empty then put tabFormat(tControlStructures,2) & return after tXMLData
   put tab & "</references>" & return after tXMLData
   
   put return after tXMLData
   
   ## Description  
   if field "description" is empty then
      ## New Style
      
      put tab & "<description>" & return after tXMLData
      put tab & getFormattedTagValue("overview") & return after tXMLData
      put return after tXMLData   
      //put tab & tab & "<parameters>" & return after tXMLData
      //put getTagList("parameter","parameters") after tXMLData
      //put tab & tab & "</parameters>" & return after tXMLData
      put tab & tab & "<parameters>" & return after tXMLData
      put field "parameters" after tXMLData
      put tab & tab & "</parameters>" & return after tXMLData
      
      --## For now use old form for parameters
      --put tab & getFormattedTagValue("parameters") & return after tXMLData
      
      put return after tXMLData
      put tab & getFormattedTagValue("value") & return after tXMLData
      put tab & getFormattedTagValue("comments") & return after tXMLData
      put tab & "</description>" & return after tXMLData
   else
      ## Old style
      put tab & getFormattedTagValue("description") & return after tXMLData
   end if
   
   put "</doc>"after tXMLData
   return tXMLData
end buildXML

function buildOldXML
   local tXML
   put buildXML() into tXML
   put libDocumentationOldFormat(tXML) into tXML
   return tXML
end buildOldXML

function buildOldXML1
   local tXMLData, tFunctions, tCommands, tLessons, tLinks, tKeywords, tHilitedLines, tHTMLText
   
   put "<doc>" & return after tXMLData
   put tab & getTagValue("name","name") & return after tXMLData
   put tab & getTagValue("type","type") & return after tXMLData  
   put tab & getTagValue("syntax","syntax") & return after tXMLData
   put tab & "<objects>" & getTagListOld(,"objects") & "</objects>" & return after tXMLData
   put tab & "<synonyms>" & getTagListOld(,"synonyms") & "</synonyms>" & return after tXMLData
   put tab & "<categories>" & getTagListOld("category","categories") & "</categories>" & return after tXMLData
   
   put tab & "<related>"  & return after tXMLData
   put getTagListOld("docRef","functions") into tFunctions
   put getTagListOld("docRef","commands") into tCommands
   put getTagListOld("docRef","lessons") into tLessons
   put getTagListOld("docRef","links") into tLinks
   put getTagListOld("docRef","keywords") into tKeywords
   
   if tFunctions is not empty then put tFunctions & return after tXMLData
   if tCommands is not empty then put tCommands & return after tXMLData
   if tLessons is not empty then put tLessons & return after tXMLData
   if tLinks is not empty then put tLinks & return after tXMLData
   if tKeywords is not empty then put tKeywords & return after tXMLData
   put tab & "</related>"  & return after tXMLData
   
   put getOldTagValueWithAttributes("introduced","version") & return after tXMLData
   put getOldTagValueWithAttributes("deprecated","version") & return after tXMLData
   put getOldTagValueWithAttributes("removed","version") & return after tXMLData
   put getOldTagValueWithAttributes("changed","version") & return after tXMLData
   
   ## Platforms
   put the hilitedLines of field "supported_platforms" into tHilitedLines
   repeat for each item tLineNum in tHilitedLines
      put "<" & line tLineNum of field "supported_platforms" & "support=" & quote & "true" & quote & "/>" & return after tXMLData
   end repeat
   put "<platform warning =" & quote & "false" & quote & "/>" & return after tXMLData
   
   put getOldTagValue("summary","summary") & return after tXMLData
   put getTagValue("example","examples") & return after tXMLData
   
   ## Description   
   if field "description" is empty then
      --      put"<description><p>" & field ("overview") & "</p></description>" after tXMLData   
      --      put "<parameters><p>" & field "parameters" & "</p></parameters>" after tXMLData
      --      put "<value><p>" & field "value" & "</p></value>" after tXMLData
      --      put "<comments><p>" & field "comments" & "</p></comments>" after tXMLData
      put"<description><p>" & field ("overview") after tXMLData   
      put "<p></p><p><b>Parameters:</b></p><p>" & the htmlText of field "parameters" & "</p>" after tXMLData
      put "<p></p><p><b>Value:</b></p><p>" & the htmlText of field "value" & "</p>" after tXMLData      
      put "<p></p><p><b>Comments:</b></p><p>" & the htmlText of field "comments" & "</p>" after tXMLData
      put "</description>" after tXMLData
   else
      --put"<description><p>" & the htmltext of field ("description") & "</p></description>" after tXMLData   
      ## Need the htmlText without a refs
      put the htmltext of field ("description") into tHTMLText
      
      replace "<" with return & "<"  in tHTMLText
      replace ">" with ">" & return  in tHTMLText
      replace return & return with return in tHTMLText
      
      repeat with a = 1 to the number of lines in tHTMLText
         if char 1 to 7 of line a of tHTMLText is "<a name" then
            put empty into line a of tHTMLText
            put empty into line a+2 of tHTMLText
         end if
      end repeat
      
      replace (return & "<") with "<" in tHTMLText
      replace (">" & return) with ">"  in tHTMLText
      
      put"<description>" & tHTMLText & "</description>" after tXMLData   
   end if
   
   put "</doc>"after tXMLData
   return tXMLData
end buildOldXML1

## Display Functions
on displayFormattedTagContents pNodePath, pTag
   local tTree, tNodeExists, tAttributes, tContents, tChildTags, x, tWordCount, tTextStyleList, tTagContents
   put sTreeID into tTree
   
   put revXMLNodeContents(tTree, pNodePath) into tNodeExists
   if tNodeExists contains "xmlerr" then
      set the htmlText of field pTag to empty
      exit displayFormattedTagContents
   end if
   
   ## First get the attributes
   put revXMLAttributes(tTree,pNodePath,comma,return) into tAttributes
   repeat for each line tAttribute in tAttributes
      put item 2 of tAttribute & tab into tContents
   end repeat
   
   put revXMLChildNames(tTree,pNodePath,comma,,true, true) into tChildTags
   
   put 0 into x
   put 0 into tWordCount
   put empty into tTextStyleList
   
   if tChildTags is not empty then
      repeat for each item tFormattingTag in tChildTags                  
         if tFormattingTag is empty then
            add 1 to x
            put revXMLNodeContents(tTree, pNodePath & "/[" & x & "]") into tTagContents
            replace "." with ". " in tTagContents
            put tTagContents after tContents
         else            
            put pNodePath & "/" & tFormattingTag into tNodePath
            
            put revXMLAttributes(tTree,pNodePath,comma,return) into tAttributes
            
            put getTagFormatting(tFormattingTag, tNodePath, tTagText)  into tTagContents
            --replace "." with ". " in tTagContents
            put tTagContents after tContents
         end if
      end repeat
      
      if the last char of tChildTags is comma then
         add 1 to x
         put revXMLNodeContents(tTree, pNodePath & "/[" & x & "]") into tTagContents
         replace "." with ". " in tTagContents
         put tTagContents after tContents
      end if
   else
      put revXMLNodeContents(tTree, pNodePath) after tContents
   end if
   
   set the htmlText of field pTag to tContents
   
   --   ## Tag content styling
   --   put revXMLChildContents(tTree, pNodePath, tab ,return, true, -1) into tFormattingContents
   --   if tChildTags is not empty then
   --      repeat for each item tFormattingTag in tChildTags   
   --         put pNodePath & "/" & tFormattingTag into tNodePath
   --         put tFormattingTag & tab & revXMLChildNames(tTree, tNodePath, comma ,, true,true) & return after tAllFormattingContents
   --      end repeat
   --   end if
   
   --   put 0 into tWordCount
   --   repeat for each line tLine in tAllFormattingContents
   --      set the itemDel to tab
   --      put item 1 of tLine into tChildTag
   
   --      put item 2 of tLine into tContentsList
   --      set the itemDel to comma
   
   --      put pNodePath & "/" & tChildTag into tNodePath
   --      repeat for each item tTag in tContentsList
   --         put tNodePath & "/" & tTag into tNodeTagPath
   --         put revXMLNodeContents(tTree, tNodeTagPath) into tTagContents
   
   --         put revXMLAttributes(tTree,tNodeTagPath,":",comma) into tTagAttributes
   --         if tTagContents is not empty and tTagContents is not space and tTagContents is not "." then
   --            put tTagContents & return after msg
   --            put tWordCount+1 & tab after tWordTagList
   --            add the number of words of tTagContents to tWordCount
   --            put tWordCount & tab & tTag & tab & tTagAttributes & tab & tTagContents & return after tWordTagList
   --         end if
   --      end repeat
   --   end repeat
   
   --   repeat for each line tTextStyle in tWordTagList
   --      set the itemDel to tab
   --      put item 1 of tTextStyle into tStartWord
   --      put item 2 of tTextStyle into tEndWord
   --      put item 3 of tTextStyle into tStyle
   --      put item 4 of tTextStyle into tTag
   
   --      set the itemDel to "["
   --      delete item -1 of tStyle
   
   --      if tTag is not empty then
   --         delete char 1 to 4 of tTag
   --         put " tag=" & quote & tTag & quote after tStyle
   --      end if
   
   --      if char 2 to -2 of tStyle is not a number  and the length of tStyle is not 1 then
   --         set the linkText of word tStartWord to tEndWord of field pTag to tStyle
   --      end if
   --   end repeat
end displayFormattedTagContents

function getFormattedTagList pNodePath, pTag
   put sTreeID into tTree
   put revXMLChildContents(tTree, pNodePath, tab ,return, true, -1) into tFormattingContents
   put revXMLChildNames(tTree, pNodePath, return,,true) into tChildNames
end getFormattedTagList

function getFormattedTagContents pNodePath, pTag, pShowAttributes
   put sTreeID into tTree
   
   put revXMLChildContents(tTree, pNodePath, "/" ,return, false, 2) into tChildContents
   put revXMLChildNames(tTree,pNodePath,comma,,true, true) into tChildTags
   
   if tChildTags is not empty then
      repeat for each item tFormattingTag in tChildTags
         put pNodePath & "/" & tFormattingTag into tNodePath
         
         put getTagFormatting(tFormattingTag, tNodePath) after tContents
      end repeat
      
      if the last char of tChildTags is comma then
         add 1 to x         
         put revXMLNodeContents(tTree, pNodePath & "/[" & x & "]") into tNodeContents
         ## Allow < and > symbols in the html text
         replace "<" with "&lt;" in tNodeContents
         replace ">" with "&gt;" in tNodeContents
         put tNodeContents after tContents
      end if
   else
      put revXMLNodeContents(tTree, pNodePath) into tNodeContents
      ## Allow < and > symbols in the html text
      replace "<" with "&lt;" in tNodeContents
      replace ">" with "&gt;" in tNodeContents
      put tNodeContents after tContents
   end if
   
   ## EJB Testing
   
   if pTag is "p" then
      if char 1 to 3 of tContents is not "<p>" and char -4 to -1 of tContents is not "</p>" then
         put "<p>" before tContents
         put "</p>" after tContents
      end if
   end if
   
   --   if the number of lines in tContents is 1 then
   --      if char 1 to 3 of tContents is "<p>" and char -4 to -1 of tContents is "</p>" then
   --         delete char -4 to -1 of tContents
   --         delete char 1 to 3 of tContents
   --      end if
   --   end if
   
   return tContents
end getFormattedTagContents

on displayTagListOptions pNodePath, pField
   put getTreeID() into tTree
   
   put revXMLChildNames(tTree,pNodePath,return,,false) into tChildNames
   
   put empty into tHilitedLines
   if tChildNames is empty then
      set the hilitedLines of field pField to empty
   else
      set the hilitedLines of field pField to empty
      repeat for each line tOption in tChildNames
         put lineOffset(tOption, the text of field pField) & comma after tHilitedLines
         set the itemDel to comma
      end repeat
      delete the last char of tHilitedLines
      set the hilitedLines of field pField to tHilitedLines
   end if 
end displayTagListOptions

on displayTagListOptions2 pNodePath, pTag, pField
   put getTreeID() into tTree
   
   put revXMLChildContents(tTree, pNodePath,":" ,return, true, 0) into tChildContents
   
   put empty into tHilitedLines
   if tChildContents is empty then
      set the hilitedLines of field pField to empty
   else
      repeat for each line tChild in tChildContents
         set the itemDel to ":"
         if char 1 to-4 of item 1 of tChild is pTag then            
            set the itemDel to ":"
            put getFormattedTagContents(pNodePath & "/" & item 1 of tChild, pTag) into tChildValue
            
            put lineOffset(tChildValue, the text of field pField) & comma after tHilitedLines
            set the itemDel to comma
         end if
         set the itemDel to comma
      end repeat
      delete the last char of tHilitedLines
   end if 
   set the hilitedLines of field pField to tHilitedLines
end displayTagListOptions2

on displayFormattedTagList pNodePath, pTag, pField
   put getTreeID() into tTree
   put revXMLChildNames(tTree, pNodePath, return, empty, true, true) into tChildNames
   
   if tChildNames is empty then
      put empty into field pField
   else
      repeat for each line tChild in tChildNames
         if char 1 to-4 of item 1 of tChild is pTag then
            ## First get the attributes
            put revXMLAttributes(tTree,pNodePath & "/" & tChild,comma,return) into tAttributes
            repeat for each line tAttribute in tAttributes
               set the itemDel to comma
               put item 2 of tAttribute into tTagLabel
               
               ## Allow < and > symbols in the html text
               replace "<" with "&lt;" in tTagLabel
               replace ">" with "&gt;" in tTagLabel
               
               put tTagLabel & tab after tTagContents
            end repeat
            
            set the itemDel to ":"
            put getFormattedTagContents(pNodePath & "/" & tChild, pTag) into tChildValue
            put tChildValue & "<br>" after tTagContents
         end if
         set the itemDel to comma
      end repeat
   end if 
   
   set the htmltext of field pField to tTagContents
end displayFormattedTagList

on displayExamplesList pNodePath, pTag
   put getTreeID() into tTree
   
   put revXMLChildNames(tTree, pNodePath, return, empty, true, true) into tChildNames
   
   if tChildNames is empty then
      --put empty into field pField
   else
      put 0 into tExampleNum
      repeat for each line tChild in tChildNames 
         if char 1 to-4 of item 1 of tChild is pTag then    
            put empty into tChildValue
            add 1 to tExampleNum    
         end if
         
         put getFormattedTagContents(pNodePath & "/" & tChild, char 1 to -4 of tChild) after tChildValue
         if there is a field ("example" && tExampleNum) of group "examples" then
            set the htmlText of field ("example" && tExampleNum) of group "examples" to tChildValue
         end if
      end repeat
   end if 
   
   --set the htmltext of field pField to tTagContents
end displayExamplesList

on displayPartialXML pNodePath, pTag
   put getTreeID() into tTree
   
   put revXMLChildNames(tTree, pNodePath, return, empty, true, true) into tChildNames
   
   set the text of field "parameters" to line 2 to -2 of revXMLText(tTree, pNodePath, true)
   
   --set the htmltext of field pField to tTagContents
end displayPartialXML

function getTagFormatting pTagType, pNodePath
   ## Commented out for now to try and fix formatting
   
   put revXMLNodeContents(sTreeID, pNodePath) into tNodeContents
   replace "<" with "&lt;" in tNodeContents
   replace ">" with "&gt;" in tNodeContents
   
   if char 1 to 9 of pTagType is "parameter" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      
      put "<a name=" & quote & "parameter tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 8 of pTagType is "function" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "function tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 7 of pTagType is "message" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "message tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 7 of pTagType is "keyword" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "keyword tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 7 of pTagType is "command" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "command tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 8 of pTagType is "operator" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "operator tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 8 of pTagType is "constant" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "constant tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 6 of pTagType is "object" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "object tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 10 of pTagType is "control_st" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "control_st tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 8 of pTagType is "glossary" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "glossary tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 10 of pTagType is "expression" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "expression tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 8 of pTagType is "property" then
      ## Get the tag attribute
      put revXMLAttributes(sTreeID,pNodePath,comma,return) into tAttributes
      put item 2 of tAttributes into tTagText
      put "<a name=" & quote & "property tag=" & tTagText & quote & quote & ">" & tNodeContents & "</a>" into tFormattedContent
   else if char 1 to 7 of pTagType is "warning" then
      put "<b>Warning! </b>" & getFormattedTagContents(pNodePath, pTagType) into tFormattedContent
   else if char 1 to 4 of pTagType is "note" then
      put "<b>Note: </b>" & getFormattedTagContents(pNodePath, pTagType) into tFormattedContent
   else if char 1 to 7 of pTagType is "cp_note" then
      put "<b>Cross-platform Note: </b>" & getFormattedTagContents(pNodePath, pTagType) into tFormattedContent
   else if char 1 to 6 of pTagType is "change" then
      put "<b>Change: </b>" & getFormattedTagContents(pNodePath, pTagType) into tFormattedContent
   else if char 1 to 3 of pTagType is "tip" then
      put "<b>Tip: </b>" & getFormattedTagContents(pNodePath, pTagType) into tFormattedContent
   else if char 1 to 9 of pTagType is "important" then
      put "<b>Important! </b>" & getFormattedTagContents(pNodePath, pTagType) into tFormattedContent
   else if char 1 to 9 of pTagType is "caution" then
      put "<b>Caution! </b>" & getFormattedTagContents(pNodePath, pTagType) into tFormattedContent
   else if char 1 to 4 of pTagType is "code" then
      --put  "<a name=" & quote & "code tag=" & tTagText & quote & quote & ">" & getFormattedTagContents(pNodePath, pTagType) & "</a>" into tFormattedContent
   else if char 1 of pTagType is "p" and char 1 to 9 of pTagType is not "parameter" and char 1 to 8 of pTagType is not "property" then
      put "<p>" & getFormattedTagContents(pNodePath, pTagType) & "</p>" into tFormattedContent
   else if char 1 of pTagType is "i" then
      put "<i>" & tNodeContents & "</i>" into tFormattedContent
   else if char 1 of pTagType is "u" then
      put revXMLNodeContents(sTreeID, pNodePath) into tNodeContents
      replace "<" with "&lt;" in tNodeContents
      replace ">" with "&gt;" in tNodeContents
      put "<u>" &  tNodeContents & "</u>" into tFormattedContent
   else if char 1 of pTagType is "b" then
      put revXMLNodeContents(sTreeID, pNodePath) into tNodeContents
      replace "<" with "&lt;" in tNodeContents
      replace ">" with "&gt;" in tNodeContents
      put "<b>" &  tNodeContents & "</b>" into tFormattedContent
   else
      --replace "&" with "&amp;" in tNodeContents
      replace "<" with "&lt;" in tNodeContents
      replace ">" with "&gt;" in tNodeContents
      put tNodeContents into tFormattedContent
      --put  revXMLNodeContents(sTreeID, pNodePath) into tFormattedContent
   end if
   return tFormattedContent
end getTagFormatting


## Functions to retrieve edited data
function getTagValueWithAttributes pTag, pAttributeList
   put "<" & pTag into tTagContents
   
   if pAttributeList is not empty then
      repeat with a = 1 to the number of items in pAttributeList
         put space & item a of pAttributeList & "=" & quote after tTagContents
         set the itemDel to tab
         put item a of field pTag & quote after tTagContents
         set the itemDel to comma
      end repeat
   end if
   put ">" after tTagContents
   
   set the itemDel to tab
   put the last item of field pTag of group "xml editing" after tTagContents
   put "</" & pTag & ">" after tTagContents
   return tTagContents
end getTagValueWithAttributes

function getOldTagValueWithAttributes pTag, pAttributeList
   put "<" & pTag into tTagContents
   
   if pAttributeList is not empty then
      repeat with a = 1 to the number of items in pAttributeList
         put space & item a of pAttributeList & "=" & quote after tTagContents
         set the itemDel to tab
         put item a of field pTag & quote after tTagContents
         set the itemDel to comma
      end repeat
   end if
   put "/>" after tTagContents
   return tTagContents
end getOldTagValueWithAttributes

function getFormattedTagValue pTag
   put "<" & pTag & ">"  into tTagContents
   put the htmlText of field pTag of group "xml editing" into tHtmlText
   if the last char of tHTMLText is return then delete the last char of tHTMLText
   
   ## Repeat any empty lines at the end of the text
   repeat until char -7 to -1 of tHTMLText is not "<p></p>"
      delete char -7 to -1 of tHTMLText
      if the last char of tHTMLText is return then delete the last char of tHTMLText
   end repeat
   
   ## Single lines don't need p tags
   if the number of lines in tHTMLText is 1 then
      if char 1 to 3 of tHTMLText is "<p>" then
         delete char 1 to 3 of tHTMLText
      end if
      
      if char - 4 to -1 of tHTMLText is "</p>" then
         delete char -4 to -1 of tHTMLText
      end if
   end if
   
   replace "<" with return & "<"  in tHTMLText
   replace ">" with ">" & return  in tHTMLText
   replace return & return with return in tHTMLText
   
   ## If there is more than one paragraph the first para tags are not needed
   if line 2 of tHTMLText is "<p>" then
      put empty into line 2 of tHTMLText
      put lineOffset("</p>",tHTMLText) into tLineNum
      put empty into line tLineNum of tHTMLText
   end if
   
   repeat with a = 1 to the number of lines in tHTMLText
      if char 1 to 7 of line a of tHTMLText is "<a name" then
         set the itemDel to "="
         put char 10 to -3 of line a of tHTMLText into tTag
         
         if the number of words in tTag > 1 then
            put "<" & item 1 of tTag & "=" & quote & item 2 of tTag & quote & ">" into line a of tHTMLText
            put "</" & word 1 of tTag & ">"  into line a+2 of tHTMLText
         else
            ## Warning, note, cp_note, change, tip, important
            put "<" & tTag & ">" into line a of tHTMLText
            put "</" & tTag & ">"  into line a+2 of tHTMLText
         end if
         
         if line a -1 of tHTMLText is "<b>" or line a-1 of tHTMLText is "<i>" then
            put empty into line a-1 of tHTMLText
            put empty into line a+3 of tHTMLText
         end if
      else
         if char 1 to 4 of line a of tHTMLText is "Note" then
            ## Note
            ## Remove bold tags around "Note:"
            if line a-1 of tHTMLText is "<b>" then put empty into line a-1 of tHTMLText
            if line a+1 of tHTMLText is  "</b>" then put empty into line a+1 of tHTMLText
            
            ## Remove <p> tags as they are added later
            if line a-2 of tHTMLText is "<p>" then 
               put "<p></p>" into line a-2 of tHTMLText
            end if 
            
            ## When is the next </p> tag
            put lineOffset("</p>",line a+2 to -1 of tHTMLText) into tLineNum
            put empty into line (a+1+tLineNum) of tHTMLText
            
            ## Add the note tags
            put "<note>" into line a of of tHTMLText
            put "</note>" into line (a+1+tLineNum) of tHTMLText
            
            ## Dont want a space after the tag
            if char 1 of line a+1 of tHTMLText is space then 
               delete char 1 of line a+1 of tHTMLText
            end if
            if char 1 of line a+2 of tHTMLText is space then 
               delete char 1 of line a+2 of tHTMLText
            end if
         else if char 1 to 7 of line a of tHTMLText is "Warning" then
            ## Warning
            ## Remove bold tags around "Warning:"
            if line a-1 of tHTMLText is "<b>" then put empty into line a-1 of tHTMLText
            if line a+1 of tHTMLText is  "</b>" then put empty into line a+1 of tHTMLText
            
            ## Remove <p> tags as they are added later
            if line a-2 of tHTMLText is "<p>" then 
               put "<p></p>" into line a-2 of tHTMLText
            end if
            ## When is the next </p> tag
            put lineOffset("</p>",line a+2 to -1 of tHTMLText) into tLineNum
            put empty into line (a+1+tLineNum) of tHTMLText
            
            ## Add the warning tags
            put "<warning>" into line a of of tHTMLText
            put "</warning>" into line (a+1+tLineNum) of tHTMLText
            
            if char 1 of line a+1 of tHTMLText is space then 
               delete char 1 of line a+1 of tHTMLText
            end if
            if char 1 of line a+2 of tHTMLText is space then 
               delete char 1 of line a+2 of tHTMLText
            end if
         else if char 1 to 19 line a of tHTMLText is "Cross-Platform Note" then
            ## cp_note
            ## Remove bold tags around "Cross Platform Note:"
            if line a-1 of tHTMLText is "<b>" then put empty into line a-1 of tHTMLText
            if line a+1 of tHTMLText is  "</b>" then put empty into line a+1 of tHTMLText
            
            ## Remove <p> tags as they are added later
            if line a-2 of tHTMLText is "<p>" then 
               put "<p></p>" into line a-2 of tHTMLText
            end if
            ## When is the next </p> tag
            put lineOffset("</p>",line a+2 to -1 of tHTMLText) into tLineNum
            put empty into line (a+1+tLineNum) of tHTMLText
            
            ## Add the cp_note tags
            put "<cp_note>" into line a of of tHTMLText
            put "</cp_note>" into line (a+1+tLineNum) of tHTMLText       
            
            if char 1 of line a+1 of tHTMLText is space then 
               delete char 1 of line a+1 of tHTMLText
            end if
            if char 1 of line a+2 of tHTMLText is space then 
               delete char 1 of line a+2 of tHTMLText
            end if
         else if char 1 to 6 of line a of tHTMLText is "change" then
            ## change
            ## Remove bold tags around "Chnanges ..."
            if line a-1 of tHTMLText is "<b>" then put empty into line a-1 of tHTMLText
            if line a+1 of tHTMLText is  "</b>" then put empty into line a+1 of tHTMLText
            
            ## Remove <p> tags as they are added later
            if line a-2 of tHTMLText is "<p>" then 
               put "<p></p>" into line a-2 of tHTMLText
            end if
            ## When is the next </p> tag
            put lineOffset("</p>",line a+2 to -1 of tHTMLText) into tLineNum
            put empty into line (a+1+tLineNum) of tHTMLText
            
            ## Now need the next one for the end of the change tag
            put lineOffset("</p>",line a+2 to -1 of tHTMLText) into tLineNum
            put empty into line (a+1+tLineNum) of tHTMLText
            
            ## Add the change tags
            put "<change>" into line a of of tHTMLText
            put "</change>" into line (a+1+tLineNum) of tHTMLText
            
            if char 1 of line a+1 of tHTMLText is space then 
               delete char 1 of line a+1 of tHTMLText
            end if
            if char 1 of line a+2 of tHTMLText is space then 
               delete char 1 of line a+2 of tHTMLText
            end if
         else if char 1 to 3 of line a of tHTMLText is "tip" then
            ## tip
            ## Remove bold tags around "Tip"
            if line a-1 of tHTMLText is "<b>" then put empty into line a-1 of tHTMLText
            if line a+1 of tHTMLText is  "</b>" then put empty into line a+1 of tHTMLText
            
            ## Remove <p> tags as they are added later
            if line a-2 of tHTMLText is "<p>" then 
               put "<p></p>" into line a-2 of tHTMLText
            end if
            ## When is the next </p> tag
            put lineOffset("</p>",line a+2 to -1 of tHTMLText) into tLineNum
            put empty into line (a+1+tLineNum) of tHTMLText
            
            ## Add the tip tags
            put "<tip>" into line a of of tHTMLText
            put "</tip>" into line (a+1+tLineNum) of tHTMLText
            
            if char 1 of line a+1 of tHTMLText is space then 
               delete char 1 of line a+1 of tHTMLText
            end if
            if char 1 of line a+2 of tHTMLText is space then 
               delete char 1 of line a+2 of tHTMLText
            end if
         else if char 1 to 9 of line a of tHTMLText is "important" then
            ## important
            ## Remove bold tags around "Important"
            if line a-1 of tHTMLText is "<b>" then put empty into line a-1 of tHTMLText
            if line a+1 of tHTMLText is  "</b>" then put empty into line a+1 of tHTMLText
            
            ## Remove <p> tags as they are added later
            if line a-2 of tHTMLText is "<p>" then 
               put "<p></p>" into line a-2 of tHTMLText
            end if
            ## When is the next </p> tag
            put lineOffset("</p>",line a+2 to -1 of tHTMLText) into tLineNum
            put empty into line (a+1+tLineNum) of tHTMLText
            
            ## Add the important tags
            put "<important>" into line a of of tHTMLText
            put "</important>" into line (a+1+tLineNum) of tHTMLText
            
            if char 1 of line a+1 of tHTMLText is space then 
               delete char 1 of line a+1 of tHTMLText
            end if
            if char 1 of line a+2 of tHTMLText is space then 
               delete char 1 of line a+2 of tHTMLText
            end if
         else if char 1 to 7 of line a of tHTMLText is "Caution" then
            ## caution
            ## Remove bold tags around "Caution"
            if line a-1 of tHTMLText is "<b>" then put empty into line a-1 of tHTMLText
            if line a+1 of tHTMLText is  "</b>" then put empty into line a+1 of tHTMLText
            
            ## Remove <p> tags as they are added later
            if line a-2 of tHTMLText is "<p>" then 
               put "<p></p>" into line a-2 of tHTMLText
            end if
            ## When is the next </p> tag
            put lineOffset("</p>",line a+2 to -1 of tHTMLText) into tLineNum
            put empty into line (a+1+tLineNum) of tHTMLText
            
            ## Add the important tags
            put "<caution>" into line a of of tHTMLText
            put "</caution>" into line (a+1+tLineNum) of tHTMLText
            
            if char 1 of line a+1 of tHTMLText is space then 
               delete char 1 of line a+1 of tHTMLText
            end if
            if char 1 of line a+2 of tHTMLText is space then 
               delete char 1 of line a+2 of tHTMLText
            end if
         end if
      end if
   end repeat
   
   replace (return & "<") with "<" in tHTMLText
   replace (">" & return) with ">"  in tHTMLText
   
   replace return with empty in tHTMLText
   
   put tHTMLText after tTagContents
   
   put "</" & pTag & ">" after tTagContents
   return tTagContents
end getFormattedTagValue

function getTagValue pTag, pField
   put tab & "<" & pTag & ">"  into tTagContents
   put the htmlText of field pField of group "xml editing" after tTagContents
   
   repeat until char -7 to -1 of tTagContents is not "<p></p>"
      delete char -7 to -1 of tTagContents
      if the last char of tTagContents is return then delete the last char of tTagContents
   end repeat
   
   put "</" & pTag & ">" after tTagContents
   return tTagContents
end getTagValue


function getOldTagValue pTag, pField
   put tab & "<" & pTag & ">"  into tTagContents
   put the htmlTExt of field pField of group "xml editing" into tHTMLText
   
   replace "<" with return & "<"  in tHTMLText
   replace ">" with ">" & return  in tHTMLText
   replace return & return with return in tHTMLText
   
   repeat with a = 1 to the number of lines in tHTMLText
      if char 1 to 7 of line a of tHTMLText is "<a name" then
         put empty into line a of tHTMLText
         put empty into line a+2 of tHTMLText
      end if
   end repeat
   
   replace (return & "<") with "<" in tHTMLText
   replace (">" & return) with ">"  in tHTMLText
   
   replace return with empty in tHTMLText
   
   put tHTMLText after tTagContents
   put "</" & pTag & ">" after tTagContents
   return tTagContents
end getOldTagValue

function getTagList pChildTag, pField   
   if the listBehavior of field pField then
      put the hilitedLines of field pField of group "xml editing" into tHilitedLines
      repeat for each item tLineNum in tHilitedLines
         if pChildTag is empty then
            put tab & tab & "<" & line tLineNum of field pField of group "xml editing" & "/>" & return after tTagContents
         else
            put tab & tab & "<" & pChildTag & ">" & line tLineNum of field pField of group "xml editing" & "</" & pChildTag & ">" & return after tTagContents
         end if
      end repeat   
   else
      ## This is a list that has been typed
      repeat for each line tLine in the htmlText of field pField
         if tLine is not empty and tLine is not "<p></p>" then
            ## Single lines do not also need p tags
            
            ## Single lines don't need p tags
            if char 1 to 3 of tLine is "<p>" then
               delete char 1 to 3 of tLine
            end if
            
            if char - 4 to -1 of tLine is "</p>" then
               delete char -4 to -1 of tLine
            end if            
            
            put tab & tab & "<" & pChildTag & ">" after tTagContents
            put tLine after tTagContents
            put "</" & pChildTag & ">" & return after tTagContents
         end if
      end repeat   
   end if
   delete the last char of tTagContents
   
   if tTagContents is not empty then put return after tTagContents
   
   return tTagContents
end getTagList

function getExampleTagList pChildTag  
   ## This is a list that has been typed
   if the htmlText of field  "example 1" is not empty and the htmlText of field "example 1" is not "<p></p>" then
      put the htmlText of field "example 1" into tExample1
      if the number of lines in tExample1 is 1 then
         if char 1 to 3 of tExample1 is "<p>" then delete char 1 to 3 of tExample1
         if char -4 to -1 of tExample1 is "</p>" then delete char -4 to -1 of tExample1 
      end if
      replace return with empty in tExample1
      put "<example>" & tExample1 & "</example>" & return after tTagContents
   end if
   
   if the htmlText of field  "example 2" is not empty and the htmlText of field "example 2" is not "<p></p>" then
      put the htmlText of field "example 2" into tExample2
      if the number of lines in tExample2 is 1 then
         if char 1 to 3 of tExample2 is "<p>" then delete char 1 to 3 of tExample2
         if char -4 to -1 of tExample2 is "</p>" then delete char -4 to -1 of tExample2
      end if
      replace return with empty in tExample2
      put "<example>" & tExample2 & "</example>" & return after tTagContents
   end if
   
   if the htmlText of field  "example 3" is not empty and the htmlText of field "example 3" is not "<p></p>" then
      put the htmlText of field "example 3" into tExample3
      if the number of lines in tExample1 is 3 then
         if char 1 to 3 of tExample3 is "<p>" then delete char 1 to 3 of tExample3
         if char -4 to -1 of tExample3 is "</p>" then delete char -4 to -1 of tExample3
      end if
      replace return with empty in tExample3
      put "<example>" & tExample3 & "</example>" & return after tTagContents
   end if
   
   if the htmlText of field  "example 4" is not empty and the htmlText of field "example 4" is not "<p></p>" then
      put the htmlText of field "example 4" into tExample4
      if the number of lines in tExample4 is 1 then
         if char 1 to 3 of tExample4 is "<p>" then delete char 1 to 3 of tExample4
         if char -4 to -1 of tExample4 is "</p>" then delete char -4 to -1 of tExample4 
      end if
      replace return with empty in tExample4
      put "<example>" & tExample4 & "</example>" & return after tTagContents
   end if
   
   if the htmlText of field  "example 5" is not empty and the htmlText of field "example 5" is not "<p></p>" then
      put the htmlText of field "example 5" into tExample5
      if the number of lines in tExample5 is 1 then
         if char 1 to 3 of tExample5 is "<p>" then delete char 1 to 3 of tExample5
         if char -4 to -1 of tExample5 is "</p>" then delete char -4 to -1 of tExample5 
      end if
      replace return with empty in tExample5
      put "<example>" & tExample5 & "</example>" & return after tTagContents
   end if
   return tTagContents
end getExampleTagList

function getTagListOld pChildTag, pField 
   if the listBehavior of field pField then
      put the hilitedLines of field pField of group "xml editing" into tHilitedLines
      repeat for each item tLineNum in tHilitedLines
         if pChildTag is empty then
            put line tLineNum of field pField of group "xml editing" & comma after tTagContents
         else
            put tab & tab & "<" & pChildTag & ">" & line tLineNum of field pField of group "xml editing" & "</" & pChildTag & ">" & return after tTagContents
         end if
      end repeat   
   else
      ## This is a list that has been typed
      repeat for each line tLine in field pField
         if pChildTag is empty then
            put tLine & comma after tTagContents
         else
            set the itemDel to tab
            put tab & tab & "<" & pChildTag & ">" after tTagContents
            put item -1 of tLine after tTagContents
            put "</" & pChildTag & ">" & return after tTagContents
         end if
      end repeat   
   end if
   delete the last char of tTagContents
   return tTagContents
end getTagListOld

function getTagListWithAttributes pChildTag, pField pAttributeList   
   if the listBehavior of field pField then
      put the hilitedLines of field pField of group "xml editing" into tHilitedLines
      repeat for each item tLineNum in tHilitedLines
         put "<" & line tLineNum of field pField of group "xml editing" & "/>" & return after tTagContents
      end repeat   
   else
      ## This is a list that has been typed
      repeat for each line tLine in field pField
         put "<" & pChildTag after tTagContents
         if pAttributeList is not empty then
            repeat with a = 1 to the number of items in pAttributeList               
               put space & item a of pAttributeList & "=" & quote after tTagContents
               set the itemDel to tab
               
               put item a of tLine into tTagValue
               replace "<" with "&lt;" in tTagValue
               replace ">" with "&gt;" in tTagValue
               put tTagValue & quote after tTagContents
               set the itemDel to comma
            end repeat
         end if
         put ">" after tTagContents
         
         set the itemDel to tab
         put item -1 of tLine into tTagContentValue
         replace "<" with "&lt;" in tTagContentValue
         replace ">" with "&gt;" in tTagContentValue
         put tTagContentValue after tTagContents
         put "</" & pChildTag & ">" & return after tTagContents
      end repeat   
   end if
   delete the last char of tTagContents
   return tTagContents
end getTagListWithAttributes

function getTreeID
   return sTreeID
end getTreeID

on clearFields
   put empty into field "file"
   put empty into field "legacy_id"
   put empty into field "name"
   put empty into field "type"
   put empty into field "introduced"
   put empty into field "deprecated"
   put empty into field "changed"
   put empty into field "removed"
   put empty into field "syntax"
   put empty into field "synonyms"
   put empty into field "categories"
   put empty into field "functions"
   put empty into field "commands"
   put empty into field "lessons"
   put empty into field "links"
   put empty into field "keywords"
   put empty into field "messages"
   put empty into field "properties"
   put empty into field "operators"
   put empty into field "control_sts"
   put empty into field "summary"
   --put empty into field "examples"
   put empty into field "example 1"
   put empty into field "example 2"
   put empty into field "example 3"
   put empty into field "example 4"
   put empty into field "example 5"
   
   put empty into field "overview"
   put empty into field "parameters"
   put empty into field "value"
   put empty into field "comments"
   put empty into field "description"
   
   set the hilitedLines of field "objects" to empty
   set the hilitedLines of field "concepts" to empty
   set the hilitedLines of field "supported_platforms" to empty
   set the hilitedLines of field "classes" to empty
   set the hilitedLines of field "security_settings" to empty
   
   set the menuHistory of button "main tabs" to 1
   send "menuPick editing" to button "main tabs"
   
   set the menuHistory of button "edit sections" to 1
   send "menuPick basics" to button "edit sections"
end clearFields

function tabFormat pList,pTabs
   repeat with a = 1 to the number of lines of pList
      repeat with b = 1 to pTabs
         put tab before line a of pList
      end repeat
   end repeat
   return pList
end tabFormat


