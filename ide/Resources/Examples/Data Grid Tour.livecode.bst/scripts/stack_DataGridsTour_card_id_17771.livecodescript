Script "stack_DataGridsTour_card_id_17771"

/*
# Name: card "Properties" of stack "DataGridsTour"
# ID: card id 17771 of stack "DataGridsTour"
# Hash: vNSHmCP9H+nvHI/aZqi0Lg==
*/


on preopencard
   stepSet 1
end preopencard

on stepSet pStep
   ## This function iterates over the step 'buttons' on the interface and fades out
   ## the ones which have not been applied
   
   
   repeat with x = 1 to 3
      set the blendlevel of button ("Step" & x) to 50
      if there is an image ("prop" & x) then hide image ("prop" & x)
   end repeat
   
   set the blendlevel of button ("Step" & pStep) to 0
   if there is an image ("prop" & pStep) then show image ("prop" & pStep)
   
end stepSet
