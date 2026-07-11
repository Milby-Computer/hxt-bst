Script "stack_Zip_Build_Sampler_button_id_1009"

/*
# Name: button "Create" of card "Main" of stack "Zip Build Sampler"
# ID: button id 1009 of card id 1002 of stack "Zip Build Sampler"
# Hash: +ktqjreT9hNatRuc5OX24Q==
*/


on mouseUp
  -- This will hold the path of the archive to create
  local tArchive
  
  -- Find out where the user would like to save their archive
  ask file "Please choose the name of the archive"
  put it into tArchive
  
  -- Only continue if they have chosen a name
  if tArchive is empty then exit mouseUp
  
  -- Create the archive (see stack script)
  -- filesList is a stack script function that returns a 
  -- list of the all the files in the files list that can
  -- be added to the archive.
  archiveCreate tArchive, filesList()
  
end mouseUp
