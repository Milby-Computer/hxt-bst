Script "stack_revGettingStartedScripts_graphic_id_1227"

/*
# Name: graphic "Color Swatch" of group "Setting an RGB color channel of an object Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: graphic id 1227 of group id 1223 of card id 1002 of stack "revGettingStartedScripts"
# Hash: 3pJG1s5yAstllzwT/KvQ2Q==
*/


setProp redChannel theValue
  -- make sure theValue is between zero and 255:
  put max(min(theValue,255),zero) into theValue
  get the backgroundColor of the target
  if the number of items of it is not 3 then
    -- use trick to convert to RGB triplet:
    set the backgroundPixel of the target \
      to the backgroundPixel of the target
    get the backgroundColor of the target
  end if
  -- change the first item - red - to new value:
  put theValue into item 1 of it
  set the backgroundColor of the target to it
end redChannel

setProp greenChannel theValue
  -- make sure theValue is between zero and 255:
  put max(min(theValue,255),zero) into theValue
  get the backgroundColor of the target
  if the number of items of it is not 3 then
    -- use trick to convert to RGB triplet:
    set the backgroundPixel of the target \
      to the backgroundPixel of the target
    get the backgroundColor of the target
  end if
  -- change the second item - green - to new value:
  put theValue into item 2 of it
  set the backgroundColor of the target to it
end greenChannel

setProp blueChannel theValue
  -- make sure theValue is between zero and 255:
  put max(min(theValue,255),zero) into theValue
  get the backgroundColor of the target
  if the number of items of it is not 3 then
    -- use trick to convert to RGB triplet:
    set the backgroundPixel of the target \
        to the backgroundPixel of the target
    get the backgroundColor of the target
  end if
  -- change the third item - blue - to new value:
  put theValue into item 3 of it
  set the backgroundColor of the target to it
end blueChannel
