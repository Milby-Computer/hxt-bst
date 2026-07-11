Script "stack_DataGridsTour_card_id_5539"

/*
# Name: card "Form" of stack "DataGridsTour"
# ID: card id 5539 of stack "DataGridsTour"
# Hash: 81XV0hq9vzrNz98zyJF7PQ==
*/


## STEP 1
on loadData
   ## 1: The headers and data for the form are loaded from custom properties 
   ## 1: on this card
   put the cHeaders of this card into myFields
   put the cData of this card into myData
   
   ## 2: The data is multiple rows each containing items seperated by the tab character
   ## 2: So we set the item delimiter to 'tab' so that was can repeat over each item
   set the itemdelimiter to tab
   
   
   put 0 into n
   ## 3: Iterate through each line in the data
   repeat for each line thisLine in myData
      add 1 to n
      put 0 into i
      ## 4: Iterate over each each item in the header names
      repeat for each item thisField in myFields 
         add 1 to i
         ## 5: Put the current item of the current line into the multi-dimensional array
         ## 5: KEY 1 : The line number
         ## 5: KEY 2 : The name of the header
         ## 5: DATA : The current item in the current line of data
         put item i of thisLine into theDataArray[n][thisField]
      end repeat
   end repeat
   ## 6: Now we load the data into the data grid by setting the dgData property
   set the dgData of group "sampleForm" to theDataArray
end loadData

## STEP 2
on formatForm
   ## 3: Set the row colors to match our background a little better
   set the dgProps["row color"] of group "sampleForm" to "#E6F6FE"
   set the dgProps["alternate row color"] of group "sampleForm" to "#7FC9E8"
end formatForm


## STEP 0
on resetDemonstration
   ## This function simply resets all the properties back to their original setting  
   set the dgData of group "sampleForm" to ""
   set the dgProps["row color"] of group "sampleForm" to "#ffffff"
   set the dgProps["alternate row color"] of group "sampleForm" to "#E6EDF7"
end resetDemonstration



## OTHER FUNCTION AND HANDLERS

on stepSet pStep
   ## This function iterates over the step 'buttons' on the interface and fades out
   ## the ones which have not been applied
   repeat with x = 0 to 2
      if x <= pStep then
         set the blendlevel of button ("Step" & x) to 0
      else
         set the blendlevel of button ("Step" & x) to 50
      end if
   end repeat
end stepSet

on preopencard
   ## Resets the demonstration and sets the stage to 0
   resetDemonstration
   stepSet 0
end preopencard
