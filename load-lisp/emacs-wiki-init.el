;;;;;;;;;;;;;;;;;;;;;;;;;;; -*- Mode: Emacs-Lisp -*- ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs-wiki.el --- 
;; 
;; Filename: .emacs-wiki.el
;; Description: An emacs-wiki configuration template
;; Author: Yu Li
;; Maintainer: Yu Li
;; Created: Sun Jan 09 21:13:13 2005
;; Version: $Id: .emacs-wiki.el,v 1.2 2005/01/14 13:31:52 liyu Exp liyu $
;; Last-Updated: Fri Jan 14 13:30:22 2005
;;           By: Yu Li
;; Compatibility: Emacs21
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This file is not part of GNU Emacs.
;;
;; This is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2, or (at your option) any later
;; version.
;;
;; This is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
;; MA 02111-1307, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; ====================
;; Emacs Wiki配置模板说明
;; ====================
;;
;; 这是一个Emacs-wiki的配置文件模板，它的作用是
;;
;; - 集中常用的Emacs-wiki的配置选项在一个文件中
;; - 为新手提供一个入门指南
;; - 做为中文FAQ的补充，让大家可以少敲几个字:^)
;; - 针对中文Emacs用户解决一个中文的问题
;;
;; 这个模板的制作原因是出于对Emacs-wiki这个基于[[Emacs]]的Wiki系统喜爱
;; ，希望你也喜欢它，也欢迎你帮助我完善这个模板。
;;
;; =============
;; 下载、安装和使用
;; =============
;; 
;; * 下载
;;
;; 地址 http://liyu2000.nease.net/code/.emacs-wiki.el
;;
;; 模板以一个el文件形式（文件名.emacs-wiki.el）提供下载，在遵守GNU
;; Public License的原则下分发。
;;
;; * 安装
;;
;; 请将下载得到的文件置于硬盘某处（推荐放置在HOME文件夹，也就是.emacs的
;; 同一个目录），在你的.emacs中加入如下一行
;;
;;       (load-file "path/to/.emacs-wiki.el")
;;
;; 请将"path/to/"改成相应的路径（放置于HOME文件夹即为"~/"）。然后用最顺
;; 手的编辑器进入文件修改，仔细阅读其中的注释项，并且按照指示修改适应你
;; 的情况，然后保存。重新启动Emacs即可以开始使用Emacs-wiki。
;;
;; * 使用
;;
;; Emacs-wiki配置模板中的各项配置使用请参照模板中注释说明，或者参考
;; Emacs-wiki自带的文档、EmacsWikiNode、Emacs-wiki中文FAQ等资源。
;;
;; ========
;; 反馈和建议
;; ========
;;
;; 欢迎你反馈这个模板中存在的问题，也欢迎提出建议。你可以
;; - 在水木Emacs版发帖子留下你的问题和建议
;; - 直接发mail给我
;;
;; 由于Emacs本身的灵活性，因此请在提供反馈的同时也提供尽可能多的辅
;; 助信息（如使用什么版本的Emacs、安装了一些什么扩展等等）。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; =======
;; 修正记录
;; =======
;; 
;; RCS $Log: .emacs-wiki.el,v $
;; RCS Revision 1.2  2005/01/14 13:31:52  liyu
;; RCS * fix the mistake of typing in my-publishing-footer(thanks eyee@smth)
;; RCS
;; RCS Revision 1.1  2005/01/12 07:44:59  liyu
;; RCS Initial revision
;; RCS
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * 基本设置 *
;;
;;   都是Emacs-wiki的基本设置，请按照注释修改
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 主程序，必须包含进来
(require 'emacs-wiki)

;; 设置Wiki页面存储的目录，Wiki的源文件将存储至此
(setq emacs-wiki-directories '("~/Wiki/webpage"))
;; 设置publish的目录，生成的HTML页面将存储至此
(setq emacs-wiki-publishing-directory "~/publish/webpage")

;; 设置存储源文件使用的默认的文字编码，使用GB2312环境的可以将值更改为gb2312
(setq emacs-wiki-coding-default "gbk")
;; 设置发布HTML页面使用的charset（字符集），使用GB2312环境的可以将值更改为gb2312
(setq emacs-wiki-charset-default "gbk")

;; 设置你的mail地址，它将做为不存在页面的默认链接地址
(setq emacs-wiki-maintainer "mailto:yourname@your.host.com")

;; 更改默认页面的名字（一般不用更改）
;;(setq emacs-wiki-default-page "WelcomePage")
;; 更改默认索引页面的名字（一般不用更改）
;;(setq emacs-wiki-index-page "WiKiIndex")

;; 启用changelog美化支持，为真时会将changelog也当作Wiki页面发布
(setq emacs-wiki-pretty-changelogs t)

;; 设置inline图片的查找路径，Emacs-wiki会在指定目录的根目录和images目录中查找
;;(setq emacs-wiki-inline-relative-to 'emacs-wiki-publishing-directory)

;; 定义一个变量emacs-wiki-style-sheet，用于在页眉中指定CSS
(setq emacs-wiki-style-sheet
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/main.css\">")

;; 定义页眉页脚放置于文件中，如果文件未找到则插入默认的页眉页脚
(setq emacs-wiki-publishing-header "<lisp>(my-publishing-header)</lisp>")
(setq emacs-wiki-publishing-footer "<lisp>(my-publishing-footer)</lisp>")

(defun my-publishing-header ()
  (if (file-readable-p "header.wiki")
      (ignore (insert-file-contents "header.wiki"))
  ;;这里是默认的页眉
  "<?xml version=\"1.0\"?>
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"xhtml11.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
  <head>
    <title><lisp>(emacs-wiki-page-title)</lisp></title>
    <meta name=\"generator\" content=\"emacs-wiki.el\" />
    <meta http-equiv=\"<lisp>emacs-wiki-meta-http-equiv</lisp>\"
          content=\"<lisp>emacs-wiki-meta-content</lisp>\" />
    <link rev=\"made\" href=\"<lisp>emacs-wiki-maintainer</lisp>\" />
    <link rel=\"home\" href=\"<lisp>(emacs-wiki-published-name
                                     emacs-wiki-home-page)</lisp>\" />
    <link rel=\"index\" href=\"<lisp>(emacs-wiki-published-name
                                      emacs-wiki-index-page)</lisp>\" />
    <lisp>emacs-wiki-style-sheet</lisp>
  </head>
  <body>

    <!-- If you want a menu, uncomment the following lines and
    put (require 'emacs-wiki-menu) in your Emacs setup somewhere.

    <lisp>(when (boundp 'emacs-wiki-menu-factory)
            (funcall emacs-wiki-menu-factory))</lisp>
    -->

    <h1 id=\"top\"><lisp>(emacs-wiki-page-title)</lisp></h1>

    <!-- Page published by Emacs Wiki begins here -->\n"
  ))

(defun my-publishing-footer ()
  (if (file-readable-p "footer.wiki")
      (ignore (insert-file-contents "footer.wiki"))
  ;;这里是默认的页脚
  "
    <!-- Page published by Emacs Wiki ends here -->
    <div class=\"navfoot\">
      <hr />
      <table width=\"100%\" border=\"0\" summary=\"Footer navigation\">
        <col width=\"33%\"/><col width=\"34%\"/><col width=\"33%\"/>
        <tr>
          <td align=\"left\">
            <lisp>
              (if buffer-file-name
                  (concat
                   \"<span class=\\\"footdate\\\">Updated: \"
                   (format-time-string emacs-wiki-footer-date-format
                    (nth 5 (file-attributes buffer-file-name)))
                   (and emacs-wiki-serving-p
                        (emacs-wiki-editable-p (emacs-wiki-page-name))
                        (concat
                         \" / \"
                         (emacs-wiki-link-href
                          (concat \"editwiki?\" (emacs-wiki-page-name))
                          \"Edit\")))
                   \"</span>\"))
            </lisp>
          </td>
          <td align=\"center\">
            <span class=\"foothome\">
              <lisp>
                (concat
                 (and (emacs-wiki-page-file emacs-wiki-home-page t)
                      (not (emacs-wiki-private-p emacs-wiki-home-page))
                      (concat
                       (emacs-wiki-link-href emacs-wiki-home-page \"Home\")
                       \" / \"))
                 (emacs-wiki-link-href emacs-wiki-index-page \"Index\")
                 (and (emacs-wiki-page-file \"ChangeLog\" t)
                      (not (emacs-wiki-private-p \"ChangeLog\"))
                      (concat
                       \" / \"
                       (emacs-wiki-link-href \"ChangeLog\" \"Changes\"))))
              </lisp>
            </span>
          </td>
          <td align=\"right\">
            <lisp>
              (if emacs-wiki-serving-p
                  (concat
                   \"<span class=\\\"footfeed\\\">\"
                   (emacs-wiki-link-href \"searchwiki?get\" \"Search\")
                   (and buffer-file-name
                        (concat
                         \" / \"
                         (emacs-wiki-link-href
                          (concat \"searchwiki?q=\" (emacs-wiki-page-name))
                          \"Referrers\")))
                   \"</span>\"))
            </lisp>
          </td>
        </tr>
      </table>
    </div>
  </body>
</html>\n"
  ))

;; 自定义函数emacs-wiki-preview-source，快速查看publish的HTML代码
(defun emacs-wiki-preview-source ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (find-file (emacs-wiki-published-file)))

;; 自定义函数emacs-wiki-preview-html，快速本地预览生成的HTML
(defun emacs-wiki-preview-html ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (browse-url (emacs-wiki-published-file)))

;; 自定义函数emacs-wiki-unline-toggle，用于自动对WikiName添加/删除<nop>标记
;;{{{ copy from yason@emacswiki, modified by Yu Li
(defun emacs-wiki-unlink-toggle ()
  "Toggle <nop> string in the beginning of the current word, to
un/make a word emacs-wiki link. The current word depends on the
point: if the cursor is on a non-whitespace character, it's
considered a word surrounded by whitespace. If the cursor is on a
whitespace character, the next word is looked up. This way
addressing a word works intuitively after having arrived on the
spot using forward-word."
  (interactive)
  (save-excursion
    (with-current-buffer (current-buffer)
    (if (looking-at "[ \t]")
	(goto-char (- (re-search-forward "[A-Za-z<>]") 1))
      (goto-char (+ (re-search-backward "[^A-za-z<>]") 1)))
    (if (looking-at "<nop>")
	(delete-char 5)
      (insert "<nop>")))))
;;}}}

;; 绑定自定义函数到相应的键位组合
(add-hook 'emacs-wiki-mode-hook
  (lambda ()
    (define-key emacs-wiki-mode-map (kbd "C-c C-h") 'emacs-wiki-preview-html)
    (define-key emacs-wiki-mode-map (kbd "C-c C-c") 'emacs-wiki-preview-source)
    (define-key emacs-wiki-mode-map (kbd "C-c C-v") 'emacs-wiki-change-project)
    (define-key emacs-wiki-mode-map (kbd "C-c C-n") 'emacs-wiki-unlink-toggle)
  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * emacs-wiki-journal的设置 *
;;
;;   emacs-wiki-journal Emacs-wiki webblog界面的设置（以下均简称blog）
;;
;;   当前版本的emacs-wiki-journal还存在很多问题，以下配置谨供参考，如果
;;   出现问题，请全部去除
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 启动emacs-wiki的webblog系统
(require 'emacs-wiki-journal)

;; 设定blog的源文件目录
(setq emacs-wiki-journal-directory "~/Wiki/blog")
;; 设定blog的发布文件目录
(setq emacs-wiki-journal-publishing-directory "~/publish/blog")

;; 设定blog存储时使用的文件名字的前缀，如果设置为MyBlog，文件为MyBlog、
;; MyBlog1、MyBlog2...
(setq emacs-wiki-journal-wiki "MyBlog")

;; 设定blog的名字，也就是title
(setq emacs-wiki-journal-title "My Blog, My Zone!")

;; 设定blog的project名字，在后面的Emacs-wiki的project设置中使用
(setq emacs-wiki-journal-project "Blog")

;; 设置blog用于Wiki project间链接生成时需要添加的前缀
(setq emacs-wiki-journal-server-prefix "../blog/")

;; 设置blog的默认Category名字。当前emacs-wiki-journal实现中会根据
;; category的名字来进行索引和维护工作，所以如果你要修改，最好只修改
;; Category之后的部分（用英文），或者使得它和
;; `emacs-wiki-journal-category-regexp'一致
(setq emacs-wiki-journal-default-category "CategoryMisc")

;; 设置blog页面最后下一页链接的链接文字，也就是常见的"更多blog"
(setq emacs-wiki-journal-more-entries-link "(more entries...)")

;; 设置历史页面抬头标题
(setq emacs-wiki-journal-old-title-prefix "Entries")

;; 设置blog页面的条目的个数，超过了就会新开一页
(setq emacs-wiki-journal-entries-per-page 10)

;; 设置blog添加标题时使用的format字符串，设置请参考`format-time-string'的文档
;; 同样是由于当前版本的Emacs-wiki问题，当前版本最好使用默认值
;;(setq emacs-wiki-journal-time-format "%4Y年 %b %e日, %a")
;;(setq emacs-wiki-journal-category-time-format "%4Y.%m.%e")
;;(setq emacs-wiki-journal-category-internal-time-entry-format
;;      "<!-- date: %2m-%4Y -->")

;; 添加写blog的两个键位绑定，C-c j用于Wiki页面模式中，C-x 4 j用于全局
(add-hook 'emacs-wiki-mode-hook
  (lambda ()
    (define-key emacs-wiki-mode-map (kbd "C-c j") 'emacs-wiki-journal-add-entry)
  ))

(define-key ctl-x-4-map "j" 'emacs-wiki-journal-add-entry-other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * Emacs-wiki多个project的设置 *
;;
;;   多个project设置，你可以用这种方式来组织你的网站的不同topic
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq emacs-wiki-projects
      ;; Wepage和Blog部分配置请保持与之前配置的一样
      `(("Webpage" .
	 ((emacs-wiki-directories . ("~/Wiki/webpage"))
	  (emacs-wiki-project-server-prefix . "../webpage/")
	  (emacs-wiki-publishing-directory . "~/publish/webpage")))
	("Blog" .
	 ((emacs-wiki-directories . ("~/Wiki/blog"))
	  (emacs-wiki-project-server-prefix . "../blog/")
	  (emacs-wiki-publishing-directory . "~/publish/blog")))
;; 你可以添加新的project，如下是一个例子
;;	("Project" .
;;	 ((emacs-wiki-directories . ("~/Wiki/project"))
;;	  (emacs-wiki-project-server-prefix . "../project/")
;;	  (emacs-wiki-publishing-directory . "~/publish/project")))
	))

;; 用ido的方式来查找Wiki页面，并将之绑定在特殊的键上
(global-set-key [f12]
		'(lambda ()
		   (interactive)
		   (let ((default-directory "~/Wiki/webpage"))
		     (ido-find-file))))

(global-set-key [f11]
		'(lambda ()
		   (interactive)
		   (let ((default-directory "~/Wiki/blog"))
		     (ido-find-file))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * update-remote的设置 *
;;
;;   一个方便的后台更新程序，配合Emacs-wiki使用
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 启动update-remote支持，一个方便的网站后台更新程序
(require 'update-remote)

;; 这里填上你的用户名、密码和服务器地址，安全起见你可以将这些放置别处
(defvar emacs-wiki-server-usr "yourname")
(defvar emacs-wiki-server-passwd "yourpasswd")
(defvar emacs-wiki-server "yourserver")

;; 设置update-remote生成shell script使用的命令名字，最好使用绝对路径（
;; 可以用`expand-file-name'函数求得，如下例）
(setq update-remote-cmd-name (expand-file-name "~/ncftp/ncftpput.exe"))

;; 设置好update-remote生成的shell script命令的前缀，一般来说是用户名密
;; 码服务器地址之类的，假设你使用之前的设置，则可以得到
;;
;;       ncftpput -u yourname -p yourpasswd yourserver
;;
;; 详细信息请看update-remote.el的注释
(setq update-remote-cmd-prefix
      (concat "-u " emacs-wiki-server-usr " "
	      "-p " emacs-wiki-server-passwd " "
	      emacs-wiki-server))

;; 自定义更新的函数，并绑定至键位C-c U
(defun update-my-homepage ()
  (interactive)
  (update-remote
   "/"                            ;; remote directory
   (expand-file-name "~/publish") ;; local directory
   ))

(add-hook 'emacs-wiki-mode-hook
  (lambda ()
    (define-key emacs-wiki-mode-map (kbd "C-c U") 'update-my-homepage)
  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * 其它 *
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 加入对Emacs可视化表格编辑模块table.el的支持
;; 请参考Emacs-wiki文档Tables一节以及contrib目录中table.el
(require 'emacs-wiki-table)

;; 加入自动生成menu的支持，具体配置请看后面的emacs-wiki-menu配置部分
(require 'emacs-wiki-menu)

;; 启动faq-mode支持，一个编辑faq页面的minor mode
;;(require 'faq-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * Hack *
;;
;;   一些Hack函数，更改一些东西，解决一些问题
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; 解决Emacs-wiki当前存在的与mule-gbk不兼容的问题
;; 问题：遇到GBK字符时会将其转义，结果导致乱码

;;{{{ hack emacs-wiki-escape-html-string for mule-gbk support
(defun emacs-wiki-escape-html-string (str)
  "Convert to character entities any non alphanumeric characters
outside of a few punctuation symbols, that risk being
misinterpreted if not escaped"
  (when str
    (let (pos code len)
      (save-match-data
        (while (setq pos (string-match
                          (concat "[^-"
                                  emacs-wiki-regexp-alnum
                                  "/:._=@\\?~#]")
                          str pos))
          ;; Work around XEmacs differentiation of char and int
          (setq code (if (fboundp 'char-to-int)
                         (int-to-string (char-to-int (aref str pos)))
                       (int-to-string (aref str pos))))
	  (if (string= (charset-short-name (char-charset (aref str pos)))
		       "ASCII")
	      (setq len (length code)
		    str (replace-match (concat "&#" code ";") nil nil str)
		    pos (+ 3 len pos))
	    (cond ((string= (string (char-syntax (aref str pos))) "w")
		   (setq pos (+ 1 pos)))
		  ((string= (string (char-syntax (aref str pos))) "_")
		   (setq pos (+ 1 pos)))
		  ((string= (string (char-syntax (aref str pos))) "(")
		   (setq pos (+ 1 pos)))
		  ((string= (string (char-syntax (aref str pos))) ")")
		   (setq pos (+ 1 pos)))
		  (t
		   (setq len (length code)
			 str (replace-match (concat "&#" code ";") nil nil str)
			 pos (+ 3 len pos))))))
        str))))
;;}}}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs-wiki.el ends here
