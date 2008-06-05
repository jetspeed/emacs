;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  一些散的设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 散设置的显示部分
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;默认的主模式
(setq default-major-mode 'text-mode)
;; 高亮显示当前行
;; (global-hl-line-mode t)
;;不要工具栏
(tool-bar-mode nil)
;;tab的宽度
(setq default-tab-width 4)
;在标题栏显示当前buffer
(setq frame-title-format "%b@@wangxq@@%f")
;; 设置用户名和邮件
(setq user-full-name "Xuanqiang Wang")
(setq user-mail-address "shmimy-w@163.com")
;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。很好玩阿，这个功能
(mouse-avoidance-mode 'animate)
;默认显示 80列就换行
(setq default-fill-column 80)
;; 默认打开路径
(setq default-directory "/home/wangxq/")
;; 在屏幕边缘 3 行时就滚动
(setq scroll-margin 3
      scroll-conservatively 10000)
;;不显示 Emacs 的开始画面。
(setq inhibit-startup-message t)
; 高亮显示匹配的括号。
(show-paren-mode 1)
;; 高亮显示选中区域
(transient-mark-mode t)
(column-number-mode t);显示列号
;在分割窗口的时候依然折行显示
(setq-default truncate-partial-width-windows nil)
;设置行间距

;; shell 中打开 ansi-color 支持。好像没有用，注释掉
;(add-hook 'diary-hook 'appt-make-list)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; 不要问 yes-or-no，只问 y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)
;; 防止不小心按到菜单中的 print 时，emacs 死掉
(fset 'print-buffer 'ignore)
(setq lpr-command "")
(setq printer-name "")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      散设置的功能部分
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;打开ido支持,这个模式在查找文件的时候很有用
(require 'ido)
(ido-mode t)

;; 使用emacsclient，在gnuserv还不行之前 注意在~/.bashrc中加了判断是不是在x下
;; (server-start)
;;使用bash
;; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
;; 如果是tex文件 就自动存为gbk编码.
(setq auto-coding-alist
       (append auto-coding-alist '(("\\.tex\\'" . gbk)                                 )))
;; ispell
(setq-default ispell-program-name "aspell")
;; ispell报告没有zh_CN错误
(setq ispell-extra-args '("--lang=en"))

;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)

(setq enable-recursive-minibuffers t);递归使用minibuffer

;取消备份~文件
(setq make-backup-files nil)

;;在minibuffer中启用部分补全功能
(partial-completion-mode t)
;;在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;;允许emacs和外部其他程序的粘贴,总之会变得很慢，还是不要了 。
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        键绑定的设置在这里
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-x\C-b" 'ibuffer)
;; C-x C-b 缺省的绑定很不好用，改成一个比较方便的 electric-buffer-list，执行
;; 之后：
;;     光标自动转到 Buffer List buffer 中；
;;     n, p   上下移动选择 buffer；
;;     S      保存改动的 buffer；
;;     D      删除 buffer。
;; 除此之外，不错的选择还有 ibuffer，不妨试试 M-x ibuffer。

;; 交换这两个按键。因为大多数情况下，回车后是要缩进的。
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)

;; ido模式的C-x k不好用
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; book-mark-jump 重绑为像ido一样
(global-set-key (kbd "C-x r b") 'my-bookmark-jump)

;; 在括号上时%跳到匹配的括号
(global-set-key "%" 'match-paren)

;;作记号,作完记号可以马上跳回来
(global-set-key (kbd "C-=") 'ska-point-to-register)
(global-set-key (kbd "C--") 'ska-jump-to-register)

;;我来绑定我的日历 嘿嘿
(global-set-key (kbd "<f8>") 'calendar)

;; ispell
(global-set-key (kbd "<f11>") 'ispell-buffer)

;; todo appt的绑定
;; 设置一个前缀
(define-prefix-command 's-c-a-map)
(global-set-key (kbd "s-c a") 's-c-a-map)
;添加appt和删除appt
(global-set-key (kbd "s-c a a") 'appt-add)
(global-set-key (kbd "s-c a d") 'appt-delete)

;; msf-abbrev的绑定
(global-set-key (kbd "C-c x l") 'msf-abbrev-goto-root)
(global-set-key (kbd "C-c x a") 'msf-abbrev-define-new-abbrev-this-mode)

;; 移动行的操作，件utils.el
;; 把M-z设成一个前缀吧 把zap-to-char绑到M-z z上面就行了
(define-prefix-command 'M-z-map)
(global-set-key (kbd "M-z") 'M-z-map)

;; 跳到某个字符
;; (define-key global-map (kbd "M-z a") 'my-go-to-char)
(global-set-key (kbd "M-z a") 'my-go-to-char)

(define-prefix-command 'M-z-l-map)
(global-set-key (kbd "M-z l") 'M-z-l-map)

(global-set-key (kbd "M-z z") 'zap-to-char)

(global-set-key   (kbd "M-z l j") 'my-move-line-down)
(global-set-key   (kbd "M-z l k") 'my-move-line-up)
(global-set-key   (kbd "M-z l m") 'my-dup-line-down)
(global-set-key   (kbd "M-z l s") 'ue-select-line-down-continued)

;;把设置mark的键绑定到C-c m  这样比C-@好一些
(global-set-key (kbd "M-z m") 'set-mark-command)

;; 注释
(global-set-key "\M-;" 'my-comment-current-line)
(global-set-key "\M-'" 'my-uncomment-current-line)

;; term
(global-set-key (kbd "C-c t") 'my-term-bash)
(global-set-key (kbd "s-c t") 'my-split-for-term)

;; bs.el,这是一个内部包
(define-prefix-command 'C-c-b-map)
(global-set-key (kbd "C-c b") 'C-c-b-map)
(global-set-key (kbd "C-c b b") 'bs-show)    ;; or another key
(global-set-key (kbd "C-c b p")  'bs-cycle-previous)
(global-set-key (kbd "C-c b n")  'bs-cycle-next)
(global-set-key (kbd "C-c b c")  'my-count-ce-word)

;; 为header绑定一个 C-c p前缀
;; 主要用来program用的
(define-prefix-command 'C-c-p-map)
(global-set-key (kbd "C-c p") 'C-c-p-map)
(global-set-key (kbd "C-c p c") 'wcy-c-mode-config-header)
(global-set-key (kbd "C-c p h") 'make-header)
(global-set-key (kbd "C-c p r") 'make-revision)
;; region comment
(global-set-key (kbd "C-c p C-c") 'comment-region)
(global-set-key (kbd "C-c p C-u") 'uncomment-region)

;; run python
(global-set-key (kbd "C-c p p") 'run-python)
(global-set-key (kbd "C-c p b") 'wangxq-muse-blosxom-new-entry)

;; 绑定F9为前缀，主要用来运行和编译程序，smart-compile用
(define-prefix-command 'f9-map)
(global-set-key (kbd "<f9>") 'f9-map)

(global-set-key (kbd "<f9> c") 'smart-compile)
(global-set-key (kbd "<f9> r") 'smart-run)
(global-set-key (kbd "<f9> p") 'run-python)
;; 为program绑定一个键前缀 M-p;; 为program绑定一个键前缀 M-p

;; 为outline重新指定几个好用的键,minor mode使用C-o
(define-prefix-command 'C-c-o-map)
(global-set-key (kbd "C-c o") 'C-c-o-map)

(global-set-key (kbd "C-c o h") 'hide-body)
(global-set-key (kbd "C-c o s") 'show-entry)
(global-set-key (kbd "C-c o a") 'show-all)

;;; 为hs-minor-mode重新指定一个前缀。
(define-prefix-command 'C-o-map)
(global-set-key (kbd "C-o") 'C-o-map)
(define-prefix-command 'C-o-o-map)
(global-set-key (kbd "C-o o") 'C-o-o-map)

;; 设置外部包的load地址
(add-to-list 'load-path "~/.emacs.d/myEmacs")
(add-to-list 'load-path "~/.emacs.d/myEmacs/load-lisp")



(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
