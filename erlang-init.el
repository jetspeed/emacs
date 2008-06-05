(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.4.5/emacs")
(add-to-list 'load-path "/home/wangxq/.emacs.d/myBigEmacs/distel/elisp")

(require 'erlang-start)

(require 'distel)
(distel-setup)

(add-hook 'erlang-mode-hook
  (lambda ()
    (define-key erlang-mode-map (kbd "C-c p m") 'tempo-template-erlang-module)
  ))