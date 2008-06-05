;;; smart-operator.el --- Beautify the operators in codes

;; Copyright (C) 2004 William Xu

;; Author: William Xu <william_xuuu@163.com>
;; Maintainer: William Xu <william_xuuu@163.com>
;; Created: 2004/09/01 08:03:50
;; Version: v 0.9
;; Keywords: convenience
;; Last updated: 2005/06/11 15:28:14

;; This file is not yet part of GNU Emacs.

;;{{{ GPL;; This program is free software; you can redistribute it and/or modify;; it under the terms of the GNU General Public License as published by;; the Free Software Foundation; either version 2, or (at your option);; any later version.;;;; This program is distributed in the hope that it will be useful,;; but WITHOUT ANY WARRANTY; without even the implied warranty of;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the;; GNU General Public License for more details.;;;; You should have received a copy of the GNU General Public License;; along with this program; if not, write to the Free Software;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.;;}}}

;;; Commentary:

;; This package can beautify the operators in your codes. Briefly, add
;; blanks before and after operators, e.g, "=" becomes " = ", "+="
;; becomes " += ". Try it out:

;; Set all the operators smart at one time, then ajust some at your will
;; e.g.

;; (defun my-c-mode-common-hook()
;;   (smart-insert-operator-hook)

;;   (local-unset-key (kbd \".\"))
;;   (local-unset-key (kbd \":\"))
;;   (local-set-key (kbd \"*\") 'c-electric-star))

;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Besides `smart-insert-operator' when writing, there's also
;; `smart-beautify-operator' to beautify ugly codes, be careful there
;; are still some unresolved issues in `smart-beautify-operator'!

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'smart-operator)

;;; Change Log:

;;; Todo:

;; Some unresolved issues in `smart-beautify-operator', such as:
;; 1. #include <stdio.h>
;; 2. printf("%s")

;;; Code:

;;; Variables:

(setq smart-operator-alist
      '( "=" "<" ">" "%" "\\+" "-" "\\*" "&" "|" "!" ":"))

;;; Functions:

(defun smart-insert-operator (string &optional arg)
  "Insert blanks before and after '=', '>=',etc. 
Make it look nicer: ' = ', ' >= '. 

STRING is the operator to insert.

If optional arg is t, only insert one blank at back.

When confused, C-q to avoid confusions."
  (interactive "s")
  (delete-horizontal-space)
  (backward-char)
  (let ((op nil))	
    (dolist (front smart-operator-alist)
      (setq op (or (looking-at front) op)))
    (forward-char)
    (if (or op arg)
	(insert string)
      (insert (concat " " string))))
  (delete-horizontal-space)
  (insert " "))

(defun fast-replace-regexp (regexp to-string &optional enhance)
  "Faster and won't set the mark or print anything.

If optional enhance is non-nil, call replace-regexp for its \& and \D
functionity."
  (save-excursion
    (goto-char (point-min))
    (if enhance
	(replace-regexp regexp to-string nil)
      (while (re-search-forward regexp nil t)
	(replace-match to-string nil t)))))

(defun fast-replace (from to)
  "Faster and won't set the mark or print anything."
  (save-excursion
    (goto-char (point-min))
    (while (search-forward from nil t)
      (replace-match to nil t))))

(defun smart-beautify-operator (beg end)
  "Beautify the codes to my style, such as add blanks before and after
operators. Three steps:

    1.\" =\", \"= \" --> \" = \"
    2.\"  \" --> \" \"
    3.\"> =\" --> \">=\"

Note: As replace method has been called two times, so you have to undo
TWO times to get back to the original state! And be careful to mark whole
buffer, as there are some unresolved issues, such as \"#include <stdio.h>\"
would become \" #include < stdio.h > \" incorrectly!"
  (interactive "r")
  (save-excursion
    (narrow-to-region beg end)
    (message "beautifying operators...")
    (mapcar* '(lambda (from) (fast-replace from (concat " " from " ")))
	     '("=" ">" "<" "+" "-" "*" "/" "%" "|" "&" "!" ","))
    (fast-replace-regexp "\\ +" " " t)
    (mapcar* '(lambda (from to) (fast-replace from to))
	     '("> =" "< =" "= =" "+ +" "- -" "+ =" "- =" "* =" "/ =" "% =" 
	       "| |" "& &" "! !" "| =" "& =" "! =" 
	       " ," " / /" " / *" "* / " "* *" "< <")
	     '(">=" "<=" "==" "++" "--" "+=" "-=" "*=" "/=" "%=" 
	       "||" "&&" "!!" "|=" "&=" "!=" 
	       "," "//" "/*" "*/" "**" "<<"))
    (indent-region beg end nil)
    (message "beautifying operators...done.")
    (widen)))

;;; Hooks

(defun smart-insert-operator-hook ()
"Set all the operators smart at one time, then you can ajust some by hand,
e.g.

(defun my-c-mode-common-hook()
  (smart-insert-operator-hook)

  (local-unset-key (kbd \".\"))
  (local-unset-key (kbd \":\"))
  (local-set-key (kbd \"*\") 'c-electric-star))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)"

  (local-set-key (kbd "=") (lambda () (interactive) (smart-insert-operator "=")))
  (local-set-key (kbd "+") (lambda () (interactive) (smart-insert-operator "+")))
  (local-set-key (kbd "-") (lambda () (interactive) (smart-insert-operator "-")))
  (local-set-key (kbd "/") (lambda () (interactive) (smart-insert-operator "/")))
  (local-set-key (kbd "%") (lambda () (interactive) (smart-insert-operator "%")))
  (local-set-key (kbd "&") (lambda () (interactive) (smart-insert-operator "&")))
  (local-set-key (kbd "*") (lambda () (interactive) (smart-insert-operator "*")))
  (local-set-key (kbd "!") (lambda () (interactive) (smart-insert-operator "!")))
  (local-set-key (kbd "|") (lambda () (interactive) (smart-insert-operator "|")))
  (local-set-key (kbd "<") (lambda () (interactive) (smart-insert-operator "<")))
  (local-set-key (kbd ">") (lambda () (interactive) (smart-insert-operator ">")))
  (local-set-key (kbd ",") (lambda () (interactive) (smart-insert-operator "," t)))
  (local-set-key (kbd ".") (lambda () (interactive) (smart-insert-operator "." t)))
;; (local-set-key (kbd "\;") (lambda () (interactive) (smart-insert-operator "\;" t)))
  (local-set-key (kbd ":") (lambda () (interactive) (smart-insert-operator ":" t))))

(provide 'smart-operator)

;; Local variables:
;; folded-file: t
;; end:

;;; smart-operator.el ends here
