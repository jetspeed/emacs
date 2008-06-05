;; session.el
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
;; desktop
(require 'desktop)
(desktop-load-default) 
;; when changed to -D 2007-08-22 the line below should be commented out
;; (desktop-read)
(desktop-save-mode 1)
