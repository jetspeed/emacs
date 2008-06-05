;; todo-add-category添加新的分类。
(setq diary-file "~/.emacs.d/diary/diary")
(setq todo-file-do "~/.emacs.d/diary/do")
(setq todo-file-done "~/.emacs.d/diary/done")
(setq todo-file-top "~/.emacs.d/diary/top")

;;约会提醒的建绑定
;(global-set-key (kbd "s-c a") 'appt-add)
;(global-set-key (kbd "s-c d") 'appt-delete)
;; 约会提醒，使用appt-add和appt-delete来添加删除
(appt-activate 1)
(add-hook 'diary-hook 'appt-make-list)
(add-hook 'diary-hook '(lambda () (auto-fill-mode t)))
(diary 0)
;; appointment alarm setting in calendar
(setq appt-issue-message t)
(setq appt-display-mode-line t)
; time duration in secondes for reminder window
(setq appt-display-duration 600) 
(setq appt-display-diary nil)
