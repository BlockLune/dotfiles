; Comments
(comment) @comment

; Tag names
(tag_name) @tag

; WeChat Mini Program specific tags
((tag_name) @tag.builtin
  (#any-of? @tag.builtin "wxs" "template" "import" "include" "slot" "block"))

; Attributes
(attribute_name) @tag.attribute
(attribute_value) @string
(quoted_attribute_value) @string

; Entity references
(entity) @string.escape

; Raw text (primarily for wxs JavaScript content)
(raw_text) @markup.raw

; Interpolation expressions
(interpolation) @punctuation.special
(expression) @markup.strong

; Import and include statements
(import_statement) @keyword.import
(include_statement) @keyword.import

; WeChat specific directive attributes
((attribute_name) @keyword.directive
  (#lua-match? @keyword.directive "^wx:"))

; Event binding attributes
((attribute_name) @keyword
  (#match? @keyword "^(bind|catch|mut-bind):?"))

; Data binding attributes
((attribute_name) @keyword
  (#match? @keyword "^(model:|data-)"))

; Special attributes
((attribute_name) @property
  (#any-of? @property "slot" "is" "module" "src"))

; Punctuation and operators
"<" @punctuation.bracket
">" @punctuation.bracket
"</" @punctuation.bracket
"/>" @punctuation.bracket
"=" @operator

; Quotes in attributes
"\"" @punctuation.delimiter
"'" @punctuation.delimiter
