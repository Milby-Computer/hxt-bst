Script "stack_rTreeEngine"

/*
# Name: stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: oJPLhFRvMi6CVx6XkZRBQA==
*/


/*
rTree 2.0
©2008 - 2013 Tapirsoft
info@Tapirsoft.com 
This stack was written by Mats Wilstrand

Licensing terms:

These scripts are licensed to you if you agree to be bound to one of the following 
License types at your choice.  

1) GPLv3
You may use rTree as FREE Software as outlined in the terms of the GPLv3 or any 
higher version of the GPL as found here: 
http://www.gnu.org/licenses/gpl-3.0.html

2) Commercial license:
If you do not want to disclose the sources of your application you have the option 
to purchase a commercial license from http://www.tapirsoft.com You are paying 
a license fee for the major version of rTree. If you are licensing rTree 2.0.1, you 
will be able to use all upgrades that carry the same major version number 
(in this case 2.x). Once the switch is made to a version 3.x of the library, you will 
need to upgrade your license to use the latest version. However, of course you may 
continue to use any version of the library you currently have licensed, without 
needing to purchase an upgrade. Such a commercial license releases you from the 
requirements of the copyleft GPL license, which include: distribution of all source 
code, including your own product; licensing of your own product under the GPL 
license; prominent mention of the Tapirsoft copyright and the GPL license; and 
disclosure of modifications to the library.

Code Contributions
If you want to contribute to rTrees codebase and want your changes to be accepted 
into the main trunc, you will have to accept our open source contribution 
agreement as found here: 
http://www.tapirsoft.com/osca.pdf
*/


global gSessionID
local sFirstRun
local tLongTreeID
local tStackFolderPath
local tLog
local tCurrentCardLongID
local bcdFld
local bcdGrc
local crrPcc
local drgInr
local edtInr
local cnnLns
local vrlScr
local hrlScr
local theName
local tCounter
local tLockLocs
local ndeBcd
local frtIcn
local scdIcn
local thdIcn
local ndeTxt
local frtBde
local tLongNodeTemplateID
local tStackLoc

on newTool tTool
   if the long id of this stack is in the long id of me
   then
      /*
      if tTool is "browse"
      then
         repeat for each line tStack in revLoadedStacks("application")
            repeat with i = 1 to the number of cards of stack tStack
               repeat for each line tGroup in the groupIDs of card i of stack tStack
                  if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
                  then
                     put the long id of group id tGroup of card i of stack tStack into tLongTreeID
                     if the temp["rectangle"] of tLongTreeID is a rectangle then set the rectangle of tLongTreeID to the temp["rectangle"] of tLongTreeID
                  end if
               end repeat
            end repeat
         end repeat
      end if
      */
   end if
   pass newTool
end newTool

on preOpenStack
   if the long id of this stack is in the long id of me
   then
      lock screen
      set the visible of me to false
      start using me
      if sFirstRun is not false
      then
         /*
         put the long id of this card into tLongCardID
         repeat for each line tStack in revLoadedStacks(application)
            repeat with i = 1 to the number of cards of stack tStack
               repeat for each line tGroup in the groupIDs of card i of stack tStack
                  if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
                  then
                     -- set the lockLoc of group id tGroup of card i of stack tStack to true
                     -- go to card i of stack tStack
                     send "setPersistentData" to group id tGroup of card i of stack tStack
                  end if
               end repeat
            end repeat
         end repeat
         go to tLongCardID
         put false into sFirstRun
         set the visible of this stack to false
         */
         if gSessionID is empty
         then
            # Log function.
            put the millisec into gSessionID
            set the itemDelimiter to "/"
            put item 1 to - 2 of the filename of stack the mainStack of me into tStackFolderPath
            set the itemDelimiter to comma
            put "# Started rTreeEngine at:" && the internet date into tLog
            put cr & "# rTreeEngine Version:" && the rTreeVersion of me after tLog
            put cr & "# File Path:" && the filename of stack the mainStack of me after tLog
            put cr & "# Session ID:" && gSessionID after tLog
            put cr & "# System:" && the systemVersion after tLog
            put cr & "# Processor:" && the processor after tLog
            put cr & "# Platform:" && the platform after tLog
            put cr & "# Machine:" && the machine after tLog
            put cr & "# LiveCode Build Number:" && the buildNumber after tLog
            put cr & "# LiveCode Environment:" && the environment after tLog
            put cr & "# Aplications Engines Version:" && the version after tLog
            put cr & "# Free Disk Space Mega bytes:" && the diskSpace div (1024^2) after tLog
            put cr after tLog
            set the systemInfo of me to tLog
         end if
      end if
      go cd "_Start"
      unlock screen
   end if
   pass preOpenStack
end preOpenStack

on openStack
   if the long id of this stack is in the long id of me
   then
      lock screen
      -- send "updatePersistentData" to me in 1 millisec
      set the navigationArrows to false # Prevent arrow keys navigation to other card
      if the long ID of this stack is the long ID of me
      then
         send "refreshMode" to me in 1 tick
      end if
      unlock screen
   end if
   pass openStack
end openStack

/*
on updatePersistentData
   if the long id of this stack is in the long id of me
   then
   if sFirstRun is not false
   then
      repeat for each line tStack in revLoadedStacks("application")
         repeat with i = 1 to the number of cards of stack tStack
            repeat for each line tGroup in the groupIDs of card i of stack tStack
               if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
               then
                  send "setPersistentData" to group id tGroup of card i of stack tStack
               end if
            end repeat
         end repeat
      end repeat
      put false into sFirstRun
   end if
   end if
end updatePersistentData
*/

on refreshMode
   lock screen
   palette stack "rTreeEngine"
   unlock screen
end refreshMode

on openCard
   if the long id of this stack is in the long id of me
   then
      lock screen
      /*
      if sFirstRun is false
      then
         repeat for each line tStack in revLoadedStacks("application")
            repeat with i = 1 to the number of cards of stack tStack
               repeat for each line tGroup in the groupIDs of card i of stack tStack
                  if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
                  then
                     put the long id of group id tGroup of card i of stack tStack into tLongTreeID
                     -- set the lockLoc of tLongTreeID to the temp["lockLoc"] of tLongTreeID
                     -- send "renderTree" to tLongTreeID
                     -- set the lockLoc of tLongTreeID to false
                     -- send "setPersistentData" to group id tGroup of card i of stack tStack
                     if the temp["rectangle"] of tLongTreeID is a rectangle then set the rectangle of tLongTreeID to the temp["rectangle"] of tLongTreeID
                  end if
               end repeat
            end repeat
         end repeat
      end if
      */
      
      if the long ID of this stack is the long ID of me
      then
         palette stack "rTreeEngine"
      end if
      unlock screen
   end if
   pass openCard
end openCard

/*
on closeCard
   if the long id of this stack is in the long id of me
   then
   lock screen
   # Lock geometry when going to another card as that opens the groups.
   put line 1 of the recentcards into tCurrentCardLongID
   repeat for each line tStack in revLoadedStacks("application")
      repeat with i = 1 to the number of cards of stack tStack
         repeat for each line tGroup in the groupIDs of card i of stack tStack
            if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
            then
               put the long id of group id tGroup of card i of stack tStack into tLongTreeID
               if the id of tLongTreeID is in the groupIDs of tCurrentCardLongID
               then
                  -- next repeat
               end if
               set the lockLoc of tLongTreeID to true
               -- if the temp[selected] of tLongTreeID is not true then set the lockLoc of tLongTreeID to true
               -- set the temp[selected] of tLongTreeID to false
               -- if the temp["rectangle"] of tLongTreeID is a rectangle then set the rectangle of tLongTreeID to the temp["rectangle"] of tLongTreeID
            end if
         end repeat
      end repeat
   end repeat
   unlock screen
   end if
end closeCard
*/

/*
on mouseEnter
   if the long id of this stack is in the long id of me
   then
      if the long ID of the target is the long ID of button "Text" of card id 1002 of stack "revMenuBar"
      then
         set the cEditText of me to true
      else
         set the cEditText of me to false
      end if
   end if
   pass mouseEnter
end mouseEnter
*/

on create_rTree theName,theRectangle
   lock screen
   lock messages
   if the long id of this stack is the long id of me
   then
      exit "create_rTree"
   end if
   
   /*
   repeat for each line tStack in revLoadedStacks("application")
      repeat with i = 1 to the number of cards of stack tStack
         repeat for each line tGroup in the groupIDs of card i of stack tStack
            if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
            then
               put the long id of group id tGroup of card i of stack tStack into tLongTreeID
               set the lockLoc of tLongTreeID to true
            end if
         end repeat
      end repeat
   end repeat
   */
   
   create field "backgroundField"
   put the long ID of it into bcdFld
   set the traversalOn of it to true
   set the opaque of it to true
   set the lockText of it to true
   set the autoHilite of it to true
   set the threeD of it to false
   set the showBorder of it to false
   create graphic "backgroundGraphic"
   put the long ID of it into bcdGrc
   set the lineSize of it to 1
   create graphic "cornerPiece"
   put the long ID of it into crrPcc
   set the opaque of it to true
   set the backgroundColor of it to 228,228,228
   set the foregroundColor of it to 228,228,228
   create graphic "dragIndicator"
   set the visible of it to false
   put the long ID of it into drgInr
   set the enabled of it to false
   set the foregroundColor of it to 0,0,255
   
   create graphic "editIndicator"
   set the visible of it to false
   put the long ID of it into edtInr
   set the enabled of it to false
   set the foregroundColor of it to 0,0,255
   
   create graphic "connectionLines"
   set the style of it to "line"
   set the visible of it to false
   put the long ID of it into cnnLns
   set the enabled of it to false
   set the foregroundColor of it to 128,128,128
  
   create scrollbar "verticalScrollbar"
   put the long ID of it into vrlScr
   set the behavior of it to the long ID of button "verticalScrollbarBehavior" of card "Engine" of stack "rTreeEngine"
   set the startValue of it to 0
   set the thumbSize of it to 1
   set the endValue of it to 18
   set the lineInc of it to 1
   set the pageInc of it to 5
   create scrollbar "horizontalScrollbar"
   put the long ID of it into hrlScr
   set the behavior of it to the long ID of button "horizontalScrollbarBehavior" of card "Engine" of stack "rTreeEngine"
   set the startValue of it to 0
   set the thumbSize of it to 1
   set the endValue of it to 18
   set the lineInc of it to 1
   set the pageInc of it to 5
   
   group bcdFld and bcdGrc and crrPcc and cnnLns and vrlScr and hrlScr and drgInr and edtInr
   put the long ID of the last group into tLongTreeID
   set the locked of the last group to true
   set the behavior of the last group to the long ID of button "rTreeBehavior" of card "Engine" of stack "rTreeEngine"
   unlock messages
   set the width of the last group to 192
   set the height of the last group to 192 * 1.618
   lock messages
   set the showBorder of the last group to true
   set the threeD of tLongTreeID to false
   set the borderWidth of tLongTreeID to 1
   set the borderColor of tLongTreeID to "gray"
   
   set the hiliteColor of the last group to 193,196,227
   set the backgroundColor of the last group to 255,255,255
   set the margins of the last group to 8
   if theName is not empty then set the name of the last group to theName
   repeat with i = 1 to 4
      if item i of theRectangle is not an integer then exit repeat
      add 1 to tCounter
   end repeat
   
   if theRectangle is empty or the number of items of theRectangle is not 4 or tCounter is not 4
   then
      set the rectangle of the last group to the topLeft of this card , the left of this card + 192 , the top of this card + 192 * 1.618
   else
      set the rectangle of the last group to theRectangle
   end if
   set the location of the last group to the location of this card
   delete character - 1 of tLockLocs
   start editing tLongTreeID
   
   create graphic "nodeBackground"
   put the long ID of it into ndeBcd
   set the width of it to 1
   set the height of it to 1
   set the opaque of it to true
   set the lineSize of it to 0
   
   create button "firstIcon"
   set the visible of it to true
   put the long ID of it into frtIcn
   set the opaque of it to false
   set the showBorder of it to false
   set the showName of it to false
   set the autoHilite of it to false
   set the sharedHilite of it to false
   set the traversalOn of it to false
   set the threeD of it to false
   set the hiliteBorder of it to false
   set the borderWidth of it to 0
   set the margins of it to 0
   set the name of it to empty
   set the textSize of it to 1
   set the icon of it to "plus"
   set the height of it to 16 -- the formattedHeight of it
   set the width of it to 16 -- the formattedWidth of it
   set the name of it to "firstIcon"
   
   create button "secondIcon"
   set the visible of it to true
   put the long ID of it into scdIcn
   set the opaque of it to false
   set the showBorder of it to false
   set the showName of it to false
   set the autoHilite of it to false
   set the sharedHilite of it to false
   set the traversalOn of it to false
   set the threeD of it to false
   set the hiliteBorder of it to false
   set the borderWidth of it to 0
   set the margins of it to 0
   set the name of it to empty
   set the textSize of it to 1
   set the icon of it to "xpopen.gif"
   set the height of it to 16 -- the formattedHeight of it
   set the width of it to 16 -- the formattedWidth of it
   set the name of it to "secondIcon"
   
   create button "thirdIcon"
   set the visible of it to true
   put the long ID of it into thdIcn
   set the opaque of it to false
   set the showBorder of it to false
   set the showName of it to false
   set the autoHilite of it to false
   set the sharedHilite of it to false
   set the traversalOn of it to false
   set the threeD of it to false
   set the hiliteBorder of it to false
   set the borderWidth of it to 0
   set the margins of it to 0
   set the name of it to empty
   set the textSize of it to 1
   set the icon of it to "property.png"
   set the height of it to 16 -- the formattedHeight of it
   set the width of it to 16 -- the formattedWidth of it
   set the name of it to "thirdIcon"
   
   create field "nodeText"
   set the fixedLineHeight of it to false
   set the margins of it to 4,8,4,0
   set the lockText of it to true
   set the autoHilite of it to false
   set the listBehavior of it to false
   set the dontWrap of it to true
   set the showBorder of it to false
   set the borderWidth of it to 1
   set the threeD of it to false
   set the borderColor of it to "gray"
   set the visible of it to true
   set the sharedText of it to true
   set the textSize of it to empty
   set the textFont of it to empty
   put the long ID of it into ndeTxt
   set the opaque of it to false
   set the height of it to 16
   set the width of it to 64
   
   create graphic "firstBadge"
   put the long ID of it into frtBde
   set the style of it to "roundRect"
   set the roundRadius of it to 6
   set the opaque of it to true
   set the backgroundColor of it to "gray"
   set the showName of it to true
   set the margins of it to 2,2,2,6
   set the height of it to 16
   set the width of it to 32
   
   group ndeBcd and frtIcn and scdIcn and thdIcn and ndeTxt and frtBde
   put the long ID of the last group into tLongNodeTemplateID
   set the behavior of tLongNodeTemplateID to the long id of button "nodeBehavior" of card "Engine" of stack "rTreeEngine"
   set the lockLoc of tLongNodeTemplateID to false
   set the borderWidth of the last group to 0
   set the showBorder of the last group to false
   set the threeD of the last group to false
   set the hiliteColor of the last group to 193,196,227
   set the backgroundColor of the last group to empty
   set the margins of the last group to 0
   set the name of the last group to "nodeTemplate"
   set the left of frtIcn to the left of the last group
   set the top of frtIcn to the top of the last group
   set the left of scdIcn to the right of frtIcn
   set the top of scdIcn to the top of the last group
   set the left of thdIcn to the right of scdIcn
   set the top of thdIcn to the top of the last group 
   set the left of ndeTxt to the right of thdIcn
   set the top of ndeTxt to the top of the last group
   set the top of frtBde to the top of the last group
   set the height of the last group to 16
   set the width of the last group to the width of tLongTreeID
   set the right of frtBde to the right of the last group
   set the rectangle of ndeBcd to the rectangle of the last group
   set the lockLoc of tLongTreeID to false
   # Set Tree properties
   set the autoScrollbar of tLongTreeID to false
   set the autoStartUsing of tLongTreeID to true
   set the betweenNodesDelta of tLongTreeID to 4
   set the clickIcon of tLongTreeID to empty
   set the clickNode of tLongTreeID to empty
   set the copyBetweenTrees of tLongTreeID to false
   set the depthDelta of tLongTreeID to 12
   set the dontChangeNodeIDs of tLongTreeID to false
   set the editNodeOnDoubleClick of tLongTreeID to true
   set the fileIcon of tLongTreeID to empty
   set the firstIconCollapsed of tLongTreeID to "10500" # Minus Icon. 
   set the firstIconExpanded of tLongTreeID to "10501" # Plus Icon.
   set the secondIconCollapsed of tLongTreeID to empty
   set the secondIconExpanded of tLongTreeID to empty
   set the thirdIconCollapsed of tLongTreeID to empty
   set the thirdIconExpanded of tLongTreeID to empty
   set the hilitedNodeIDs of tLongTreeID to empty
   set the hiliteOnMouseUp of tLongTreeID to true
   set the lastNodeID of tLongTreeID to empty
   set the mouseNode of tLongTreeID to empty
   set the newNodeOnReturn of tLongTreeID to true
   set the nodeIDs of tLongTreeID to empty
   set the rtLineInc of tLongTreeID to 1
   set the rtPageInc of tLongTreeID to 5
   set the showInvisibleNodes of tLongTreeID to false
   set the shownNodeIDs of tLongTreeID to empty
   set the treeType of tLongTreeID to empty
   set the useContextMenu of tLongTreeID to true
   set the useConnectionLines of tLongTreeID to true
   set the useFirstBadge of tLongTreeID to false
   set the useMomentumScroll of tLongTreeID to false
   set the useDragIndicator of tLongTreeID to true
   set the useMultipleHilites of tLongTreeID to true
   set the useNoncontiguousHilites of tLongTreeID to true
   set the visibleNodeIDs of tLongTreeID to empty
   set the useFirstIcon of tLongTreeID to true
   set the useSecondIcon of tLongTreeID to false
   set the useThirdIcon of tLongTreeID to false
   set the fileIcon of tLongTreeID to empty
   # End - Set Tree properties
   set the groupEditMode of stack "rTreeEngine" to false
   stop editing tLongTreeID
   
   dispatch "calibrateScrollbar" to scrollbar "VerticalScrollbar" of tLongTreeID
   dispatch "updateGeometry" to tLongTreeID
   
   
   unlock messages
   unlock screen
   choose pointer tool
   select tLongTreeID
   set the lockLoc of tLongTreeID to true
end create_rTree

on new_rTree theName theRectangle
   lock screen
   lock messages
   if the long id of this stack is the long id of me
   then
      exit "new_rTree"
   end if
   
   /*
   repeat for each line tStack in revLoadedStacks("application")
      repeat with i = 1 to the number of cards of stack tStack
         repeat for each line tGroup in the groupIDs of card i of stack tStack
            if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
            then
               put the long id of group id tGroup of card i of stack tStack into tLongTreeID
               set the lockLoc of tLongTreeID to true
            end if
         end repeat
      end repeat
   end repeat
   */
   
   create field "backgroundField"
   put the long ID of it into bcdFld
   set the traversalOn of it to true
   set the opaque of it to true
   set the lockText of it to true
   set the autoHilite of it to true
   set the threeD of it to false
   set the showBorder of it to false
   create graphic "backgroundGraphic"
   put the long ID of it into bcdGrc
   set the lineSize of it to 1
   create graphic "cornerPiece"
   put the long ID of it into crrPcc
   set the opaque of it to true
   set the backgroundColor of it to 228,228,228
   set the foregroundColor of it to 228,228,228
   create graphic "dragIndicator"
   set the visible of it to false
   put the long ID of it into drgInr
   set the enabled of it to false
   set the foregroundColor of it to 0,0,255
   
   create graphic "editIndicator"
   set the visible of it to false
   put the long ID of it into edtInr
   set the enabled of it to false
   set the foregroundColor of it to 0,0,255
   
   create graphic "connectionLines"
   set the style of it to "line"
   set the visible of it to false
   put the long ID of it into cnnLns
   set the enabled of it to false
   set the foregroundColor of it to 128,128,128
  
   create scrollbar "verticalScrollbar"
   put the long ID of it into vrlScr
   set the behavior of it to the long ID of button "verticalScrollbarBehavior" of card "Engine" of stack "rTreeEngine"
   set the startValue of it to 0
   set the thumbSize of it to 1
   set the endValue of it to 18
   set the lineInc of it to 1
   set the pageInc of it to 5
   create scrollbar "horizontalScrollbar"
   put the long ID of it into hrlScr
   set the behavior of it to the long ID of button "horizontalScrollbarBehavior" of card "Engine" of stack "rTreeEngine"
   set the startValue of it to 0
   set the thumbSize of it to 1
   set the endValue of it to 18
   set the lineInc of it to 1
   set the pageInc of it to 5
   
   group bcdFld and bcdGrc and crrPcc and cnnLns and vrlScr and hrlScr and drgInr and edtInr
   put the long ID of the last group into tLongTreeID
   set the locked of the last group to true
   set the behavior of the last group to the long ID of button "rTreeBehavior" of card "Engine" of stack "rTreeEngine"
   unlock messages
   set the width of the last group to 192
   set the height of the last group to 192 * 1.618
   lock messages
   set the showBorder of the last group to true
   set the threeD of tLongTreeID to false
   set the borderWidth of tLongTreeID to 1
   set the borderColor of tLongTreeID to "gray"
   
   set the hiliteColor of the last group to 193,196,227
   set the backgroundColor of the last group to 255,255,255
   set the margins of the last group to 8
   if theName is not empty then set the name of the last group to theName
   repeat with i = 1 to 4
      if item i of theRectangle is not an integer then exit repeat
      add 1 to tCounter
   end repeat
   
   if theRectangle is empty or the number of items of theRectangle is not 4 or tCounter is not 4
   then
      set the rectangle of the last group to the topLeft of this card , the left of this card + 192 , the top of this card + 192 * 1.618
   else
      set the rectangle of the last group to theRectangle
   end if
   set the location of the last group to the location of this card
   delete character - 1 of tLockLocs
   start editing tLongTreeID
   
   create graphic "nodeBackground"
   put the long ID of it into ndeBcd
   set the width of it to 1
   set the height of it to 1
   set the opaque of it to true
   set the lineSize of it to 0
   
   create button "firstIcon"
   set the visible of it to true
   put the long ID of it into frtIcn
   set the opaque of it to false
   set the showBorder of it to false
   set the showName of it to false
   set the autoHilite of it to false
   set the sharedHilite of it to false
   set the traversalOn of it to false
   set the threeD of it to false
   set the hiliteBorder of it to false
   set the borderWidth of it to 0
   set the margins of it to 0
   set the name of it to empty
   set the textSize of it to 1
   set the icon of it to "plus"
   set the height of it to 16 -- the formattedHeight of it
   set the width of it to 16 -- the formattedWidth of it
   set the name of it to "firstIcon"
   
   create button "secondIcon"
   set the visible of it to true
   put the long ID of it into scdIcn
   set the opaque of it to false
   set the showBorder of it to false
   set the showName of it to false
   set the autoHilite of it to false
   set the sharedHilite of it to false
   set the traversalOn of it to false
   set the threeD of it to false
   set the hiliteBorder of it to false
   set the borderWidth of it to 0
   set the margins of it to 0
   set the name of it to empty
   set the textSize of it to 1
   set the icon of it to "xpopen.gif"
   set the height of it to 16 -- the formattedHeight of it
   set the width of it to 16 -- the formattedWidth of it
   set the name of it to "secondIcon"
   
   create button "thirdIcon"
   set the visible of it to true
   put the long ID of it into thdIcn
   set the opaque of it to false
   set the showBorder of it to false
   set the showName of it to false
   set the autoHilite of it to false
   set the sharedHilite of it to false
   set the traversalOn of it to false
   set the threeD of it to false
   set the hiliteBorder of it to false
   set the borderWidth of it to 0
   set the margins of it to 0
   set the name of it to empty
   set the textSize of it to 1
   set the icon of it to "property.png"
   set the height of it to 16 -- the formattedHeight of it
   set the width of it to 16 -- the formattedWidth of it
   set the name of it to "thirdIcon"
   
   create field "nodeText"
   set the fixedLineHeight of it to false
   set the margins of it to 4,8,4,0
   set the lockText of it to true
   set the autoHilite of it to false
   set the listBehavior of it to false
   set the dontWrap of it to true
   set the showBorder of it to false
   set the borderWidth of it to 1
   set the threeD of it to false
   set the borderColor of it to "gray"
   set the visible of it to true
   set the sharedText of it to true
   set the textSize of it to empty
   set the textFont of it to empty
   put the long ID of it into ndeTxt
   set the opaque of it to false
   set the height of it to 16
   set the width of it to 64
   
   create graphic "firstBadge"
   put the long ID of it into frtBde
   set the style of it to "roundRect"
   set the roundRadius of it to 6
   set the opaque of it to true
   set the backgroundColor of it to "gray"
   set the showName of it to true
   set the margins of it to 2,2,2,6
   set the height of it to 16
   set the width of it to 32
   
   group ndeBcd and frtIcn and scdIcn and thdIcn and ndeTxt and frtBde
   put the long ID of the last group into tLongNodeTemplateID
   set the behavior of tLongNodeTemplateID to the long id of button "nodeBehavior" of card "Engine" of stack "rTreeEngine"
   set the lockLoc of tLongNodeTemplateID to false
   set the borderWidth of the last group to 0
   set the showBorder of the last group to false
   set the threeD of the last group to false
   set the hiliteColor of the last group to 193,196,227
   set the backgroundColor of the last group to empty
   set the margins of the last group to 0
   set the name of the last group to "nodeTemplate"
   set the left of frtIcn to the left of the last group
   set the top of frtIcn to the top of the last group
   set the left of scdIcn to the right of frtIcn
   set the top of scdIcn to the top of the last group
   set the left of thdIcn to the right of scdIcn
   set the top of thdIcn to the top of the last group 
   set the left of ndeTxt to the right of thdIcn
   set the top of ndeTxt to the top of the last group
   set the top of frtBde to the top of the last group
   set the height of the last group to 16
   set the width of the last group to the width of tLongTreeID
   set the right of frtBde to the right of the last group
   set the rectangle of ndeBcd to the rectangle of the last group
   set the lockLoc of tLongTreeID to false
   # Set Tree properties
   set the autoScrollbar of tLongTreeID to false
   set the autoStartUsing of tLongTreeID to true
   set the betweenNodesDelta of tLongTreeID to 4
   set the clickIcon of tLongTreeID to empty
   set the clickNode of tLongTreeID to empty
   set the copyBetweenTrees of tLongTreeID to false
   set the depthDelta of tLongTreeID to 12
   set the dontChangeNodeIDs of tLongTreeID to false
   set the editNodeOnDoubleClick of tLongTreeID to true
   set the fileIcon of tLongTreeID to empty
   set the firstIconCollapsed of tLongTreeID to "10500" # Minus Icon. 
   set the firstIconExpanded of tLongTreeID to "10501" # Plus Icon.
   set the secondIconCollapsed of tLongTreeID to empty
   set the secondIconExpanded of tLongTreeID to empty
   set the thirdIconCollapsed of tLongTreeID to empty
   set the thirdIconExpanded of tLongTreeID to empty
   set the hilitedNodeIDs of tLongTreeID to empty
   set the hiliteOnMouseUp of tLongTreeID to true
   set the lastNodeID of tLongTreeID to empty
   set the mouseNode of tLongTreeID to empty
   set the newNodeOnReturn of tLongTreeID to true
   set the nodeIDs of tLongTreeID to empty
   set the rtLineInc of tLongTreeID to 1
   set the rtPageInc of tLongTreeID to 5
   set the showInvisibleNodes of tLongTreeID to false
   set the shownNodeIDs of tLongTreeID to empty
   set the treeType of tLongTreeID to empty
   set the useContextMenu of tLongTreeID to true
   set the useConnectionLines of tLongTreeID to true
   set the useFirstBadge of tLongTreeID to false
   set the useMomentumScroll of tLongTreeID to false
   set the useDragIndicator of tLongTreeID to true
   set the useMultipleHilites of tLongTreeID to true
   set the useNoncontiguousHilites of tLongTreeID to true
   set the visibleNodeIDs of tLongTreeID to empty
   set the useFirstIcon of tLongTreeID to true
   set the useSecondIcon of tLongTreeID to false
   set the useThirdIcon of tLongTreeID to false
   set the fileIcon of tLongTreeID to empty
   # End - Set Tree properties
   set the groupEditMode of stack "rTreeEngine" to false
   stop editing tLongTreeID
   
   dispatch "calibrateScrollbar" to scrollbar "VerticalScrollbar" of tLongTreeID
   dispatch "updateGeometry" to tLongTreeID
   
   
   unlock messages
   unlock screen
   choose pointer tool
   select tLongTreeID
   set the lockLoc of tLongTreeID to true
   -- pass new_rTree
end new_rTree

/*
on saveStackRequest
   if the long id of this stack is in the long id of me
   then
      lock screen
      if the short name of this stack is among the lines of revLoadedStacks("application")
      then
         repeat for each line tStack in revLoadedStacks("application")
            repeat with i = 1 to the number of cards of stack tStack
               repeat for each line tGroup in the groupIDs of card i of stack tStack
                  if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
                  then
                     put the long id of group id tGroup of card i of stack tStack into tLongTreeID
                     set the lockLoc of tLongTreeID to true
                     dispatch "savePersistentData" to tLongTreeID
                  end if
               end repeat
            end repeat
         end repeat
      end if
      unlock screen
   end if
   pass saveStackRequest
end saveStackRequest
*/

/*
on newCard
   if the long id of this stack is in the long id of me
   then
   repeat for each line tStack in revLoadedStacks("application")
      repeat with i = 1 to the number of cards of stack tStack
         repeat for each line tGroup in the groupIDs of card i of stack tStack
            if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
            then
               put the long id of group id tGroup of card i of stack tStack into tLongTreeID
            end if
         end repeat
      end repeat
   end repeat
   end if
   pass newCard
end newCard
*/

/*
on deleteCard
   if the long id of this stack is in the long id of me
   then
      
   end if
   pass deleteCard
end deleteCard
*/

/*
on SetDialogProperties
   repeat with x = 1 to the number of controls of stack "Answer Dialog"
      set the textFont of control x of stack "Answer Dialog" to the textFont of me
      set the textSize of control x of stack "Answer Dialog" to the textSize of me
   end repeat
   repeat with x = 1 to the number of controls of stack "Ask Dialog"
      set the textFont of control x of stack "Ask Dialog" to the textFont of me
      set the textSize of control x of stack "Ask Dialog" to the textSize of me
   end repeat
end SetDialogProperties
*/

/*
on preOpenCard
   if the long id of this stack is in the long id of me
   then
      lock screen
      if sFirstRun is false
      then
         repeat for each line tStack in revLoadedStacks("application")
            repeat with i = 1 to the number of cards of stack tStack
               repeat for each line tGroup in the groupIDs of card i of stack tStack
                  if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
                  then
                     put the long id of group id tGroup of card i of stack tStack into tLongTreeID
                  end if
               end repeat
            end repeat
         end repeat
      end if
      unlock screen
   end if
   pass preOpenCard
end preOpenCard
*/

on closeStackRequest
   if the long id of this stack is in the long id of me
   then
      put the location of this stack into tStackLoc
      -- SetDialogProperties
   end if
   pass closeStackRequest
end closeStackRequest

function TheLongRelativeID theReference
   local tStackPath
   local tStackName
   local tLongID
   if theReference is a number
   then
      put "control id " before theReference
   end if
   put the long id of theReference into tLongID
   set the itemDelimiter to "/"
   put item - 1 of tLongID into tStackPath
   set the itemDelimiter to "."
   put item 1 to - 2 of tStackPath into tStackName
   set the itemDelimiter to comma
   return word 1 to - 2 of tLongID && quote & tStackName & quote
end TheLongRelativeID

function TheLongRelativeName theReference
   local tStackPath
   local tStackName
   local tLongID
   if theReference is a number
   then
      put "control id " before theReference
   end if
   put the long name of theReference into tLongID
   set the itemDelimiter to "/"
   put item - 1 of tLongID into tStackPath
   set the itemDelimiter to "."
   put item 1 to - 2 of tStackPath into tStackName
   set the itemDelimiter to comma
   return word 1 to - 2 of tLongID && quote & tStackName & quote ###
end TheLongRelativeName
