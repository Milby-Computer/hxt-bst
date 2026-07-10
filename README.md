# hxt-bst
HyperXTalk Binary Stack Tracker

This repository will mirror the main HyperXTalk repository but only contain
artifacts relating to the binary stack files that are a part of the repository.
The exported files will be `.rev`, `.livecode`, or `.hyperxtalk`.

Each commit will be labeled with a reference to the corresponding commit in the
main repository.  Initially the goal will be to include all of the tagged commits
for the versions that have been relased.  Going forward, branches could be added
to mirror PRs that are active to make it clear what changes are being made.

Each stack will be exported to a directory with `.bst` appended to the stack
file name.  At the top level there will be a hash file to quicly determine if
there are changes in the stack file that requires an export.  The main properties
of the stack will be contained in a JSON file.  Any long property (~255 bytes)
will be exported to a file in an `assets` folder.  All scripts will be exported
to the `scripts` folder.  A header will be added with the object's name and ID.
The first line will be in the format of a `livecodescript` file but no changes
are made to actually make these scripts actual behaviors.

Certain types of stack construction will make changes seem excessive.  One
example is the Data Grid.  Since the contained objects are created dynamically
it does not make sense to repeatedly update the stack export just for those
objects.  The hash will change, but the data grid objects are excluded from
exports to reduce the churn.  As other types of files are discovered, they
can be treated in a similary fashion.