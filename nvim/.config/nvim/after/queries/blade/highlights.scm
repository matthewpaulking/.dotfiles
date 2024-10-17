(directive) @function
(directive_start) @function
(directive_end) @function
(comment) @comment

;INFO: no idea why commenting out these lines fixes the highlighting
;https://github.com/EmranMR/tree-sitter-blade/discussions/19#discussioncomment-8768127
;((parameter) @include (#set! "priority" 110))
;((php_only) @include (#set! "priority" 110))

((bracket_start) @function (#set! "priority" 120))
((bracket_end) @function (#set! "priority" 120))
(keyword) @function
