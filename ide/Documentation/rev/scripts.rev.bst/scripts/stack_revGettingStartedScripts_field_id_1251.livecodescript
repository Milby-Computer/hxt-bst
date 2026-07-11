Script "stack_revGettingStartedScripts_field_id_1251"

/*
# Name: field "Display" of group "Switching between styled text and HTML source Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: field id 1251 of group id 1250 of card id 1002 of stack "revGettingStartedScripts"
# Hash: KAL6QPT4iV4SnHxRukBSiA==
*/


setProp displayedFormat theType
  -- accepts "HTML" (default) or "styled"
  if theType is "HTML" then
    set the text of the target to the htmlText of the target
  else
    set the htmlText of the target to the text of the target
  end if
end displayedFormat
