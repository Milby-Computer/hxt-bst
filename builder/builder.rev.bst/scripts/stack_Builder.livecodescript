Script "stack_Builder"

/*
# Name: stack "Builder"
# ID: stack "Builder"
# Hash: NnKaagfVn+EzDJdtmZTJdA==
*/


////////////////////////////////////////////////////////////////////////////////

on preOpenStack
   set the itemdelimiter to slash
   start using stack (item 1 to -2 of the filename of me & slash & "builder_utilities.livecodescript")
   set the width of this stack to the right of group "Controls" + 4
   resizeStack
end preOpenStack

on resizeStack
   try
      set the topLeft of group "Controls" to 4,4
      set the rect of field "Log" to 4, the bottom of group "Controls" + 4, the width of this card - 4, the bottom of this card - 4
   end try
end resizeStack

////////////////////////////////////////////////////////////////////////////////

command __builderLog pType, pMessage, pContext
   local tEntry
   put the internet date into tEntry["time"]
   put pType into tEntry["type"]
   put pMessage into tEntry["message"]
   put pContext into tEntry["context"]
   --put tEntry into sCurrentLog[the number of elements of sCurrentLog + 1]
   repeat for each line tLine in pMessage
      if pContext is not empty then
         replace comma with ":" in pContext
         put pContext after field "Log" of me
      end if
      put "[" && tEntry["time"] && "]" && ":" && tLine & return after field "Log" of me
      if pType is "report" then
         set the textStyle of the last line of field "Log" of me to "bold"
      else if pType is "error" then
         set the textStyle of the last line of field "Log" of me to "bold"
         set the textcolor of the last line of field "Log" of me to "red"
      end if
   end repeat
   set the vScroll of field "Log" of me to 32766
end __builderLog

on __builderBuild pWhich
   put empty into field "Log"
   
   local tEdition
   put the label of button "Edition" into tEdition
   
   local tPlatformsA
   if the hilite of button "Windows" then
      put true into tPlatformsA["windows"]
   end if
   
   if the hilite of button "Mac os X" then
      put true into tPlatformsA["macosx"]
   end if
   
   if the hilite of button "Linux" then
      put true into tPlatformsA["linux"]
   end if
   
   if the hilite of button "Linux x64" then 
      put true into tPlatformsA["linux-x64"]
   end if
   
   if the hilite of button "Linux ARMv6" then
      put true into tPlatformsA["linux-armv6hf"]
   end if
   
   if the hilite of button "Android" then
      put true into tPlatformsA["android"]
   end if
   
   if the hilite of button "iOS" then
      put true into tPlatformsA["ios"]
   end if         
   
   local tReleaseType
   put the label of button "Type" into tReleaseType  
   put toLower(char 1 of tReleaseType) into char 1 of tReleaseType 
   
   builderBuild pWhich, the keys of tPlatformsA, tEdition, tReleaseType
end __builderBuild
////////////////////////////////////////////////////////////////////////////////

