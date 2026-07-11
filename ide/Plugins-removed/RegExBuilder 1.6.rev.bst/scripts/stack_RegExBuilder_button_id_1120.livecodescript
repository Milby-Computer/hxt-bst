Script "stack_RegExBuilder_button_id_1120"

/*
# Name: button "Copy syntax:" of card id 1002 of stack "RegExBuilder"
# ID: button id 1120 of card id 1002 of stack "RegExBuilder"
# Hash: 7Yl4RutDrSIA2lCJqHG7uA==
*/


on menuPick instruction
  put empty into lPrefixSyntax
  
  put replaceText(fld "Filter",quote,"\" & quote) into theFilter
  
  switch word 1 of instruction
  case "Filter"
    put "set the caseSensitive to" && the hilite of btn "CaseSensitive" & return into theSyntax
    if the hilitedButtonName of group "FilterGroup" is "with"
    then put "Filter <container> with" && quote & theFilter & quote after theSyntax
    else put "Filter <container> without" && quote & theFilter & quote after theSyntax
    break
     
  case "MatchText"
    if not MatchText(theFilter,"\(*\)") then put "(" & theFilter & ")" into theFilter
    put GetMatches(theFilter,true) into theSyntax
    if not the hilite of btn "CaseSensitive" then put "(?i)" before theFilter
    put "get MatchText(<container>," & quote & theFilter & quote before last line of theSyntax
    put ")" after theSyntax
    break
     
  case "MatchChunk"
    if not MatchText(theFilter,"\(*\)") then put "(" & theFilter & ")" into theFilter
    put GetMatches(theFilter,false) into theSyntax
    if not the hilite of btn "CaseSensitive" then put "(?i)" before theFilter
    put "get MatchChunk(<container>," & quote & theFilter & quote before last line of theSyntax
    put ")" after theSyntax
    break
  end switch
   
  put theSyntax into fld "Hidden"
  set the traversalOn of fld "Hidden" to true
  select text of fld "Hidden"
  copy
  set the traversalOn of fld "Hidden" to false
end menuPick

function GetMatches theFilter,isText
  repeat with i=1 to 8
    if MatchChunk(theFilter,"(\([^\(]+\))",x,y)
    then
      delete char x to y of theFilter
      if isText
      then
        put "put empty into t" & i & return after prefixSyntax
        put ",t" & i after tempSyntax
      else
        put "put empty into s" & i & return after prefixSyntax
        put "put empty into e" & i & return after prefixSyntax
        put ",s" & i & ",e" & i after tempSyntax
      end if
    else exit repeat
  end repeat
  
  return prefixSyntax & tempSyntax
end GetMatches
