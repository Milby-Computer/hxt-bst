Script "stack_revApplicationOverview_button_id_1196"

/*
# Name: button "Control Popup" of card "Cards and Controls" of stack "revApplicationOverview"
# ID: button id 1196 of card id 1002 of stack "revApplicationOverview"
# Hash: gMtTu8TlB9CZd5GrBgVCzw==
*/


on mouseRelease pButton
  if the clickLoc is within the rect of fld "Controls" then
    send "mouseDown pButton" to fld "Controls"
    send "mouseUp pButton" to fld "Controls"
  end if
end mouseRelease

on menuPick pWhich
   global gREVStackName
   put revSelControls() into tObjects
   switch pWhich
      case "Property Inspector"
         revIDEOpenInspectorForObjects tObjects
         break
      case "Edit Script"
         repeat for each line l in tObjects
            edit script of l
         end repeat
         break
      case "Cut"
         cut
         break
      case "Copy"
         copy
         break
      case "Paste"
         set the defaultStack to gREVStackName
         paste
         break
      case "Clear"
         put empty into tNames
         repeat for each line l in tObjects
            put the name of l & cr after tNames
         end repeat
         delete last char of tNames
         put "Are you sure you want to delete the following controls?" & cr & cr & tNames into tWarning
         answer warning tWarning with "No" or "Yes"
         if it is "Yes" then 
            repeat for each line l in tObjects
               delete l
            end repeat
         end if
         break
      case "Refresh"
         revRefreshControls true, false
         break
   end switch
end menuPick
