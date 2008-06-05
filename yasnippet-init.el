(add-to-list 'load-path "~/.emacs.d/myBigEmacs/yasnippet/")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/myBigEmacs/yasnippet/snippets")
(setq yas/root-directory "~/.emacs.d/myBigEmacs/yasnippet/my-snippets")
(yas/load-directory yas/root-directory)

(define-prefix-command 'C-l-map)
(global-set-key (kbd "C-l") 'C-l-map)
(global-set-key (kbd "C-l c") 'recenter)

(setq yas/trigger-key (kbd "C-l ;"))
(setq yas/next-field-key (kbd "C-l n"))

(define-key yas/minor-mode-map yas/next-field-key 'yas/next-field-group)
(define-key yas/keymap (kbd "C-l p") 'yas/prev-field-group)
(define-key yas/keymap (kbd "C-l e") 'yas/exit-this-snippet)
(defun yas/exit-this-snippet ()
  (interactive)
  (let ((snippet (yas/snippet-of-current-keymap)))
    (yas/exit-snippet snippet))
  )
