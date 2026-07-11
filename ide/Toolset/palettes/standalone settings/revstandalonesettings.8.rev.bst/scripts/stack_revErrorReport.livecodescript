Script "stack_revErrorReport"

/*
# Name: stack "revErrorReport" of stack "revStandaloneSettings"
# ID: stack "revErrorReport" of stack "revStandaloneSettings"
# Hash: mL1rg0qmEZWrlc3V1nwDow==
*/


# OK-2007-01-05: Bug 4799. Under certain circumstances this modal stack could be opened offscreen 
# giving the appearance of a frozen application. Ensure this does not happen. 
on preOpenStack 
  set the loc of me to the screenLoc 
  pass preOpenStack 
end preOpenStack

on errorDialog pWhatError, pWhatError2
  set the executionError of stack "copy of revErrorReport" to pWhatError
  set the scriptError of stack "copy of revErrorReport" to pWhatError2
  set the uObject of stack "copy of revErrorReport" to the long id of the target
  modal "copy of revErrorReport"
end errorDialog
