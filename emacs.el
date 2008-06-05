;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;     外部包放在这里，
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;设置loadpath 已经在amacs中进行设置了。
;;color theme
(require 'color-theme)
;(color-theme-marquardt)
;;; (color-theme-infodoc)
;; (color-theme-hober)
;;(color-theme-tty-dark)
;;; 这里配置在不同的终端环境下用不同的color
(setq termtype (getenv "TERM"))
(cond
 ;;命令行界面
 ((equal termtype "linux")
  (color-theme-tty-dark))
 ;;Gnome-Terminal下
 ((equal termtype "xterm")
  (color-theme-aalto-light))
 ((equal termtype "screen")
  (color-theme-aalto-light))
 ;;窗口系统
 (t
  (color-theme-infodoc)))
;(load-file "/home/wangxq/.emacs.d/myEmacs/wordCount.el")
;(require 'wordCount)

;;gnus
(setq gnus-init-file "~/.emacs.d/myEmacs/load-lisp/gnus-config.el")

;;less mode
(require 'less)
(global-set-key (kbd "C-c l") 'less-minor-mode)

;;tabbar
(require 'tabbar)
(tabbar-mode)
;;tabbar-buffer-ignore-groups
;; (setq tabbar-buffer-groups-function 'tabbar-buffer-ignore-groups)
;;这几句的目的是绑定快捷键这样就可以直接用快捷键来操做了。
(global-set-key (kbd "s-h") 'tabbar-backward-group)
(global-set-key (kbd "s-l") 'tabbar-forward-group)
(global-set-key (kbd "s-k") 'tabbar-backward)
(global-set-key (kbd "s-j") 'tabbar-forward)

;; browse-kill-ring
(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; 加入smart-operator
;; 使用方法是选中区域 然后 smart-beautify-operator
(require 'smart-operator)
(global-set-key (kbd "C-c p o") 'smart-beautify-operator)
(global-set-key (kbd "<f7>") 'smart-insert-operator)
;; 加入bookmark，在 my-bookmark-jump中会用到
(require 'bookmark)

;; xcscope
(require 'xcscope)
(setq cscope-do-not-update-database t)

