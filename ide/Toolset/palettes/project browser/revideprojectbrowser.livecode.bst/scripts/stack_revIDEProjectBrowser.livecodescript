Script "stack_revIDEProjectBrowser"

/*
# Name: stack "revIDEProjectBrowser"
# ID: stack "revIDEProjectBrowser"
# Hash: PuZ0+fwxTUNKFh8IFSFO+w==
*/


on CommandKeyDown pKey
   if (pKey = "w") then
      close this stack
   else
      pass CommandKeyDown
   end if
end CommandKeyDown
