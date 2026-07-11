Script "stack_Relaunch_Sampler"

/*
# Name: stack "Relaunch Sampler"
# ID: stack "Relaunch Sampler"
# Hash: dbUoAdbjROL6fDcaHQTzGA==
*/


-- If your applications mainstack has a 'relaunch' handler, then Revolution will treat
-- it as a 'single-instance' application. This means that if a second instance is launched
-- the original instance will be sent a 'relaunch' message before the new instance
-- startsup.

on relaunch
  -- The parameters for relaunch are the command-line arguments passed when invoking the
  -- new instance. Revolution does the same processing of these as it does for the $n
  -- global variables. i.e.
  --   . It splits the command-line up into Words
  --   . Removes quotes bracketing any quoted argument
  --   . Replaces '\' with '/'
  --
  
  put "Relaunch message received with parameters:" & return after field "Log"
  repeat with tIndex = 1 to the paramCount
    put "  param(" & tIndex & ") = " & param(tIndex) & return after field "Log"
  end repeat
   
  -- Passing the relaunch message will cause the new instance to continue to load.
  if the hilite of button "Pass Relaunch" then
    put "Passing" & return after field "Log"
    pass relaunch
  end if
   
  -- Returning background will cause the existing instance to remain in the background
  -- and the new instance to quit.
  if the hilite of button "Remain in Background" then
    put "Remaining in background" & return after field "Log"
    return "background"
  end if
  put "Processed" & return & return after field "Log"
   
  -- Try to keep processing in the relaunch handler to a minimum as the new instance
  -- waits for a reply. In particular, you must not open any windows (especially modal
  -- dialogs) as this will cause an automatic pass.
  -- Therefore, it is best to do the main part of the processing after relaunch has
  -- sent back its acknowledgement. Do this we send a message to be executed as soon as
  -- the current handler stack resolves.
  send "processRelaunch param(1)" to me in 0 millisecs
   
  
  -- Returning empty will cause the existing instance to be brought to the front, and
  -- the new instance to quit.
  
  return empty
end relaunch

-- As described above, it is best to do all the processing of the relaunch *after*
-- the relaunch message has been acknowledged.
-- Here we just open an open-file dialog with the path passed to the command-line.
--
-- Note that when a modal dialog is being displayed, you can still receive the 'relaunch'
-- message. However, using messages as we have here will result in them being
-- automatically queued.
--
on processRelaunch pDefault
  ask file "Are you sure you want this file?" with pDefault
end processRelaunch
