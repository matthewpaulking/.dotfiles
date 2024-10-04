;extends
((expression_statement
  (assignment_expression
    right: (_ 
      . (name) @_class_name
      (arguments 
        (argument 
          (string 
            (string_content) @injection.content
          )
        )
      )
    )
  )
)
(#eq? @_class_name "Expression")
(#set! injection.language "sql"))

((expression_statement
  (assignment_expression
    right: (_ 
      . (name) @_class_name
      (arguments 
        (argument 
          (encapsed_string
            (string_content) @injection.content
          )
        )
      )
    )
  )
)
(#eq? @_class_name "Expression")
(#set! injection.language "sql"))
; ((expression_statement
;   (assignment_expression
;     right: (object_creation_expression
;       name: (name) @_class_name
;       arguments: (arguments (argument 
;         (string (string_content) @injection.content)
;       ))
;     )
;   )
; )
; (#eq? @_class_name "Expression")
; (#set! injection.language "sql"))
; ((object_creation_expression
;   name: (name) @_class_name
;   arguments: (arguments (argument 
;     [(string (string_content) @injection.content)
;      (encapsed_string (string_content) @injection.content)]
;   ))
; )
; (#eq? @_class_name "Expression")
; (#set! injection.language "sql"))
