;; smart compile 是一个非常好用的 elisp。它的设置也相当简单。只要对相应的后缀
;; 定义 compile 和 run 的命令就行了。格式也列在下面。
;; smart-executable-alist 是用来在调用 smart-run 时是否需要 compile。所以
;; 脚本一般都要加入到这个列表中。除非你只用 smart-compile 运行。
(require 'smart-compile+ nil t)
;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;;   %f  file name without directory  ( netscape.bin )
;;   %n  file name without extention  ( netscape )
;;   %e  extention of file name       ( bin )
(when (featurep 'smart-compile)
(setq smart-compile-alist
      '(("\\.c$"          . "g++ -o %n %f")
        ("\\.[Cc]+[Pp]*$" . "g++ -o %n %f")
        ("\\.java$"       . "javac %f")
        ("\\.f90$"        . "f90 %f -o %n")
        ("\\.[Ff]$"       . "f77 %f -o %n")
        ("\\.mp$"         . "runmpost.pl %f -o ps")
        ("\\.php$"        . "php %f")
        ("\\.tex$"        . "latex %f")
        ("\\.l$"          . "lex -o %n.yy.c %f")
        ("\\.y$"          . "yacc -o %n.tab.c %f")
        ("\\.py$"         . "python %f")
        ("\\.sql$"        . "mysql < %f")
        ("\\.sh$"         . "./%f")
        (emacs-lisp-mode  . (emacs-lisp-byte-compile))))
(setq smart-run-alist
      '(("\\.c$"          . "./%n")
        ("\\.[Cc]+[Pp]*$" . "./%n")
        ("\\.java$"       . "java %n")
        ("\\.php$"        . "php %f")
        ("\\.m$"          . "%f")
        ("\\.scm"         . "%f")
        ("\\.tex$"        . "dvisvga %n.dvi")
        ("\\.py$"         . "python %f")
        ("\\.pl$"         . "perl \"%f\"")
        ("\\.pm$"         . "perl \"%f\"")
        ("\\.bat$"        . "%f")
        ("\\.mp$"         . "mpost %f")
        ("\\.sh$"         . "./%f")))
(setq smart-executable-alist
      '("%n.class"
        "%n.exe"
        "%n"
        "%n.mp"
        "%n.m"
        "%n.php"
        "%n.py"
        "%n.pl"
        "%n.pm"
        "%n.bat"
        "%n.sh")))

;; (global-set-key (kbd "<f9> c") 'smart-compile)
;; (global-set-key (kbd "<f9> r") 'smart-run)
