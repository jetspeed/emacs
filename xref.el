;; (setq load-path (cons "~/.emacs.d/myBigEmacs/xref/emacs" load-path))
;; (setq exec-path (cons "~/.emacs.d/myBigEmacs/xref" exec-path))
;; (load "xrefactory")

(defun my-xref-hook()
  (defvar xref-current-project nil) ;; can be also "my_project_name"
  (defvar xref-key-binding 'local) ;; can be also 'local or 'none
  (setq load-path (cons "~/.emacs.d/myBigEmacs/xref/emacs" load-path))
  (setq exec-path (cons "~/.emacs.d/myBigEmacs/xref" exec-path))
  (load "xrefactory")
  )

(add-hook 'c-mode-common-hook 'my-xref-hook)
