Script "stack_revResourceCenter_button_id_578796"

/*
# Name: button "Wrap to:" of group "Example" of group id 578797 of group "mainContent" of card "Insertinglinebreakstohardwraptext" of stack "revResourceCenter"
# ID: button id 578796 of group id 578792 of group id 578797 of group id 80450 of card id 80438 of stack "revResourceCenter"
# Hash: 0RurXZMgoWlYxjUGNOnW7w==
*/


on mouseUp
  put wordWrapped(field "Example Text",field "Line Length") into field "Example Text"
end mouseUp

function wordWrapped theText,maxLength,quoteCharacter
  if maxLength is empty or maxLength is not a number then
    -- use a default value if maxLength is not provided:
    put 75 into maxLength
  end if
  if maxLength is not an integer then -- truncate it:
    put trunc(maxLength) into maxLength
  end if
  repeat for each line thisLine in theText
    if length(thisLine) <= maxLength then
      -- the line is shorter than the maximum, so
      -- we can leave it as-is:
      put thisLine & return after theWrappedText
    else -- thisLine is longer than the maximum
      repeat until thisLine is empty
        -- try to break the line at a space:
        repeat with x = maxLength down to 1
          if char x of thisLine is space \
             or length(thisLine) < maxLength then
            put (char 1 to x-1 of thisLine) & return \
               after theWrappedText
            delete char 1 to x of thisLine
            exit repeat
          end if
        end repeat
        if x = 1 then -- no spaces in the first maxLength chars
          -- so we break it at that number of characters:
          put char 1 to maxLength of thisLine & return \
             after theWrappedText
          delete char 1 to maxLength of thisLine
        end if
      end repeat
    end if
  end repeat
  return theWrappedText
end wordWrapped
