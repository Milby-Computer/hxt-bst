Script "stack_File_Attribs_card_id_1045"

/*
# Name: card "Controls" of stack "File Attribs"
# ID: card id 1045 of stack "File Attribs"
# Hash: L8G1SJ40kKnBs32HHm2tSA==
*/


local sProgressForward="true"
local sStopProgress="false"

on openCard
   set the thumbposition of scrollbar "progress1" to 0
   set the thumbposition of scrollbar "progress2" to 0
   
   put false into sStopProgress
   send "progress" to me in 0 milliseconds
end openCard

on closeCard
   put true into sStopProgress
end closeCard
on progress
   if sStopProgress then
      exit progress
   end if
   
   local tPos
   put the thumbposition of scrollbar "progress1" into tPos
   if sProgressForward then
      add 1 to tPos
      if tPos >= the endvalue of scrollbar "progress1" then
         put false into sProgressForward
      end if
   else
      subtract 1 from tPos
      if tPos <= the startvalue of scrollbar "progress1" then
         put true into sProgressForward
      end if
   end if
   set the thumbposition of scrollbar "progress1" to tPos
   set the thumbposition of scrollbar "progress2" to tPos
   send "progress" to me in 500 milliseconds
end progress
