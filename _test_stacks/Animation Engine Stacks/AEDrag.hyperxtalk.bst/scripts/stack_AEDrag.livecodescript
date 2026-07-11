Script "stack_AEDrag"

/*
# Name: stack "AEDrag"
# ID: stack "AEDrag"
# Hash: njuK9twVDuZxNeRlH3eDPg==
*/


----•• use this version when using the animation engine alias from the finder
--on openStack
--   if "animationEngine" is not among the lines of the stacksInUse then
--      if "animationEngine" is not among the lines of the openStacks then
--         start using stack (specialFolderPath("resources") &  "/animationEngine.livecode")
--      else
--         answer error "Animation Engine must be in use for this to work !" as sheet
--      end if
--   end if
--end openStack
