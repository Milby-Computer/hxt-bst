Script "stack_revDocsSupported_Platforms_Reference"

/*
# Name: stack "revDocsSupported Platforms Reference"
# ID: stack "revDocsSupported Platforms Reference"
# Hash: yggJWfrZBtRMC7142w1BXQ==
*/



on preOpenStack
   set the _ideoverride of me to true
   
  set the textColor of char 1 to (the number of chars of field "Platforms List") \
         of field "Platforms List" to empty
end preOpenStack
