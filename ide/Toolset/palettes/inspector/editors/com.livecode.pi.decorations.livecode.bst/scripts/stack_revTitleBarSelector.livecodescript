Script "stack_revTitleBarSelector"

/*
# Name: stack "revTitleBarSelector" of stack "com.livecode.pi.decorations"
# ID: stack "revTitleBarSelector" of stack "com.livecode.pi.decorations"
# Hash: 0KtHR4xlqTNbPqiIr2kOaA==
*/


on preOpenStack
  set the cReturnValue of me to empty
  pass preOpenStack
end preOpenStack

function defaultDecorations
   return "title,menu,maximize,minimize,close"
end defaultDecorations

command setDecorations pDecorations, pCloseStack
   local tDecorations
   put pDecorations into tDecorations
   
   if pDecorations contains "default" then 
      local tDefaultValues
      put defaultDecorations() into tDefaultValues
      put tDefaultValues into tDecorations
   end if
   
   -- The display decorations are kept separate as they shouldn't include metal
   -- or noshadow.
   local tDisplayDecorations
   put tDecorations into tDisplayDecorations
   
   local tCurrentDecorations
   put the cDecorations of me into tCurrentDecorations
   
   --  Check if the stack currently has the metal property set.
   local tMetal
   if "metal" is among the items of tCurrentDecorations then
      put true into tMetal
   else
      put false into tMetal
   end if
   
   --  Check if the stack currently has a shadow.
   local tShadow
   if "noshadow" is not among the items of tCurrentDecorations then
      put true into tShadow
   else
      put false into tShadow
   end if
   
   --  If the current stack had metal set make sure it still has metal set.
   if tMetal then
      put ",metal" after tDecorations
   end if
   
   --  If the current stack didn't have a shadow make sure it still doesn't have a shadow.
   if not tShadow then
      put ",noshadow" after tDecorations
   end if
   
   --  Set the properties.
   set the cReturnValue of me to tDecorations
   if pCloseStack then
      close me
   end if
end setDecorations
