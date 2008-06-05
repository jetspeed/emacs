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
;; Emacs Wiki����ģ��˵��
;; ====================
;;
;; ����һ��Emacs-wiki�������ļ�ģ�壬����������
;;
;; - ���г��õ�Emacs-wiki������ѡ����һ���ļ���
;; - Ϊ�����ṩһ������ָ��
;; - ��Ϊ����FAQ�Ĳ��䣬�ô�ҿ������ü�����:^)
;; - �������Emacs�û����һ�����ĵ�����
;;
;; ���ģ�������ԭ���ǳ��ڶ�Emacs-wiki�������[[Emacs]]��Wikiϵͳϲ��
;; ��ϣ����Ҳϲ������Ҳ��ӭ��������������ģ�塣
;;
;; =============
;; ���ء���װ��ʹ��
;; =============
;; 
;; * ����
;;
;; ��ַ http://liyu2000.nease.net/code/.emacs-wiki.el
;;
;; ģ����һ��el�ļ���ʽ���ļ���.emacs-wiki.el���ṩ���أ�������GNU
;; Public License��ԭ���·ַ���
;;
;; * ��װ
;;
;; �뽫���صõ����ļ�����Ӳ��ĳ�����Ƽ�������HOME�ļ��У�Ҳ����.emacs��
;; ͬһ��Ŀ¼���������.emacs�м�������һ��
;;
;;       (load-file "path/to/.emacs-wiki.el")
;;
;; �뽫"path/to/"�ĳ���Ӧ��·����������HOME�ļ��м�Ϊ"~/"����Ȼ������˳
;; �ֵı༭�������ļ��޸ģ���ϸ�Ķ����е�ע������Ұ���ָʾ�޸���Ӧ��
;; �������Ȼ�󱣴档��������Emacs�����Կ�ʼʹ��Emacs-wiki��
;;
;; * ʹ��
;;
;; Emacs-wiki����ģ���еĸ�������ʹ�������ģ����ע��˵�������߲ο�
;; Emacs-wiki�Դ����ĵ���EmacsWikiNode��Emacs-wiki����FAQ����Դ��
;;
;; ========
;; �����ͽ���
;; ========
;;
;; ��ӭ�㷴�����ģ���д��ڵ����⣬Ҳ��ӭ������顣�����
;; - ��ˮľEmacs�淢���������������ͽ���
;; - ֱ�ӷ�mail����
;;
;; ����Emacs���������ԣ���������ṩ������ͬʱҲ�ṩ�����ܶ�ĸ�
;; ����Ϣ����ʹ��ʲô�汾��Emacs����װ��һЩʲô��չ�ȵȣ���
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; =======
;; ������¼
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
;; * �������� *
;;
;;   ����Emacs-wiki�Ļ������ã��밴��ע���޸�
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; �����򣬱����������
(require 'emacs-wiki)

;; ����Wikiҳ��洢��Ŀ¼��Wiki��Դ�ļ����洢����
(setq emacs-wiki-directories '("~/Wiki/webpage"))
;; ����publish��Ŀ¼�����ɵ�HTMLҳ�潫�洢����
(setq emacs-wiki-publishing-directory "~/publish/webpage")

;; ���ô洢Դ�ļ�ʹ�õ�Ĭ�ϵ����ֱ��룬ʹ��GB2312�����Ŀ��Խ�ֵ����Ϊgb2312
(setq emacs-wiki-coding-default "gbk")
;; ���÷���HTMLҳ��ʹ�õ�charset���ַ�������ʹ��GB2312�����Ŀ��Խ�ֵ����Ϊgb2312
(setq emacs-wiki-charset-default "gbk")

;; �������mail��ַ��������Ϊ������ҳ���Ĭ�����ӵ�ַ
(setq emacs-wiki-maintainer "mailto:yourname@your.host.com")

;; ����Ĭ��ҳ������֣�һ�㲻�ø��ģ�
;;(setq emacs-wiki-default-page "WelcomePage")
;; ����Ĭ������ҳ������֣�һ�㲻�ø��ģ�
;;(setq emacs-wiki-index-page "WiKiIndex")

;; ����changelog����֧�֣�Ϊ��ʱ�ὫchangelogҲ����Wikiҳ�淢��
(setq emacs-wiki-pretty-changelogs t)

;; ����inlineͼƬ�Ĳ���·����Emacs-wiki����ָ��Ŀ¼�ĸ�Ŀ¼��imagesĿ¼�в���
;;(setq emacs-wiki-inline-relative-to 'emacs-wiki-publishing-directory)

;; ����һ������emacs-wiki-style-sheet��������ҳü��ָ��CSS
(setq emacs-wiki-style-sheet
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/main.css\">")

;; ����ҳüҳ�ŷ������ļ��У�����ļ�δ�ҵ������Ĭ�ϵ�ҳüҳ��
(setq emacs-wiki-publishing-header "<lisp>(my-publishing-header)</lisp>")
(setq emacs-wiki-publishing-footer "<lisp>(my-publishing-footer)</lisp>")

(defun my-publishing-header ()
  (if (file-readable-p "header.wiki")
      (ignore (insert-file-contents "header.wiki"))
  ;;������Ĭ�ϵ�ҳü
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
  ;;������Ĭ�ϵ�ҳ��
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

;; �Զ��庯��emacs-wiki-preview-source�����ٲ鿴publish��HTML����
(defun emacs-wiki-preview-source ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (find-file (emacs-wiki-published-file)))

;; �Զ��庯��emacs-wiki-preview-html�����ٱ���Ԥ�����ɵ�HTML
(defun emacs-wiki-preview-html ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (browse-url (emacs-wiki-published-file)))

;; �Զ��庯��emacs-wiki-unline-toggle�������Զ���WikiName���/ɾ��<nop>���
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

;; ���Զ��庯������Ӧ�ļ�λ���
(add-hook 'emacs-wiki-mode-hook
  (lambda ()
    (define-key emacs-wiki-mode-map (kbd "C-c C-h") 'emacs-wiki-preview-html)
    (define-key emacs-wiki-mode-map (kbd "C-c C-c") 'emacs-wiki-preview-source)
    (define-key emacs-wiki-mode-map (kbd "C-c C-v") 'emacs-wiki-change-project)
    (define-key emacs-wiki-mode-map (kbd "C-c C-n") 'emacs-wiki-unlink-toggle)
  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * emacs-wiki-journal������ *
;;
;;   emacs-wiki-journal Emacs-wiki webblog��������ã����¾����blog��
;;
;;   ��ǰ�汾��emacs-wiki-journal�����ںܶ����⣬�������ý����ο������
;;   �������⣬��ȫ��ȥ��
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ����emacs-wiki��webblogϵͳ
(require 'emacs-wiki-journal)

;; �趨blog��Դ�ļ�Ŀ¼
(setq emacs-wiki-journal-directory "~/Wiki/blog")
;; �趨blog�ķ����ļ�Ŀ¼
(setq emacs-wiki-journal-publishing-directory "~/publish/blog")

;; �趨blog�洢ʱʹ�õ��ļ����ֵ�ǰ׺���������ΪMyBlog���ļ�ΪMyBlog��
;; MyBlog1��MyBlog2...
(setq emacs-wiki-journal-wiki "MyBlog")

;; �趨blog�����֣�Ҳ����title
(setq emacs-wiki-journal-title "My Blog, My Zone!")

;; �趨blog��project���֣��ں����Emacs-wiki��project������ʹ��
(setq emacs-wiki-journal-project "Blog")

;; ����blog����Wiki project����������ʱ��Ҫ��ӵ�ǰ׺
(setq emacs-wiki-journal-server-prefix "../blog/")

;; ����blog��Ĭ��Category���֡���ǰemacs-wiki-journalʵ���л����
;; category������������������ά�����������������Ҫ�޸ģ����ֻ�޸�
;; Category֮��Ĳ��֣���Ӣ�ģ�������ʹ������
;; `emacs-wiki-journal-category-regexp'һ��
(setq emacs-wiki-journal-default-category "CategoryMisc")

;; ����blogҳ�������һҳ���ӵ��������֣�Ҳ���ǳ�����"����blog"
(setq emacs-wiki-journal-more-entries-link "(more entries...)")

;; ������ʷҳ��̧ͷ����
(setq emacs-wiki-journal-old-title-prefix "Entries")

;; ����blogҳ�����Ŀ�ĸ����������˾ͻ��¿�һҳ
(setq emacs-wiki-journal-entries-per-page 10)

;; ����blog��ӱ���ʱʹ�õ�format�ַ�����������ο�`format-time-string'���ĵ�
;; ͬ�������ڵ�ǰ�汾��Emacs-wiki���⣬��ǰ�汾���ʹ��Ĭ��ֵ
;;(setq emacs-wiki-journal-time-format "%4Y�� %b %e��, %a")
;;(setq emacs-wiki-journal-category-time-format "%4Y.%m.%e")
;;(setq emacs-wiki-journal-category-internal-time-entry-format
;;      "<!-- date: %2m-%4Y -->")

;; ���дblog��������λ�󶨣�C-c j����Wikiҳ��ģʽ�У�C-x 4 j����ȫ��
(add-hook 'emacs-wiki-mode-hook
  (lambda ()
    (define-key emacs-wiki-mode-map (kbd "C-c j") 'emacs-wiki-journal-add-entry)
  ))

(define-key ctl-x-4-map "j" 'emacs-wiki-journal-add-entry-other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * Emacs-wiki���project������ *
;;
;;   ���project���ã�����������ַ�ʽ����֯�����վ�Ĳ�ͬtopic
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq emacs-wiki-projects
      ;; Wepage��Blog���������뱣����֮ǰ���õ�һ��
      `(("Webpage" .
	 ((emacs-wiki-directories . ("~/Wiki/webpage"))
	  (emacs-wiki-project-server-prefix . "../webpage/")
	  (emacs-wiki-publishing-directory . "~/publish/webpage")))
	("Blog" .
	 ((emacs-wiki-directories . ("~/Wiki/blog"))
	  (emacs-wiki-project-server-prefix . "../blog/")
	  (emacs-wiki-publishing-directory . "~/publish/blog")))
;; ���������µ�project��������һ������
;;	("Project" .
;;	 ((emacs-wiki-directories . ("~/Wiki/project"))
;;	  (emacs-wiki-project-server-prefix . "../project/")
;;	  (emacs-wiki-publishing-directory . "~/publish/project")))
	))

;; ��ido�ķ�ʽ������Wikiҳ�棬����֮��������ļ���
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
;; * update-remote������ *
;;
;;   һ������ĺ�̨���³������Emacs-wikiʹ��
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ����update-remote֧�֣�һ���������վ��̨���³���
(require 'update-remote)

;; ������������û���������ͷ�������ַ����ȫ�������Խ���Щ���ñ�
(defvar emacs-wiki-server-usr "yourname")
(defvar emacs-wiki-server-passwd "yourpasswd")
(defvar emacs-wiki-server "yourserver")

;; ����update-remote����shell scriptʹ�õ��������֣����ʹ�þ���·����
;; ������`expand-file-name'������ã���������
(setq update-remote-cmd-name (expand-file-name "~/ncftp/ncftpput.exe"))

;; ���ú�update-remote���ɵ�shell script�����ǰ׺��һ����˵���û�����
;; ���������ַ֮��ģ�������ʹ��֮ǰ�����ã�����Եõ�
;;
;;       ncftpput -u yourname -p yourpasswd yourserver
;;
;; ��ϸ��Ϣ�뿴update-remote.el��ע��
(setq update-remote-cmd-prefix
      (concat "-u " emacs-wiki-server-usr " "
	      "-p " emacs-wiki-server-passwd " "
	      emacs-wiki-server))

;; �Զ�����µĺ�������������λC-c U
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
;; * ���� *
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; �����Emacs���ӻ����༭ģ��table.el��֧��
;; ��ο�Emacs-wiki�ĵ�Tablesһ���Լ�contribĿ¼��table.el
(require 'emacs-wiki-table)

;; �����Զ�����menu��֧�֣����������뿴�����emacs-wiki-menu���ò���
(require 'emacs-wiki-menu)

;; ����faq-mode֧�֣�һ���༭faqҳ���minor mode
;;(require 'faq-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; * Hack *
;;
;;   һЩHack����������һЩ���������һЩ����
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ���Emacs-wiki��ǰ���ڵ���mule-gbk�����ݵ�����
;; ���⣺����GBK�ַ�ʱ�Ὣ��ת�壬�����������

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
