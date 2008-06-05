;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            here is my program.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "~/.emacs.d/myBigEmacs")
;; has moved to jde-init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;my;;          下面这一段都是关于代码折叠和补全的  嗯
;my;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;my;添加代码折叠
;my(load-library "hideshow")
;my(require 'hideshow nil t)
;my(when (featurep 'hideshow)
;my  (dolist (hook '(c++-mode-hook c-mode-hook))
;my    (add-hook hook 'hs-minor-mode)))

; 另一种代码折叠的方法  其实跟上面的一样
;将hs-minor-mode的前缀绑到C-o上面
(load-library "hideshow")
(setq hs-minor-mode-prefix (kbd "C-o o"))
(global-set-key (kbd "C-o o h") 'hs-hide-all)
(global-set-key (kbd "C-o o s") 'hs-show-all)
(global-set-key (kbd "C-o o b") 'hs-hide-block)
(global-set-key (kbd "C-o o v") 'hs-show-block)
(global-set-key (kbd "C-o o l") 'hs-hide-level)

(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'metapost-mode-hook 'outline-minor-mode)

;; Sets the basic indentation for Java source files
;; to two spaces.
(defun my-program-hook ()
  (setq c-basic-offset 4)

  ;; 此模式下，当按Backspace时会删除最多的空格
  (c-toggle-auto-hungry-state 1)
;;   use C-c C-a to change this state
  (c-toggle-auto-state 0)
  ;; (c-toggle-hungry-state)


  )

;; (defun my-jde-mode-semantic-hook ()
;;   (define-key jde-mode-map [(control tab)] 'my-indent-or-complete)
;;   (define-key jde-mode-map [(meta ?])] 'semantic-ia-complete-symbol-menu)
;; )
;; (add-hook 'jde-mode-hook 'my-jde-mode-semantic-hook)

(defun my-c-mode-semantic-hook ()
;;   (define-key c-mode-base-map [(control tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?])] 'semantic-ia-complete-symbol-menu)
)

(global-set-key [(control tab)] 'my-indent-or-complete)

(add-hook 'c-mode-common-hook 'my-c-mode-semantic-hook)


(add-hook 'jde-mode-hook  'my-program-hook)
(add-hook 'c++-mode-hook  'my-program-hook)
(add-hook 'c-mode-hook    'my-program-hook)
(add-hook 'ruby-mode-hook 'my-program-hook)


;; 自动识别ruby文件
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)

(setq auto-mode-alist
      (append '(("\\.C$"       . c++-mode)
                ("\\.rb$" . ruby-mode)
        ("\\.cc$"      . c++-mode)
        ("makefile$"   . makefile-mode)
        ("Makefile$"  . makefile-mode)
        ) auto-mode-alist))

(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
;my
;my;设置semantic的范围
;my(setq semanticdb-project-roots
;my   (list
;my        (expand-file-name "/")))
;my
;my;自定义补全命令，如果在单词中就补全，否则就tab
(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
      (hippie-expand nil)
      (indent-for-tab-command))
)


;; (autoload 'senator-try-expand-semantic "senator")

(setq hippie-expand-try-functions-list
      '(try-expand-line
        try-expand-line-all-buffers
        try-expand-list
        try-expand-list-all-buffers
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-file-name-partially
        try-complete-lisp-symbol
        try-complete-lisp-symbol-partially
        try-expand-whole-kill
        )
      )


;;;hippie补全
;; (setq hippie-expand-try-functions-list
;; '(try-expand-line
;; try-expand-line-all-buffers
;; try-expand-list
;; try-expand-list-all-buffers
;; try-expand-dabbrev
;; try-expand-dabbrev-visible
;; try-expand-dabbrev-all-buffers
;; try-expand-dabbrev-from-kill
;; try-complete-file-name
;; try-complete-file-name-partially
;; try-complete-lisp-symbol
;; try-complete-lisp-symbol-partially
;; try-expand-whole-kill))

