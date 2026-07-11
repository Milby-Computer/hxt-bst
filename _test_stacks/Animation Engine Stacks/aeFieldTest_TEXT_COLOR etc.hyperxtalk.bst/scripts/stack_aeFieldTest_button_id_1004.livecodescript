Script "stack_aeFieldTest_button_id_1004"

/*
# Name: button "start" of card id 1002 of stack "aeFieldTest"
# ID: button id 1004 of card id 1002 of stack "aeFieldTest"
# Hash: Qi9HRQE6H860YRHeICK5PA==
*/


on mouseUp
   --disable me
   
   -- reset field
   put fld "Lipsum" into fld "Lipsum"
   
   --setup animations
   aeSetFrameRate 18
   
   if the visible of fld "theScript" then
      set the flag of btn "theScript" to false
      aeFadeOut the long ID of fld "theScript",250
   end if
   
   show fld "Lipsum"
   aeChangeRect the long ID of fld "Lipsum",the topLeft of fld "Lipsum",500,300,1000,"overshoot"
   send "animationStep 1" to me in 1 secs
   send "animationStep 2" to me in 3 secs
   send "animationStep 3" to me in 4 secs
   send "animationStep 4" to me in 5 secs
   send "animationStep 5" to me in 6 secs
   send "animationStep 6" to me in 7 secs
   send "animationStep 7" to me in 8 secs
   send "animationStep 8" to me in 9 secs
   send "animationStep 9" to me in 10 seconds
   send "animationStep 10" to me in 12000 milliseconds
   send "animationStep 11" to me in 14 secs
   send "animationStep 12" to me in 16 secs
end mouseUp


on animationStep pWhat
   --lock changes
   aeLockRects
   aeLockHeights
   aeLockWidths
   
   switch pWhat
      case 1
         -- Lorem ipsum wird rot und blau
         aeChangeForeColorOfChunk the long ID of fld "Lipsum","word 1","blue",1100
         aeChangeForeColorOfChunk the long ID of fld "Lipsum","word 2","red",1100
         break
      case 2
         -- untern scroll nach rechts
         aeChangeHscroll the long ID of fld "Lipsum",500,1000,"overShoot"
         break
      case 3
         -- druchsichtige grafik kommt von rechts ins bild
         aeMoveTo the long ID of grc "grcTest",275,175,1000,"overshoot"
         break
      case 4
         -- untern scroll nach rechts
         aeChangeHscroll the long ID of fld "Lipsum",1500,1000,"bounce"
         break
      case 5
         -- untern scroll nach unten
         aeChangeVscroll the long ID of fld "Lipsum",200,1000,"bounce"
         break
      case 6
         -- feld wird kleiner, geht nach unten rechts
         aeChangeRect the long ID of grc "grcTest",200,200,500,300,1000,"bounce"
         aeChangeRect the long ID of fld "Lipsum",200,200,500,300,1000,"bounce"
         break
      case 7
         -- feld wird grösser nach oben ??? farbe schrift ???
         aeChangeHeight the long ID of fld "Lipsum",300,1000,"inout"
         aeChangeHeight the long ID of grc "grcTest",300,1000,"inout"
         aeChangeBackColor the long ID of fld "Lipsum","#aaaaff",1000,"inout"
         aeChangeForeColor the long ID of fld "Lipsum","red",1000,"bounce"
         break
      case 8
         -- bacground wird wieder weiss und field breiter
         aeChangeWidth the long ID of fld "Lipsum",400,500,"overshoot"
         aeChangeWidth the long ID of grc "grcTest",400,500,"overshoot"
         aeChangeForeColor the long ID of fld "Lipsum","black",500,"bounce"
         aeChangeBackColor the long ID of fld "Lipsum","white",500,"inout"
         break
      case 9
         -- scrollt nach oben
         aeChangeHscroll the long ID of fld "Lipsum",0,1000,"inOut"
         aeChangeVscroll the long ID of fld "Lipsum",0,1000,"inOut"
         break
      case 10
         -- linie 3 wird schrift orange und bg hellblau
         aeChangeForeColorOfChunk the long ID of fld "Lipsum","line 3","orange",1600
         aeChangeBackColorOfChunk the long ID of fld "Lipsum","line 3","#ccccee",1600,"overshoot"
         break
      case 11
         -- fenster wird klein und verschwindet
         aeChangeRect the long ID of fld "Lipsum",50,50,50,50,1000,"inout"
         aeMoveTo the long ID of grc "grcTest",900,150,1000,"inOut"
         set the width of grc "grcTest" to 450
         set the height of grc "grcTest" to 250
         aeFadeOut the long ID of fld "Lipsum",1000
         break
      case 12
         enable me
         set the loc of grc "grcTest" to -500,-200
         break
      default
         break
   end switch
   
   -- unlock changes and play animation
   aeUnLockRects
   aeUnLockHeights
   aeUnLockWidths
   
end animationStep
