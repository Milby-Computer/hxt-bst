Script "stack_revScriptColourEditor_card_id_1002"

/*
# Name: card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: uemT0jYw8WgXIoQgx6k/mA==
*/



command colourize
  local tClasses
  local tKeywords
  
  colorizationBuildSettings the dgText of group "colours", tClasses, tKeywords
  
  _internal script configure classes tClasses
  _internal script configure keywords tKeywords
  
  updateOpenScriptEditors
end colourize


private command colorizationBuildSettings pSettingsString, @rClasses, @rKeywords
  local tClasses, tKeywords
  repeat for each line tLine in pSettingsString
    if word 1 of tLine is "class" then
      put word 3 of tLine into tClasses[word 2 of tLine && "attributes"]
      put word 4 of tLine into tClasses[word 2 of tLine && "color"]
    else if word 1 of tLine is "keyword" then
      put word 3 of tLine into tKeywords[word 2 of tLine && "attributes"]
      put word 4 of tLine into tKeywords[word 2 of tLine && "color"]
    else if word 1 of tLine is "group" then
      switch word 2 of tLine
      case "commands"
        get the commandNames
        break
      case "properties"
        get the propertyNames
        break
      case "functions"
        get the functionNames
        break
      case "structures"
        get "if then else repeat for with while on command private function end switch case getprop setprop try catch the of to after before into"
        replace space with return in it
        break
      case "chunks"
        get "line char character word token item file folder card stack button field scrollbar image player audioclip videoclip group graphic number string date boolean integer color rect rectangle"
        replace space with return in it
        break
      case "operators"
        get "and or not bitNot bitOr bitXor bitAnd there is a contains among in div mod no within"
        replace space with return in it
      end switch
      repeat for each line tKeyword in it
        put word 3 of tLine into tKeywords[tKeyword && "attributes"]
        put word 4 of tLine into tKeywords[tKeyword && "color"]
      end repeat
    end if
  end repeat
  
  put tClasses into rClasses
  put tKeywords into rKeywords
end colorizationBuildSettings


private command updateOpenScriptEditors
   local tScriptEditors
   put revListScriptEditors() into tScriptEditors
   lock screen
   repeat for each line tScriptEditor in tScriptEditors
      dispatch "scriptColorize" to group "Editor" of stack tScriptEditor with "script"
   end repeat
   unlock screen
end updateOpenScriptEditors
