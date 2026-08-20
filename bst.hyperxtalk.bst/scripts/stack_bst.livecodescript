Script "stack_bst"

/*
# Name: stack "bst"
# ID: stack "bst"
# Hash: X4w3Qx/q3WzPtmWzFi0Qeg==
*/


/*****************************************************************************
 * MARK: PhotonJSON
 *****************************************************************************/

/*
Code repository: https://github.com/DTByte-Ltd/PhotonJSON
Web: https://dtbyte.com/
License: https://opensource.org/licenses/MIT
Date: Nov 2020
Last Update: October 19, 2025
Note: PhotonJSON follows JSON's standards presented
in https://www.json.org/json-en.html
*/

/*
This is a subset of the library focused on export.  The prettify function
has been modified to always indent after { [ and , for a cleaner
look.  Keys for non-numeric arrays are sorted.
*/

/* Declare script local variables */
local sIndentSize, sMaxLength

/* This flag is used to determine if the function is being called by itself.
So you don't have to repeat some operations and only do them when you finish
building the JSON. */
local sRecursionCounter = 0

/**
Summary: Format a LC array into UTF-8 encoded json data.

Parameters:
pArray (Array): The array to be formatted
pForceRootType (String): The type to force values to.
pPretty (Boolean): Set to true to format the resulting JSON data nicely.

Returns (String): JSON data.

Description:
Format a LC array into UTF-8 encoded json data.
*/
function JSONStringify pArray, pForceRootType, pPretty
   local tJsonString = "[", tIsNumeric = true, tKeys = "", tEndChar = "]"
   
   add 1 to sRecursionCounter
   
   if pArray is not an array then return "{}"
   
   # The array's keys are all *numerical*, so the root element will be a JSON *array*
   # Need to account for numerical keys that are not sequential starting at 0 or 1
   local tExtents
   put the extents of pArray into tExtents
   if tExtents is not a point or item 1 of tExtents is not in "0,1" then
      put false into tIsNumeric
      put "{" into tJsonString
      put "}" into tEndChar
   end if
   
   set the caseSensitive to true
   
   local tOptions
   put pForceRootType into tOptions["string"]
   put pPretty into tOptions["pretty"]
   # The values of the JSON keys will be formatted to their type.
   _builderJSON pArray, tIsNumeric, tOptions, tJsonString
   
   put tEndChar into the char - 1 of tJsonString
   
   # Empty array and empty objects
   if tJsonString is "[null]" then
      put "[]" into tJsonString
   else if tJsonString is "{" & quote & quote & ": null}" then
      put "{}" into tJsonString
   end if
   
   subtract 1 from sRecursionCounter
   
   if sRecursionCounter is 0 then
      set the caseSensitive to false
      if numToChar(8) is in tJsonString then replace numToChar(8) with "\b" in tJsonString
      if numToChar(9) is in tJsonString then replace numToChar(9) with "\t" in tJsonString
      if numToChar(10) is in tJsonString then replace numToChar(10) with "\n" in tJsonString
      if numToChar(12) is in tJsonString then replace numToChar(12) with "\f" in tJsonString
      if numToChar(13) is in tJsonString then replace numToChar(13) with "\r" in tJsonString
      // non-printable characters to your unicode code (HEX)
      put _cleaningNonPrintableChars(tJsonString) into tJsonString
      
      # Pretty
      if pPretty then return _jsonPrettyCompact(tJsonString, 3, pForceRootType)
   end if
   
   return tJsonString
end JSONStringify

private command _builderJSON pArray, pIsNumeric, pOptions, @xJsonString
   local tString, tPretty, tKeys
   if pOptions["string"] is "string" then
      put "string" into tString
   else
      put "" into tString
   end if
   
   put pOptions["pretty"] is true into tPretty
   
   local tValue
   if pIsNumeric then
      repeat for each element e in pArray
         if e is an array then
            put JSONStringify(e, tString, tPretty) & comma after xJsonString
         else 
            put _jsonValue(e) into tValue
            if tString is "string" then
               put quote & tValue & quote into tValue
            end if
            put tValue & comma after xJsonString
         end if
      end repeat
   else
      put the keys of pArray into tKeys
      sort tKeys
      // It is possible to create an array with a single empty key
      // without this check, the result is broken JSON - "}," without the "{"
      // Use " " as the key to avoid invalid JSON (null:null)
      if tKeys is empty then
         put _jsonString(" ") & ": " & _jsonString("") & comma after xJsonString
      end if
      repeat for each line k in tKeys
         if pArray[k] is an array then
            put _jsonString(k) & ": " &JSONStringify(pArray[k], tString, tPretty) & comma after xJsonString
         else
            put _jsonValue(pArray[k]) into tValue
            if tString is "string" then
               put quote & tValue & quote into tValue
            end if            
            put _jsonString(k) & ": " & tValue & comma after xJsonString
         end if
      end repeat
   end if
end _builderJSON

private function _jsonString pValue
   if pValue is not an ascii string then put textEncode(pValue, "UTF-8") into pValue

   # So these characters escape in case they are there.
   # https://www.json.org/img/string.png
   # any other value is processed as a string.
   # JSON strings require that certain characters be 'escaped' with a backslash:
   # This makes the processing a bit slower. But it is necessary for it to comply with the ECMA-404 standard
   if "\" is in pValue then replace "\" with "\\" in pValue
   if quote is in pValue then replace quote with "\" & quote in pValue
   return quote & pValue & quote
end _jsonString


private function _jsonValue pValue, pNoReplace
   switch pValue
      case "true"
         return "true"
         break
         
      case "false"
         return "false"
         break
         
      case ""; case "null"; case null
         return "null"
         break
         
      default
         if pValue is strictly an integer or pValue is strictly a real then
            if not(char 1 of pValue is 0 and char 2 of pValue is not "." and the length of pValue is not 1 or char 1 of pValue is not in "-0123456789") then
               return pValue
            end if
         end if
         
         if pNoReplace is not true then
            return _jsonString(pValue)
         else
            return quote & pValue & quote
         end if
   end switch
end _jsonValue

# json beautiful and compact
private function _jsonPrettyCompact pJsonString, pIndentSize, pForceRootType
   local tFormatted, tIndent, kSpace, tPrevToken = "", tIndex = 0, tOpenClose = "", tItems = "", tHyphenMinus = false
   
   if sMaxLength is not an integer then put 50 into sMaxLength
   if pIndentSize is not a integer or pIndentSize > 10 then put 4 into pIndentSize
   
   repeat for pIndentSize
      put space after kSpace
   end repeat
   
   # escaped quotes < " > and reverse-solidus < \\ > will confuse the tokenizer
   # so we replace them with "\u0022" and "\u005C" which we'll unescape
   # with all the other unescapes when we parse
   if "\\" is in pJsonString then replace "\\" with "\u005C" in pJsonString
   if backSlash & quote is in pJsonString then replace backSlash & quote with "\u0022" in pJsonString
   
   put 0 into tIndex
   put empty into tItems
   
   repeat for each token tToken in pJsonString
      add 1 to tIndex
      
      switch tToken
         case "{"; case "["
            put kSpace after tIndent
            put tToken & cr & tIndent after tFormatted
            break
            
         case "}"; case "]"
            delete char - pIndentSize to - 1 of tIndent
            put cr & tIndent & tToken after tFormatted
            break
            
         case ":"
            put ": " after tFormatted
            break
            
         case comma
            if tHyphenMinus then
               put _jsonValue("-") after tFormatted
               put false into tHyphenMinus
            end if
            put comma & cr & tIndent after tFormatted
            break
            
         case "-"
            put true into tHyphenMinus
            next repeat
            break
            
         default
            if tHyphenMinus then
               put "-" & tToken into tToken
               put false into tHyphenMinus
            end if
            
            if "\u00" is in tToken then
               replace "\u005C" with "\\" in tToken
               replace "\u0022" with "\" & quote in tToken
            end if
            
            if pForceRootType is "string" then
               put quote & tToken & quote after tFormatted
            else
               put _jsonValue(tToken, true) after tFormatted
            end if
      end switch
      
      put tToken into tPrevToken
   end repeat
   
   return textDecode(tFormatted, "UTF8")
end _jsonPrettyCompact

// non-printable characters to your unicode code (HEX)
constant kNonPrintableChars = "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,8216,8217,8220,8221,8212,8213,8230"
private function _cleaningNonPrintableChars pText
   set the formSensitive to false

   repeat for each item i in kNonPrintableChars
      if numToChar(i) is in pText then
         replace numToChar(i) with _convertAsciiToUnicodeNum(i) in pText
      end if
   end repeat

   return pText
end _cleaningNonPrintableChars

private function _convertAsciiToUnicodeNum pNum
   put baseConvert(pNum, 10, 16) into pNum
   switch the length of pNum
      case 1
         return "\u000" & pNum
         break
      case 2
         return "\u00" & pNum
         break
      case 3
         return "\u0" & pNum
         break
      case 4
         return "\u" & pNum
         break
   end switch
end _convertAsciiToUnicodeNum

