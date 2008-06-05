;; 加载显示行号模块
(require 'display-line-number)
;; 如果想所有打开的文件都显示行的话就打开下面的注释
;; (global-display-line-number-mode 1)
;; 设置显示格式
(setq display-line-number-format "%4d|")
;; 在 tool bar 上增加一个图标，
;; 注意: 一定要在 load-path 中 可以找到 display-line-nuber.xpm 文件才行。
;;
(tool-bar-add-item "display-line-number"
                   'display-line-number-mode
                   'display-line-number-mode
                   :help "display line number!"
                   :button (cons :toggle  '(and (boundp
                                                 display-line-number-mode)
                                                display-line-number-mode)))

;;
;; 使用方法
;; M-x display-line-number-mode
;; 用来 toggle 显示行号的模式
;; M-x display-line-number-mode-on
;; 启动显示行号的模式
;; M-x display-line-number-mode-off
;; 关闭显示行号的模式
;; 仅对某种 mode 启动显示行号的模式
(add-hook 'jde-mode-hook 'display-line-number-mode)