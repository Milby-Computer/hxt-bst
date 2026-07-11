Script "stack_revGettingStartedScripts_button_id_1004"

/*
# Name: button "Example" of group "Displaying a count down (blocking) Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1004 of group id 1003 of card id 1002 of stack "revGettingStartedScripts"
# Hash: 8sg9klLHBJ0Fe3wn0S3klg==
*/


on mouseUp
  put 99 into bottlesLeft
  repeat until the mouseClick -- stop song when the user clicks
    -- show a verse, using the bottlePhrase function
    -- do one verse on each iteration of the loop:
    switch bottlesLeft
    case zero -- last verse, zero bottles left
      put bottlePhrase(bottlesLeft) && "on the wall," \
         && toLower(bottlePhrase(bottlesLeft)) & return \
         & "Go to the store and buy some more," \
         && toLower(bottlePhrase(99)) \
         && "on the wall." into field "Song"
      break 
    default -- all other verses
      put bottlePhrase(bottlesLeft) && "on the wall," \
         && toLower(bottlePhrase(bottlesLeft)) & return \
         & "Take one down and pass it around," \
         && toLower(bottlePhrase(bottlesLeft - 1)) \
         && "on the wall." into field "Song"
    end switch
    subtract 1 from bottlesLeft -- for the next verse
    if bottlesLeft < zero then put 99 into bottlesLeft
    wait for 1 second
  end repeat
  -- when the repeat loop ends with a click, the song is over:
  put empty into field "Song"
end mouseUp

function bottlePhrase theNumber
  -- generate the "base phrase" used to make a verse
  switch theNumber
  case zero
    return "No more bottles of beer"
    break
  case one
    return "One last bottle of beer"
    break
  default
    return theNumber && "bottles of beer"
  end switch
end bottlePhrase
