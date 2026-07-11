Script "stack_revDocsColor_Names_Reference_bkgnd_id_2803"

/*
# Name: bkgnd "Swatches" of stack "revDocsColor Names Reference"
# ID: bkgnd id 2803 of stack "revDocsColor Names Reference"
# Hash: CvTAwRq2/fyVKugWQ3nUVQ==
*/


on mouseDown
  if the owner of the target is not me then pass mouseDown
  put the short name of the target into field "Color Name"
  put "RGB:" && the numericColor of the target into field "RGB"
  put "HTML:" && the htmlColor of the target into field "HTML"
  set the backgroundColor of graphic "Large Swatch" to the short name of the target
end mouseDown
