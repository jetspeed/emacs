;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;     �ⲿ���������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;����loadpath �Ѿ���amacs�н��������ˡ�
;;color theme
(require 'color-theme)
;(color-theme-marquardt)
;;; (color-theme-infodoc)
;; (color-theme-hober)
;;(color-theme-tty-dark)
;;; ���������ڲ�ͬ���ն˻������ò�ͬ��color
(setq termtype (getenv "TERM"))
(cond
 ;;�����н���
 ((equal termtype "linux")
  (color-theme-tty-dark))
 ;;Gnome-Terminal��
 ((equal termtype "xterm")
  (color-theme-aalto-light))
 ((equal termtype "screen")
  (color-theme-aalto-light))
 ;;����ϵͳ
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
;;�⼸���Ŀ���ǰ󶨿�ݼ������Ϳ���ֱ���ÿ�ݼ��������ˡ�
(global-set-key (kbd "s-h") 'tabbar-backward-group)
(global-set-key (kbd "s-l") 'tabbar-forward-group)
(global-set-key (kbd "s-k") 'tabbar-backward)
(global-set-key (kbd "s-j") 'tabbar-forward)

;; browse-kill-ring
(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; ����smart-operator
;; ʹ�÷�����ѡ������ Ȼ�� smart-beautify-operator
(require 'smart-operator)
(global-set-key (kbd "C-c p o") 'smart-beautify-operator)
(global-set-key (kbd "<f7>") 'smart-insert-operator)
;; ����bookmark���� my-bookmark-jump�л��õ�
(require 'bookmark)

;; xcscope
(require 'xcscope)
(setq cscope-do-not-update-database t)

