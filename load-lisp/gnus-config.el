(setq gnus-select-method '(nntp "news.cn99.com"))
;; here set for pop3
;;; (setq mail-sources
;;;       '(
;;;         (pop :server "pop.163.com"
;;;              :user   "shmimy-w"
;;;              :port   "pop3"
;;;              :password "shmimy-w")
;;;         (file :path "/home/wangxq/Mail/python")))

(setq mail-sources '((file :path "~/.mail/inbox")
                     (file :path "~/.mail/other")))
;; where to store mail
(setq gnus-secondary-select-methods '((nnfolder "")))
;; here to set smtp
(load "smtpmail")
(setq smtpmail-auth-credentials
      '(("smtp.163.com"
         25
         "shmimy-w"
         "shmimy-w")))
(setq smtpmail-default-smtp-server "smtp.163.com")
(setq smtpmail-smtp-service 25)
(setq smtpmail-smtp-server "smtp.163.com")
(setq smtp-sever "smtp.163.com")
(setq message-send-mail-function 'smtpmail-send-it)
(setq send-mail-function 'smtpmail-send-it)
;; subscribe news group
(setq gnus-default-subscribed-newsgroups
      '("cn.bbs.comp.emacs"))
;; leave msg on the server
(setq pop3-leave-mail-on-server t)

(defun prefer-gb2312 ()
  (setq mm-coding-system-priorities
        '(iso-8859-15 gb2312 utf-8)))
(defun prefer-utf-8 ()
  (setq mm-coding-system-priorities
        '(iso-8859-15 utf-8)))

(setq gnus-posting-styles
      '(((message-mail-p)
         (name "wangxq")
         (From "shmimy-w@163.com")
         (eval (prefer-utf-8))
         (signature-file "~/Mail/.signature"))
;;;         ("^cn\\.bbs.*"
        ((message-news-p)
         (name "jetspeed")
         (From "jetspeed@newsmth.org")
         (eval (prefer-gb2312))
         (signature-file "~/Mail/.qmd"))
        ("rdcps"
         (name "wangxq")
         (From "wangxq <shmimy-w@163.com>")
         (eval (prefer-utf-8)))))

;; 给文章排序
;; 默认新文章在最下面，不合有些人的习惯，改改好了。
;; summary buffer sorting
(setq gnus-thread-sort-functions
      '(
        (not gnus-thread-sort-by-number)
        (not gnus-thread-sort-by-date)
        ))

;; 定义新闻资源配置文件的位置，这个默认是~/.newsrc，不好管理。
;; startup file
(setq gnus-startup-file "~/.emacs.d/backup/newsrc")
;;; 下面是窗口模样
(gnus-add-configuration
 '(article
   (vertical 1.0
             (summary .4 point)
             (article 1.0))))

;;; (gnus-add-configuration
;;;  '(article
;;;    (horizontal 1.0
;;;            (vertical 25
;;;              (group 1.0))
;;;            (vertical 1.0
;;;              (summary 0.4 point)
;;;              (article 1.0)))))
;;; (gnus-add-configuration
;;;  '(summary
;;;    (horizontal 1.0
;;;            (vertical 25
;;;              (group 1.0))
;;;            (vertical 1.0))))

;; 消除乱七八糟的启动配置文件。
(setq gnus-save-newsrc-file nil)
(setq gnus-read-newsrc-file nil)

;; 设置行模式
;; 默认的标题模式乱七八糟，稍稍设置一下就整齐好看了。
;; group buffer line format
(setq gnus-group-line-format "%M%S%p%P%5y:%B%(%g%)%l %O\n")
;; summary buffer line format
(setq gnus-summary-line-format
        ":%U%R %B %s %-60=|%3L|%-20,20n|%&user-date; \n")
;;; 分组与设置保质期
(setq nnmail-split-methods
       '(("bird" "^From:.*birdmqwq.*")
         ("mail.misc" "")))
(setq gnus-auto-expirable-newsgroups
      "nnfolder:mail.misc\\|cn.bbs.comp.*")

(setq nnmail-expiry-wait-function
  (lambda (group)
    (cond ((string= group "mail.misc")
            5)
          ((string= group "bird")
            'never)
          (t
            6))))
;; 不取回已读的新闻标题
;; 这样想看老文章的时候可以用A T或者^，前者取回当前话题的所有文章，后者取回相
;; 关话题的前一篇。
;; fetch old，no.
(setq gnus-fetch-old-headers nil)
;; 保留我所发的邮件或帖子的副本
;; 这是类似“发件箱”的咚咚，最有用的功能之一。
(setq gnus-message-archive-group
      '((if (message-mail-p)
          "nnfolder:sent")))

;; 新闻组分组
;; 有时订阅了很多新闻组，堆在一起不好管理。这个功能可以创建目录来分层管理
;; 这些新闻组。
;; group topic
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; 现在可以在group buffer里面M-x gnus-topic-create-topic来创建一个"topic"，
;; 然后将某个新闻组或者其他topic给C-k掉，再移动到你创建的topic下C-y，就可以
;; 将它们收到这个topic下。
;; topic的好处除了分层之外，还有就是可以将不常看的topic折叠起来，不要显示。
;; 就像下面这样。
;;
;; [ Gnus -- 0 ]
;;   [ MAIL -- 3 ]...
;;   [ NEWS -- 0 ]
;;     [ emacs -- 0 ]
;;            *: nntp+binghe.6600.org:gnu.emacs.help
;;            *: nntp+binghe.6600.org:gnu.emacs.gnus
;;     [ 人文与社会 -- 0 ]
;;       [ 语言 -- 0 ]
;;              *: nntp+news.newsfan.net:教育就业.外语.日语
;;              *: nntp+news.newsfan.net:教育就业.外语.英语
;;   [ misc -- 0 ]...
;;
;; 参考 gnus info -> Group Buffer -> Group Topics


;;; below for bbdb
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/bbdb-2.35/lisp/")
(require 'bbdb)
(bbdb-initialize 'gnus 'message)

;; bbdb 自己检查你填写的电话是否符合北美标准，
;; 如果你不是生活在北美，应该取消这种检查
(setq bbdb-north-american-phone-numbers-p nil)
;;; 设置数据库文件
(setq bbdb-file "~/.emacs.d/myEmacs/load-lisp/bbdb")
;; 把你的 email 地址告诉 bbdb
(setq bbdb-user-mail-names
      (regexp-opt '("shmimy-w@163.com"
                    "ibatis2@163.com")))
;; 补全 email 地址的时候循环往复
(setq bbdb-complete-name-allow-cycling t)
;; No popup-buffers
(setq bbdb-use-pop-up nil)
