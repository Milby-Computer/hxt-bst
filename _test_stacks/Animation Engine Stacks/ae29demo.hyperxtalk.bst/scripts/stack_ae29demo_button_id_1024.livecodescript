Script "stack_ae29demo_button_id_1024"

/*
# Name: button "Start" of card id 1002 of stack "ae29demo"
# ID: button id 1024 of card id 1002 of stack "ae29demo"
# Hash: 1ubVZb+tnGjQlNhkB5H2wg==
*/


--> all handlers
#################################
#               AE 2.9 demo stack                       #
# (c) 2008 derbrill Multimedia, all rights reserved #
#################################

local sFlag

on mouseUp pMouseBtnNo
   --    if "animationengine" is not among the lines of the stacksinuse then 
   --        answer "Sorry. This stack needs animationEngine 2.9 or higher to run."
   --        exit mouseUp
   --    end if
   hide fld "info"
   -- initialise a flag
   put true into sFlag
   -- set the frameRate for the animation.
   -- 25 is a good compromise between CPU usage and smoothness
   aeSetFrameRate 25
   -- stop all moving done by aeMoveTo
   aeStopMoving "all"
   -- make sure moves are unlocked
   aeUnlockMoves
   -- finally move this button
   aeMoveTo the long id of me,1000,item 2 of the loc of this cd,500,"in"
end mouseUp

on aeMoveDone
    -- prevent doublette clicks
    if sFlag then
        doAnimation
    end if
    put false into sFlag
end aeMoveDone

on doAnimation
    -- lock new moves by aeMoveTo
    aeLockMoves
     
    -- stop all moving by aeMoveTo
    aeStopMoving "all"
     
    -- reset the position of all chars
    repeat with i=2 to the number of images
        set the loc of img i to the cStartPoint of img i
    end repeat
     
    -- reset blendLevel of group
    set the blendlevel of grp 1 to 0
     
    -- initialize movement of chars for the bounce effect
    repeat with i =the number of images down to 2
        aeMoveTo the long id of img i,the cEndPoint of img i,3000+15*i,"bounce"
    end repeat
    
    -- finally move all chars with the bounce effect.
    aeUnlockMoves
    
    -- let the stack bounce in sync with first char bounce
    send "bounceStack" to me in 1050 millisecs
     
    -- play next part of the animation in 4 seconds
    send "ani2" to me in 4000 millisecs
     
end doAnimation

on ani2
     
    aelockmoves
    repeat with i = 2 to the number of images
        aeMoveTo the long id of img i,the cEnd2Point of img i,800,"in"
    end repeat
    aeunlockmoves
     
    wait 700 millisec with messages
     
    aelockmoves
    aeMoveTo the long id of this stack,item 1 of the loc of this stack + 100& comma & item 2 of the loc of this stack,100,"in"
    aeunlockmoves
     
    wait 200 millisec with messages
     
    aeMoveTo the long id of this stack,item 1 of the loc of this stack - 100& comma & item 2 of the loc of this stack,100,"out"
     
    aelockmoves
    repeat with i = 2 to 19
        aeMoveTo the long id of img i,the cEndPoint of img i,800,"overshoot"
    end repeat
    aeunlockmoves
     
    wait 800 millisec with messages
     
    aemoveto the long id of this stack, item 1 of the loc of this stack, item 2 of the loc of this stack -50, 1000,"out"
     
    wait 100 millisec with messages
     
    set the loc of me to item 1 of the loc of this card , -100
    aemoveto the long id of me, the loc of this cd, 500, "overshoot"
     
    blendOut
     
    wait 200 millisec with messages
     
    aemoveto the long id of group 1, item 1 of the loc of group 1, 1000, 1500, "inout"
     
end ani2


on bounceStack
  aeMoveTo the long name of this stack,item 1 of the loc of this stack,item 2 of the loc of this stack +50,500,"bounce"
end bounceStack


on blendOut
  set the blendlevel of grp 1 to the blendlevel of grp 1 +4
  if the blendlevel of grp 1 < 100 then
    send "blendOut" to me in 40 millisecs
  end if
end blendOut
