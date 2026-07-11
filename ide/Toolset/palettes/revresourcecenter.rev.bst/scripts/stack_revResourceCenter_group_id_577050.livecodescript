Script "stack_revResourceCenter_group_id_577050"

/*
# Name: group "Example" of group id 580777 of group "mainContent" of card "Storingamodificationtimestamp" of stack "revResourceCenter"
# ID: group id 577050 of group id 580777 of group id 109189 of card id 109175 of stack "revResourceCenter"
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
