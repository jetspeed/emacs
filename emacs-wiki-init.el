(add-to-list 'load-path "~/.emacs.d/myBigEmacs/emacs-wiki")

(require 'emacs-wiki)
(require 'emacs-wiki-menu)
(require 'emacs-wiki-srctag)
(require 'emacs-wiki-table) 
;; srctag的其他语言支持
;;  (add-to-list 'emacs-wiki-src-tag-modes-alist 
;;                '("perl" . perl-mode)
;; 			  '("sh" . shell-script-mode)
;; 			  '("java" . java-mode)
;; 			  '("python" . python-mode))
;; 功能设置
;; 绑定自定义函数到相应的键位组合
(add-hook 'emacs-wiki-mode-hook
  (lambda ()
    (define-key emacs-wiki-mode-map (kbd "C-c C-h") 'emacs-wiki-preview-html)
    (define-key emacs-wiki-mode-map (kbd "C-c C-c") 'emacs-wiki-preview-source)
    (define-key emacs-wiki-mode-map (kbd "C-c C-v") 'emacs-wiki-change-project)
    (define-key emacs-wiki-mode-map (kbd "C-c i")   'emacs-wiki-insert-contents)
    (define-key emacs-wiki-mode-map (kbd "C-c C-n") 'emacs-wiki-unlink-toggle)
  ))

(add-hook 'emacs-wiki-mode-hook
          (function (lambda ()
                 (outline-minor-mode)
				 (footnote-mode))))

;; 自定义函数emacs-wiki-preview-source，快速查看publish的HTML代码
(defun emacs-wiki-insert-contents ()
  (interactive)
  (ska-point-to-register)
  (beginning-of-buffer)
;;   (if (not (eq 10 (- (line-end-position) (line-beginning-position))))
;;   (if (and (not (eq 10 (- (line-end-position) (line-beginning-position))))
;; 		   (not (eq 10 (search-forward "<contents>" nil nil 1))))
;;   (string current-line)
;;   (if (not (current-line-equl "<contents>")))
;; 	  (beginning-of-buffer)
  (if (not (looking-at "<contents>"))
  (insert "<contents>\n")
  )
  (ska-jump-to-register)
)
;;;_+ I want #top links after each heading! =)
(defun sacha/emacs-wiki-markup-heading ()
 "Add #top links after each heading."
 (let ((len (1+ (length (match-string 1)))))
   (emacs-wiki-surround-text
    (format "<h%d> <span class=\"toplink\"><a href=\"#top\">top</a> </span> " len)
    (format "</h%d>" len)
    'end-of-line)
   ""))
(defalias 'emacs-wiki-markup-heading 'sacha/emacs-wiki-markup-heading)

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

 (defun sacha-emacs-wiki-auto-publish ()
   (when (derived-mode-p 'emacs-wiki-mode)
     (unless emacs-wiki-publishing-p
       (let ((emacs-wiki-publishing-p t)
             (emacs-wiki-after-wiki-publish-hook nil))
    (emacs-wiki-publish-this-page)
	(emacs-wiki-publish-index)))))
;; (add-hook 'emacs-wiki-mode-hook
;;           (lambda () (add-hook 'after-save-hook
;; 								'sacha-emacs-wiki-auto-publish
;;                                nil t)))

;; 基本设置
(defvar my-emacs-wiki-home "../home/WelcomePage.html")
(setq emacs-wiki-projects
	  `(("Programming" . ((emacs-wiki-directories . ("~/temp/tiddlyWiki/wiki/programming"))
				  (emacs-wiki-publishing-directory . "~/temp/tiddlyWiki/webpage/programming")
				  (emacs-wiki-default-page . "../programming/WikiIndex.html")))
		
		("Parallel" . ((emacs-wiki-directories . ("~/temp/tiddlyWiki/wiki/parallel"))
				  (emacs-wiki-publishing-directory . "~/temp/tiddlyWiki/webpage/parallel")
				  (emacs-wiki-default-page . "../parallel/WikiIndex.html")))
		
		("Linux" . ((emacs-wiki-directories . ("~/temp/tiddlyWiki/wiki/linux"))
				  (emacs-wiki-publishing-directory . "~/temp/tiddlyWiki/webpage/linux")
				  (emacs-wiki-default-page . "../linux/WikiIndex.html")))
		
        ("Life" . ((emacs-wiki-directories . ("~/temp/tiddlyWiki/wiki/life"))
				  (emacs-wiki-publishing-directory . "~/temp/tiddlyWiki/webpage/life")
				  (emacs-wiki-default-page . "../life/WikiIndex.html")))

        ("Blog" . ((emacs-wiki-directories . ("~/temp/tiddlyWiki/wiki/blog"))
				  (emacs-wiki-publishing-directory . "~/temp/tiddlyWiki/webpage/blog")
				  (emacs-wiki-default-page . "../blog/")))
		
		("Home" . ((emacs-wiki-directories . ("~/temp/tiddlyWiki/wiki/home"))
                      (emacs-wiki-publishing-directory . "~/temp/tiddlyWiki/webpage/home")
                      (emacs-wiki-default-page . "../home/WelcomePage.html")))))

(setq emacs-wiki-inline-relative-to 'emacs-wiki-publishing-directory)
;; 设置你的mail地址，它将做为不存在页面的默认链接地址
(setq emacs-wiki-maintainer "mailto:shmimy-w@163.com")
;; 定义一个变量emacs-wiki-style-sheet，用于在页眉中指定CSS
;;   (setq emacs-wiki-index-page  "WikiIndex")
  (setq emacs-wiki-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/xue.css\">")

;; 定义页眉页脚放置于文件中，如果文件未找到则插入默认的页眉页脚
(setq emacs-wiki-publishing-header "<lisp>(my-publishing-header)</lisp>")
(setq emacs-wiki-publishing-footer "<lisp>(my-publishing-footer)</lisp>")

(defun my-publishing-header ()
  (if (file-readable-p "header.wiki")
      (ignore (insert-file-contents "header.wiki"))

  "<?xml version=\"1.0\" encoding=\"<lisp>
 (emacs-wiki-transform-content-type
   (or (and (boundp 'buffer-file-coding-system)
            buffer-file-coding-system)
       emacs-wiki-coding-default))</lisp>\"?>
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"
    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
  <head>
    <title><lisp>(emacs-wiki-page-title)</lisp></title>
    <meta name=\"generator\" content=\"emacs-wiki.el\" />
    <meta http-equiv=\"<lisp>emacs-wiki-meta-http-equiv</lisp>\"
          content=\"<lisp>emacs-wiki-meta-content</lisp>\" />
    <link rel=\"made\" href=\"<lisp>emacs-wiki-maintainer</lisp>\" />
    <link rel=\"home\" href=\"<lisp>(emacs-wiki-published-name
                                     emacs-wiki-default-page)</lisp>\" />
    <link rel=\"index\" href=\"<lisp>(emacs-wiki-published-name
                                      emacs-wiki-index-page)</lisp>\" />
    <lisp>emacs-wiki-style-sheet</lisp>
  </head>
  <body>
<!-- Google Search -->
     <div class=\"searchbar\">
        <form id=\"searchbar\" method=\"get\" action=\"http://www.google.com/custom\" title=\"My Site Search\">
           <div id=\"searchbar\">
              <label for=\"q\" title=\"Search this site\">
                     <img src=\"../images/google.gif\" ></label>
              <input type=hidden name=domains value=\"http://124.16.137.72/\">
              <input type=hidden name=sitesearch value=\"http://124.16.137.72/\">
              <input type=\"text\" id=\"q\" name=\"q\" accesskey=\"s\" size=\"16\">
              <input type=\"submit\" id=\"submit\" value=\"Go\">
           </div>
        </form>
     </div>
 <!--  Google Search -->
   <lisp>(when (boundp 'emacs-wiki-menu-factory)
            (funcall emacs-wiki-menu-factory))</lisp>
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
        <col width=\"33%\" /><col width=\"34%\" /><col width=\"33%\" />
        <tr>
          <td align=\"left\">
            <lisp>
              (if emacs-wiki-current-file
                  (concat
                   \"<span class=\\\"footdate\\\">Updated: \"
                   (format-time-string emacs-wiki-footer-date-format
                    (nth 5 (file-attributes emacs-wiki-current-file)))
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
                 (concat
                      (emacs-wiki-link-href my-emacs-wiki-home \"Home\")
                       \" / \")
                 (emacs-wiki-link-href emacs-wiki-default-page \"Index\")
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
            (concat
              (emacs-wiki-link-href emacs-wiki-maintainer \"jetspeed@CopyLeft\") 
              (if emacs-wiki-serving-p
                  (concat
                   \"<span class=\\\"footfeed\\\">\"
                   (emacs-wiki-link-href \"searchwiki?get\" \"Search\")
                   (and emacs-wiki-current-file
                        (concat
                         \" / \"
                         (emacs-wiki-link-href
                          (concat \"searchwiki?q=\" (emacs-wiki-page-name))
                          \"Referrers\")))
                   \"</span>\")))
            </lisp>

          </td>
        </tr>
      </table>
    </div>
  </body>
</html>\n"
  ))

