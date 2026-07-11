Script "stack_File_Attribs_card_id_1009"

/*
# Name: card "iPhone Tests" of stack "File Attribs"
# ID: card id 1009 of stack "File Attribs"
# Hash: IU0ra4BrnwLDIh5LsTqGUg==
*/


on preOpenCard
   if the environment is "mobile" then
      --iphoneEnableAccelerometer
      --iphoneStartTrackingLocation
      --iphoneEnableOrientationChanged
   end if
   pass preOpenCard
end preOpenCard

on closeCard
   if the environment is "mobile" then
      --iphoneStopTrackingLocation
      --iphoneDisableOrientationChanged
      --iphoneDisableAccelerometer
   end if
end closeCard

on mouseUp
   local tControl, tControlNames
   repeat with tControl = 1 to the number of controls of me
      put tControlNames && tControl && the name of control tControl into tControlNames
   end repeat
   put the width of control 25 && the height of control 25 after tControlNames
   answer tControlNames with "Okay"
end mouseUp

on locationChanged
   get iphoneCurrentLocation()
   combine it with return and "="
   put it into the last field
end locationChanged

on locationError
   put "location error :o(" into the last field
end locationError

on accelerationChanged pPoint
   put pPoint & return after the last field
   set the vScroll of the last field to 32766
end accelerationChanged

on orientationChanged
   --put iphoneDeviceOrientation() & return after the last field
   --set the vScroll of the last field to 32766
   
   iphoneRotateInterface iphoneDeviceOrientation()
end orientationChanged

on motionStart pMotion
   put "start" && pMotion & return into the last field
end motionStart

on motionEnd pMotion
   put "end" && pMotion & return after the last field
end motionEnd

on motionRelease pMotion
   put "release" && pMotion & return after the last field
end motionRelease
