Script "stack_revIDESnippetViewer"

/*
# Name: stack "revIDESnippetViewer"
# ID: stack "revIDESnippetViewer"
# Hash: ZcgWg49Mx8MxnH3zgWov9A==
*/


on resizeStack
    revIDESnippetViewerResize
end resizeStack

on preOpenStack
   dispatch "setAsBehavior" to stack revIDEPaletteResourcePath("behaviors/revidesnippetviewerbehavior.livecodescript") with the long id of me
end preOpenStack
