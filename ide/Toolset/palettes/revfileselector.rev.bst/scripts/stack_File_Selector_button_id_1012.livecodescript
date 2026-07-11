Script "stack_File_Selector_button_id_1012"

/*
# Name: button "Save" of card "File Selector Card" of stack "File Selector"
# ID: button id 1012 of card id 1002 of stack "File Selector"
# Hash: 4YKH6l+JpwGAhBpY3RYdnw==
*/


on mouseUp
  local fname
  put field "Selection" into fname
  if the visible of field "Files" then
    put the platform into tPlatform
    repeat for each char c in fname
      switch tPlatform
      case "MacOS"
        if c is ":" then
          answer "File names cannot include" && quote & c & quote & "."
          exit to top
        end if
        break
      case "Win32"
        if c is in "\/:*?<>|" & quote then
          answer "File names cannot include" && quote & c & quote & "."
          exit to top
        end if
        break
      default -- unix
        if c is "/" then
          answer "File names cannot include" && quote & c & quote & "."
          exit to top
        end if
        break
      end switch
    end repeat
  end if
  if char 1 of fname is not "/" then
    if fname is empty
    then put the directory into fname
    else
      put "/" before fname
      if the directory is not "/"
      then put the directory before fname
    end if
  end if
  if the short name of me is "Save" then
    get fname
    set the itemDelimiter to "/"
    delete last item of it
    if there is no directory it then
      answer error "Directory" && it && "does not exist."
      exit to MetaCard
    else
      if there is a file fname then
        answer question "File" && fname && "exists.  Overwrite?"  with "Yes" or "No"
        if it is not "Yes" then exit to MetaCard
      end if
    end if
  end if
  if the short name of me is "Open" and there is no file fname then
    answer error "File" && fname && "does not exist."
    exit to MetaCard
  end if
  close this stack
  set the dialogData to fname
end mouseUp
