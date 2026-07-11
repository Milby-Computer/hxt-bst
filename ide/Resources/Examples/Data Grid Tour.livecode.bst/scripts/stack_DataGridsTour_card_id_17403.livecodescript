Script "stack_DataGridsTour_card_id_17403"

/*
# Name: card "The Template" of stack "DataGridsTour"
# ID: card id 17403 of stack "DataGridsTour"
# Hash: LGoC2tYm0aTdPhbdqY3g+Q==
*/


## This script works by repeatedly setting the data of the grid. In effect, we are 
## simply adding an extra row of data to the grid every 3/4 of a second until we
## get to 8 rows where we clear the data.

## We are using script locals to track the current number of rows we are displaying
## and we have the data array too.
local sDataArray
local sRowCount

## When we come to the card the row count is set to 0 and the demonstration started
on opencard
   put 0 into sRowCount
   demonstrationStart 
   pass opencard
end opencard

## The demonstration prepare function is taking the data and header information stored
## in a custom property on this card and processing it into a multi-dimentional array that 
## the data grid can understand.
on demonstrationPrepare pRowCount
   put the cHeader of this card into myFields
   put the cData of this card into myData
   put empty into sDataArray
   set the itemdelimiter to tab
   
   put 0 into n
   repeat for each line thisLine in myData
      add 1 to n
      if n <= sRowCount then
         put 0 into i
         repeat for each item thisField in myFields 
            add 1 to i
            put item i of thisLine into sDataArray[n][thisField]
            put false into sDataArray[n]["expanded"]
         end repeat
      end if
   end repeat
end demonstrationPrepare


on demonstrationStart
   ## Check that the user hasn't moved to another card
   if the short name of this card is "The Template" then 
      ## If we are displaying 8 rows or more start the demonstration again
      if sRowCount > 8 then 
         put 0 into sRowCount
      end if
      add 1 to sRowCount
      ## Prepare the data we want to insert into the data grid
      demonstrationPrepare sRowCount
      ## Set the data in the data grid
      set the dgData of group "slowLoadingGrid" to sDataArray
      ## Add another row to the grid in 3/4 of a second
      send demonstrationStart to me in 750 milliseconds
   end if
end demonstrationStart
