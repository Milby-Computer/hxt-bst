Script "stack_revGettingStartedScripts_group_id_1052"

/*
# Name: group "Text Menu: updating check marks Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: group id 1052 of card id 1002 of stack "revGettingStartedScripts"
# Hash: kxSnha6THtpwFvnC5FiDjw==
*/


on preOpenBackground
  set the textFont of field "Example Text" to empty
  set the textColor of field "Example Text" to empty
end preOpenBackground
 
on openBackGround
  put "9,10,12,14,18,20,24,36" into theSizes
  put "Black,Yellow,Red,Blue,Green" into theColors
  -- set up the Font submenu:
  get the fontNames
  sort it
  put "Font" into button "Text"
  repeat for each line thisFont in it
    put return & tab & thisFont after button "Text"
  end repeat
  -- set up the Size submenu:
  put return & "Size" after button "Text"
  repeat for each item thisSize in theSizes
    put return & tab & thisSize after button "Text"
  end repeat
  -- set up the Color submenu:
  put return & "Color" after button "Text"
  repeat for each item thisColor in theColors
    put return & tab & thisColor after button "Text"
  end repeat
  -- set up style choices:
  put return & "(-" & return \
      & "Plain" & return \
      & "Bold" & return \
      & "Italic" & return \
      & "Underline" after button "Text"
end openBackGround
