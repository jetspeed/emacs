;;;; my smart-snippet config
(require 'smart-snippet)
(setq save-abbrevs nil)

;;; for c++-mode
(require 'cc-mode)
(smart-snippet-with-abbrev-tables
 (c++-mode-abbrev-table
  java-mode-abbrev-table)
  ("if" "if ($${condition}) {$>\n$>$.\n}$>" 'bol?)
  ("elif" "else if ($${condition}){\n$>$.\n}$>" 'bol?)
  ("else" "else {\n$>$.\n}$>" 'bol?)
  ("for" "for ($${init}; $${cond}; $${step}) {\n$>$.\n}$>" 'bol?)
  ("namespace" "namespace $${name} {\n$.\n} // namespace $${name}" 'bol?))

;; those non-word snippet can't be triggered by abbrev expand, we
;; need to bind them explicitly to some key
(smart-snippet-with-abbrev-tables
 (c++-mode-abbrev-table
  java-mode-abbrev-table)
  ("{" "{$.}" '(not (c-in-literal)))
  ("{" "{$>\n$>$.\n}$>" 'bol?)
  ;; if not in comment or other stuff(see `c-in-literal'), then
  ;; inser a pair of quote. if already in string, insert `\"'
  ("\"" "\"$.\"" '(not (c-in-literal)))	
  ("\"" "\\\"$." '(eq (c-in-literal) 'string))
  ;; insert a pair of parenthesis, useful everywhere
  ("(" "($.)" t)
  ;; insert a pair of angular bracket if we are writing templates
  ("<" "<$.>" '(and (not (c-in-literal))
			 (looking-back "template[[:blank:]]*")))
  ;; a pair of square bracket, also useful everywhere
  ("[" "[$.]" t)
  ;; a pair of single quote, if not in literal
  ("'" "'$.'" '(not (c-in-literal)))
  )

(smart-snippet-with-keymaps
 ((c++-mode-map c++-mode-abbrev-table)
  (java-mode-map java-mode-abbrev-table))
  ("{" "{")
  ("\"" "\"")
  ("(" "(")
  ("<" "<")
  ("[" "[")
  ("'" "'")
  )

;; jump out from a pair(like quote, parenthesis, etc.)
(defun kid-c-escape-pair ()
  (interactive)
  (let ((pair-regexp "[^])}\"'>]*[])}\"'>]"))
    (if (looking-at pair-regexp)
	(progn
	  ;; be sure we can use C-u C-@ to jump back
	  ;; if we goto the wrong place
	  (push-mark) 
	  (goto-char (match-end 0)))
      (c-indent-command))))
;; note TAB can be different to <tab> in X mode(not -nw mode).
;; the formal is C-i while the latter is the real "Tab" key in
;; your keyboard.
(define-key c++-mode-map (kbd "TAB") 'kid-c-escape-pair)
(define-key c++-mode-map (kbd "<tab>") 'c-indent-command)
;; snippet.el use TAB, now we need to use <tab>
(define-key snippet-map  (kbd "<tab>") 'snippet-next-field)