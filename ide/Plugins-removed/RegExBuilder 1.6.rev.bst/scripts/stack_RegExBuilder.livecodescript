Script "stack_RegExBuilder"

/*
# Name: stack "RegExBuilder"
# ID: stack "RegExBuilder"
# Hash: frs72jSSMa9SsZJb19G0Sw==
*/


on openStack
  RegexLoop
end openStack

on RegexLoop
  repeat with i=1 to 3
    set the vScrollBar of fld i to (the formattedHeight of fld i - 13 > Height of fld i)
    set the scrollBarWidth of fld i to 11
  end repeat
  
  if the hilitedButtonName of group "Filtering" is "Filter"
  then
    try
      set the caseSensitive to the hilite of btn "CaseSensitive"
      get fld "Input"
      if the hilitedButtonName of group "FilterGroup" is "with"
      then filter it with fld "Filter"
      else filter it without fld "Filter"
      put it into fld "Result"
    end try
  else
    try
      put fld "Filter" into theFilter
      if first char of theFilter is not "("
      then put "(" before theFilter
      if last char of theFilter is not ")"
      then put ")" after theFilter
      if not the hilite of btn "CaseSensitive" then put "(?i)" before theFilter
      get matchText(fld "Input",theFilter,m1,m2,m3,m4,m5,m6,m7,m8)
      put m1 && m2 && m3 && m4 && m5 && m6 && m7 && m8 into fld "Result"
    end try
  end if
  
  send "RegexLoop" to me in 200 milliseconds
end RegexLoop
