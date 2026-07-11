Script "stack_revPreferencesGUI_scrollbar_id_1236"

/*
# Name: scrollbar "Cache validity" of group "Cache options" of group "revOnline" of card "RevOnline" of stack "revPreferencesGUI"
# ID: scrollbar id 1236 of group id 1229 of group id 1223 of card id 1014 of stack "revPreferencesGUI"
# Hash: ETkt+Ne+0CE5XeVPQLUgzA==
*/


getProp cThumbPosition
   return the thumbPosition of me * 1024
end cThumbPosition

setProp cThumbPosition pPosition
   set the thumbPosition of me to pPosition div 1024
end cThumbPosition
