Script "stack_File_Attribs_card_id_1782"

/*
# Name: card "Multi Channel Sound" of stack "File Attribs"
# ID: card id 1782 of stack "File Attribs"
# Hash: 2y4aHiyr2K0dNqJeFfaRZA==
*/


on soundFinishedOnChannel pChannel, pSound
   put "Sound" && pSound && "Finished on Channel" && pChannel && "Sent to" && the short name of the target & return before field 1
end soundFinishedOnChannel
