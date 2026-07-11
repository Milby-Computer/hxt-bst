Script "stack_revExample_card_id_1002"

/*
# Name: card "Example" of stack "revExample"
# ID: card id 1002 of stack "revExample"
# Hash: ZpwBmmotyYmHwHWtjeFPOQ==
*/


on preOpenStack
  lock screen
  put empty into fld "Plugin Message"
  put empty into fld "Transcript Message"
  put empty into fld "Target"
  put empty into fld "Time"
  put empty into fld "Log"
  unlock screen
end preOpenStack
