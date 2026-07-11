Script "stack_livecodeTestInterface"

/*
# Name: stack "livecodeTestInterface"
# ID: stack "livecodeTestInterface"
# Hash: P2EuewMcUGRbki0phQdQhg==
*/


on preOpenStack
   if the long name of the target contains "subtestResults" then
      
   else
      // Check preferences are ok
      local tStacksFolderOK, tScriptsFolderOK,tInstallFolderOK, tOutputFolderOK
      
      put there is a folder  the cTestFolder of stack "revPreferences" into tStacksFolderOK
      put there is a folder  the cLiveCodeInstallFolder of stack "revPreferences" into tInstallFolderOK
      put there is a folder  the cTestCache of stack "revPreferences" into tOutputFolderOK
      
      set the cSelectedNodeIDs of control "test list" of card 1 of stack "liveCodeTestInterface" to empty
      set the cSelectedNodeIDs of control "version list" of card 1 of stack "liveCodeTestInterface" to empty
      set the cSelectedNodeIDs of control "platform list" of card 1 of stack "liveCodeTestInterface" to empty
      
      if not tStacksFolderOK then
         set the cTestFolder of stack "revPreferences" to empty      
      end if
      
      if not tInstallFolderOK then
         set the cLiveCodeInstallFolder of stack "revPreferences" to empty      
      end if
      
      if not tOutputFolderOK then
         set the cTestCache  of stack "revPreferences" to empty
      else
         // Ensure that all required folders exist
         
      end if   
      send "clearCard true" to card "main" of stack "liveCodeTestInterface"
   end if
end preOpenStack

command qualityClearProperties
   set the cTestFolder of stack "revPreferences" to empty
   set the cLiveCodeInstallFolder of stack "revPreferences" to empty
   set the cTestCache of stack "revPreferences" to empty
   set the cGitHubPath of stack "revPreferences" to empty
end qualityClearProperties
