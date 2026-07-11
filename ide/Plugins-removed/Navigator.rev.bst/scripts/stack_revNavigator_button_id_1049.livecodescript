Script "stack_revNavigator_button_id_1049"

/*
# Name: button "whichCard" of card "display" of stack "revNavigator"
# ID: button id 1049 of card id 1002 of stack "revNavigator"
# Hash: TypLz7b39S+WHYr3c3GCxg==
*/


global gSBWhichStack,gSBWhichCard,gSBCardOrBackground,gSBWhichBackground,gSBThisStack
global gSBShowList
local tMustUpdate
on mouseDown
  put the pMenuLimit of stack gSBThisStack into tMenuLimit
  if the optionKey is "down" then
    put "Background List" & cr into tDefault
    if gSBCardOrBackground is not "background" then put true into tMustUpdate
    put "background" into gSBCardOrBackground
    if gSBWhichStack is "the topStack" then
      put the backgroundNames of the topStack into tList
    else
      put the backgroundNames of stack gSBWhichStack into tList
    end if
  else
    put "this card" & cr & "Card List" & cr into tDefault
    if gSBCardOrBackground is not "card" then put true into tMustUpdate
    put "card" into gSBCardOrBackground
    if gSBWhichStack is "the topStack" then
      put the cardNames of the topStack into tList
    else
      put the cardNames of stack gSBWhichStack into tList
    end if
  end if
  if the shiftKey is "down" then
    sort lines of tList
  end if
  put (tDefault & "-" & cr) before tList
  if the number of lines of tList > tMenuLimit then put line 1 to tMenuLimit of tList into tList
  replace "/" with "//" in tList
  put tList into me
end mouseDown

on menuPick pWhich
  if gSBCardOrBackground is "background" then
    put (the menuHistory of me is 1) into gSBShowList
    if tMustUpdate or pWhich is not gSBWhichBackground then
      put pWhich into gSBWhichBackground
      if pWhich is empty then
        put "card" into gSBCardOrBackground
        put "this card" into gSBWhichCard
      end if
      updateDisplay true
    end if
  else if the commandKey is "down" and (the menuHistory of me > 2) then
    if gSBWhichStack is "the topStack" then
      put the short name of the topStack into tStack
      go cd pWhich of stack tStack
    else
      go cd pWhich of stack gSBWhichStack
    end if
  else
    put (the menuHistory of me is 2) into gSBShowList
    --answer pWhich && gSBWhichCard
    if tMustUpdate or pWhich is not gSBWhichCard then
      if pWhich is empty then
        put "this card" into gSBWhichCard
      else
        put pWhich into gSBWhichCard
      end if
      updateDisplay true
    end if
  end if
  put false into tMustUpdate
end menuPick
