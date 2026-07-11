Script "stack_revApplicationOverview_button_id_1197"

/*
# Name: button "Card Tabs Popup" of bkgnd "common menus" of stack "revApplicationOverview"
# ID: button id 1197 of bkgnd id 1606 of stack "revApplicationOverview"
# Hash: vUY5As/7yXNFyW8vOPDd0A==
*/


on menuPick pWhich
  global gREVObjectTree
  lock screen
  put revSelLineID() into tLineID
  if pWhich is "Reset Columns" then
    set the cCardTabs of grp "Card tabs" to 6,7,9
  else
    put the cCardTabs of grp "Card tabs" into tCardTabs
    put word 2 of the selectedLine of me into tLine
    if tLine < 5 then
      if (tLine + 7) is among the items of tCardTabs
      then delete item itemOffset((tLine + 7), tCardTabs) of tCardTabs
      else put comma&(tLine + 7) after tCardTabs
      sort items of tCardTabs numeric
      set the cCardTabs of grp "Card tabs" to tCardTabs
    end if
  end if
  revUpdateTree revTreeHtml(gREVObjectTree), tLineID
  put the cLastTab of grp "Card Tabs" into tTab
  set the rect of btn tTab of grp "Card Tabs" to the topLeft of btn tTab of grp "Card Tabs", \
      revLastTabRight(the long id of fld "Cards" of grp "Cards"), the bottom of btn tTab of grp "Card Tabs"
  unlock screen   
end menuPick
