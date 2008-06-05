设置键绑定。
(defvar mykeyf2-mode-map
  (let ((map (make-sparse-keymap)))

    (define-key map [f2] 'zl-fn)
    (define-key map "4" 'set-mark-command)
    (define-key map "b" 'muse-blosxom-new-entry)
;   (define-key map "" 'ibuffer) ;;当前buffer列表
    (define-key map "B" 'browse-kill-ring)
    (define-key map "d" 'zl-speedbar-no-separate-frame)
    (define-key map "D" 'dired-jump);;当前文件所在目录
    (define-key map "e" 'zl-site-start)  ;;site-start.el
    (define-key map "g" 'wy-go-to-char)
    (define-key map "i" 'ispell)
    (define-key map "I" 'zl-insert-current-date-and-time)  ;;当前日期和时间
    (define-key map "l" 'list-bookmarks)
    (define-key map "M" 'zl-diary) ;;
    (define-key map "p" 'zl-planner) ;;
    (define-key map "r" 'recentf-open-files)
    (define-key map "t" 'zl-todo-do) ;;
    map))

(fset 'mykeyf2-command mykeyf2-mode-map)
(global-set-key [f2]  'mykeyf2-command)


smart-snippet.el
地址：http://code.google.com/p/smart-snippet/downloads/list