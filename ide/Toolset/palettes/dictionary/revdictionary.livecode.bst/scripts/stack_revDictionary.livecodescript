Script "stack_revDictionary"

/*
# Name: stack "revDictionary"
# ID: stack "revDictionary"
# Hash: DPY93h9BjW6yF9ypgbTjyQ==
*/


on preOpenStack
   set the cantModify of me to false
   dispatch "setAsBehavior" to stack revIDEPaletteResourcePath("behaviors/revdictionarybehavior.livecodescript") with the long id of me
   set the showPreferenceAction of me to false
   set the navigationDisplayStyle of me to "names"
   clearFrameData
   --   addFrameItem "show_apis","header", "navigation", "API", "f1b3", "f1b3","showAPIs", the long id of me
   --   addFrameItem "show_guides","header", "navigation", "Guide", "f1b3", "f1b3","showGuides", the long id of me
   set the backColor of me to systemWindowColor
end preOpenStack

on goToEntry pLibrary, pName, pType
   dispatch "setAsBehavior" to stack revIDEPaletteResourcePath("behaviors/revdictionarybehavior.livecodescript") with the long id of me
   dispatch "navigateToEntry" to me with pLibrary, pName, pType
end goToEntry


on SystemAppearanceChanged pMode, pWindowColor, pTextColor
   set the backColor of me to pWindowColor
end SystemAppearanceChanged


on CommandKeyDown pKey
   if (pKey = "w") then
      close this stack
   else
      pass CommandKeyDown
   end if
end CommandKeyDown
