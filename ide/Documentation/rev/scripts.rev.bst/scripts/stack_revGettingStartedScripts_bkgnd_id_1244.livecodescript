Script "stack_revGettingStartedScripts_bkgnd_id_1244"

/*
# Name: bkgnd "Storing a modification timestamp Example" of stack "revGettingStartedScripts"
# ID: bkgnd id 1244 of stack "revGettingStartedScripts"
# Hash: YbSxXAHHr7QhrtwZ6IFZtw==
*/


on closeField -- place in stack script
  set the lastModDate of this card to the seconds
end closeField

-- handle displaying the date and automatically updating it:

local lastTimestamp
local storedMessageID

on preOpenBackGround
  updateTimestamp
end preOpenBackGround

on updateTimestamp
  if not (there is a field "Explanation") then exit updateTimeStamp -- card changed
  if the lastModDate of this card is not lastTimeStamp then
    put the lastModDate of this card into lastTimestamp
    get lastTimestamp
    convert it to date and time
    put it into line 2 of field "Explanation"
  end if
  send "updateTimestamp" to me in 1 second
  put the result into storedMessageID
end updateTimestamp

on closeBackground
  cancel storedMessageID
end closeBackground
