Script "stack_revStandaloneProgress"

/*
# Name: stack "revStandaloneProgress" of stack "revStandaloneSettings"
# ID: stack "revStandaloneProgress" of stack "revStandaloneSettings"
# Hash: DP6TS+A0qcnTT2P7dIFk0Q==
*/


on preOpenStack
  
end preOpenStack

on openStack
   // HXT dark mode
   if (the systemAppearance is "dark") then
      set the backColor of me to "#323232"
   else
      set the backColor of me to "#ececec"
   end if
end openStack

on openCard
   send "startLoading" to group "Loader" of card 1 of me
end openCard

on preOpenCard
  
end preOpenCard

on closeStack
  send "stopLoading" to group "Loader" of card 1 of me
end closeStack

// HXT
on systemAppearanceChanged pMode, pWindowColor
   set the backgroundColor of this stack to pWindowColor
   if pMode is "dark" then
      set the foreColor of me to "white"
   else
      set the foreColor of me to "black"
   end if
end systemAppearanceChanged
