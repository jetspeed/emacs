;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jde-init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/jde/lisp")

(add-to-list 'load-path "~/.emacs.d/myBigEmacs/cedet/common")
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/cedet/eieio")
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/cedet/semantic")


(add-to-list 'load-path "~/.emacs.d/myBigEmacs/ecb")
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/elib")

;; (load-file "~/.emacs.d/myBigEmacs/cedet/common/cedet.el")
;; (require 'cedet)

  (add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))
  (load-file "~/.emacs.d/myBigEmacs/cedet/common/cedet.el")
     (semantic-load-enable-code-helpers)
     (autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
     (autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
     (define-key-after (lookup-key global-map [menu-bar tools])
                                       [speedbar]
                                       '("Speedbar" .
                                       speedbar-frame-mode)
                                       [calendar])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;设置ecb
''''''''''''''''''''''''''''''''''''''''''''''''''
(require 'ecb)

;;添加jde的设置
;; If you want Emacs to defer loading the JDE until you open a 
;; Java file, edit the following line
;; to read:
;;
(setq defer-loading-jde t)
;这个是用来设置自动补全的？嗯
(setq jde-enable-abbrev-mode t)
;;
;(require 'jde)
(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	  (append
	   '(("\\.java\\'" . jde-mode))
		     auto-mode-alist)))
  (require 'jde))
;;防止emacs吃cpu，也不知道有用没有
(setq semantic-idle-scheduler-idle-time 432000)
;; 设置 semantic.cache的路径
(setq semanticdb-default-save-directory "~/.emacs.d/temp/semantic")

;;  java settings
(custom-set-variables
 '(jde-compiler (quote ("javac" "")))
 '(jde-complete-function (quote jde-complete-menu))
 '(jde-jdk-registry (quote (("1.5" . "/usr/lib/jvm/java-1.5.0-sun"))))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 )

(setq jde-compile-option-classpath (quote ("./"
										   "/home/wangxq/temp/"
										   "/home/wangxq/temp/javaStudy/"
										   "/usr/share/java/junit.jar"
;; 										   "../" "../../" "../../../"
;;                                            "d:/mysoft/java/jdk/lib/dt.jar"
;;                                            "d:/mysoft/java/jdk/lib/tools.jar"
;;                                         "~/../bin/apache-ant/lib/ant.jar"
;;                                         "D:/mysoft/webserver/resin_3_0_21/lib/jsdk-24.jar"
;;                                         "D:/website/cqtel.softreg.com/WEB-INF/lib/webpro2.jar"
;;                                         "D:/website/cqtel.softreg.com/WEB-INF/lib/xfire-all-1.2.2.jar"
                                           )))

;到这里打开ecb
;(require 'ecb)
;设置打开和关闭ecb的快捷键
(global-set-key (kbd "C-c j") 'ecb-activate)
(global-set-key (kbd "C-c q") 'ecb-deactivate)
;; 不显示ecb的提示
(setq ecb-tip-of-the-day nil)