Script "stack_Unicode_Table_Maker_button_id_1015"

/*
# Name: button "Generate" of card "Line Break Property Table" of stack "Unicode Table Maker"
# ID: button id 1015 of card id 1011 of stack "Unicode Table Maker"
# Hash: SR7rBj55zg/3w6tINj+ONA==
*/


on mouseUp
  local tProperties
  put the decompress of the uUnicodeLineBreaks of this card into tProperties
  
  local tCurrentBase, tCurrentFrontier, tCurrentValue
  local tOutput
  
  local tClasses
  repeat for each line tLine in tProperties
    if char 1 of tLine is "#" or word 1 to -1 of tLine is empty then
      next repeat
    end if
    
    set the itemDelimiter to ";"
    
    local tClass
    put word 1 of item 2 of tLine into tClass
    
    local tCodepoint
    put item 1 of tLine into tCodepoint
    
    local tLowerCodepoint, tUpperCodepoint
    if tCodepoint contains ".." then
      set the itemDelimiter to "."
      put baseConvert(item 1 of tCodepoint, 16, 10) into tLowerCodepoint
      put baseConvert(item -1 of tCodepoint, 16, 10) into tUpperCodepoint
    else
      put baseConvert(tCodepoint, 16, 10) into tLowerCodepoint
      put tLowerCodepoint into tUpperCodepoint
    end if
    if tLowerCodepoint > 0xffff then
      next repeat
    end if
     
    put min(tUpperCodepoint, 0xffff) into tUpperCodepoint
     
    repeat with x = tLowerCodepoint to tUpperCodepoint
      put tClass into tClasses[x]
    end repeat
  end repeat
   
  set the itemDelimiter to comma
  put empty into tCurrentValue
  put empty into tCurrentBase
  repeat with x = 0 to 65535
    put tClasses[x] into tClass
    if tClass is empty then
      put "XX" into tClass
    end if
    
    local tIsIdeographic
    put tClass is among the items of "ID,H2,H3,JL,JV,JT,SA" into tIsIdeographic
     
    if tCurrentBase is not empty and tCurrentValue is tIsIdeographic and tCurrentFrontier + 1 is x then
      put x into tCurrentFrontier
    else
      if tCurrentBase is not empty and tCurrentValue then
        put format("0x%04x%04x", tCurrentBase, tCurrentFrontier) & return after tOutput
      end if
      put x into tCurrentBase
      put x into tCurrentFrontier
      put tIsIdeographic into tCurrentValue
    end if
  end repeat
   
  if tCurrentBase is not empty and tCurrentValue then
    put format("0x%04x%04x", tCurrentBase, tCurrentFrontier) & return after tOutput
  end if
  
  put formatArray("s_unicode_ideograph_map", tOutput) & return into msg
  
  put empty into tOutput
  put empty into tCurrentBase
  repeat with x = 0 to 65535
    put tClasses[x] into tClass
    if tClass is empty then
      put "XX" into tClass
    end if
    
    local tNoBreakBefore
    put tClass is among the items of "CM,WJ,GL,CL,EX" into tNoBreakBefore
     
    local tNoBreakAfter
    put tClass is among the items of "WJ,GL,OP,QU" into tNoBreakAfter
     
    local tValue
    put 0 into tValue
    if tNoBreakBefore then
      put tValue bitOr 1 into tValue
    end if
    if tNoBreakAfter then
      put tValue bitOr 2 into tValue
    end if
     
    if tCurrentValue is tValue and tCurrentFrontier + 1 is x then
      put x into tCurrentFrontier
    else
      if tCurrentBase is not empty and tCurrentValue is not 0 then
        put encodeBreakRange(tCurrentBase, tCurrentFrontier, tCurrentValue) & return after tOutput
      end if
      put x into tCurrentBase
      put x into tCurrentFrontier
      put tValue into tCurrentValue
    end if
  end repeat
  if tCurrentBase is not empty and tCurrentValue is not 0 then
    put encodeBreakRange(tCurrentBase, tCurrentFrontier, tCurrentValue) & return after tOutput
  end if
  
  put formatArray("s_unicode_nobreak_map", tOutput) & return after msg
end mouseUp

function encodeBreakRange pLower, pUpper, pValue
  if pUpper - pLower >= 2^14 then
    breakpoint
  end if
  return format("0x%04x%04x", pLower, (pUpper - pLower) * 4 + pValue) 
end encodeBreakRange

function formatArray pName, pValues
  local tArray, tIndex
  put 0 into tIndex
  put "uint4 " && pName & "[] =" & return & "{" & return into tArray
  repeat for each line tValue in pValues
    if tIndex mod 8 is 0 then
      put "  " after tArray
    end if
    put tValue & comma & space after tArray
    if tIndex mod 8 is 7 then
      put return after tArray
    end if
    add 1 to tIndex
  end repeat
  if tIndex mod 8 is not 0 then
    put return after tArray
  end if
  put "};" & return after tArray
  return tArray
end formatArray
