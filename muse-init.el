;;; muse-init.el --- Initialize muse-mode.
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/muse/lisp")
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/muse/experimental")
;;;; xhtml footer and header (如果你沿用emacs-wiki那样定义多个项目而不用muse子目录发布功能，注掉它）
(load-file "~/.emacs.d/myEmacs/load-lisp/muse-header-footer.el")
(require 'muse)          ; load generic module
(require 'muse-mode)     ; load authoring mode
(require 'muse-wiki)     ; load Wiki support
(require 'muse-html)     ; load (X)HTML publishing style
(require 'muse-colors)   ; load coloring/font-lock module
(require 'htmlize)
(require 'muse-project)

(require 'muse-blosxom)  ; load blosxom module
;(require 'muse-docbook)  ; load DocBook publishing style
;(require 'muse-latex)    ; load LaTeX/PDF publishing styles
;(require 'muse-texinfo)  ; load Info publishing style
;(require 'muse-xml)      ; load XML support
;(require 'muse-journal)  ; load journal module
;(require 'muse-message)  ; load message support (experimental)
;(require 'muse-srctag)   ; load srctag support
(require 'outline nil t)
(require 'sgml-mode)
;; (require 'tp-muse-highlight)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; settings for blosxom
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(muse-derive-style "my-blosxom" "blosxom-xhtml"
                   :final 'my-muse-blosxom-finalize)
(defun my-muse-blosxom-finalize (file output-path target)
;;  (my-muse-prepare-entry-for-xanga output-path)
;; For now, do nothing.
  )


;; (unless (assoc "my-blosxom" muse-publishing-styles)
  (muse-derive-style "wiki-xhtml" "xhtml"
;                     :header "~/muse/common/templates/header.html"
;                     :footer "~/muse/common/templates/footer.html"
             )
  (muse-derive-style "default-xhtml" "xhtml"
;                     :header "~/muse/common/templates/default-header.html"
;                     :footer "~/muse/common/templates/default-footer.html"
             )
;; )

(setq muse-project-alist
      `(

;;      ("Muse"
;;       ("~/temp/tiddlyWiki/muse/source/emacs/muse"
;;        :default "MuseIndex"
;;        :force-publish ("WikiIndex"))
;;       (:base "wiki-xhtml" :path "~/temp/tiddlyWiki/muse/publish/emacs/muse"))
;;      ("Emacs"
;;       ("~/temp/tiddlyWiki/muse/source/emacs"
;;        :default "MuseIndex"
;;        :force-publish ("WikiIndex"))
;;       (:base "wiki-xhtml" :path "~/temp/tiddlyWiki/muse/publish/emacs"))

;;      ("Programming"
;;       ("~/temp/tiddlyWiki/muse/source/programming"
;;        :default "ProgrammingIndex"
;;        :force-publish ("WikiIndex"))
;;       (:base "wiki-xhtml" :path "~/temp/tiddlyWiki/muse/publish/programming"))

        ("Home" (,@(muse-project-alist-dirs "~/temp/tiddlyWiki/muse/source/home")
                 :default "WikiIndex"
                 :force-publish ("WikiIndex")
                 )
         ,@(muse-project-alist-styles "~/temp/tiddlyWiki/muse/source/home"
                                      "~/temp/tiddlyWiki/muse/publish/home"
                                      "wiki-xhtml"))

        ("Programming" (,@(muse-project-alist-dirs "~/temp/tiddlyWiki/muse/source/programming")
                        :default "WikiIndex"
                        :force-publish ("WikiIndex")
                        )
         ,@(muse-project-alist-styles "~/temp/tiddlyWiki/muse/source/programming"
                                      "~/temp/tiddlyWiki/muse/publish/programming"
                                      "wiki-xhtml"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; settrings for blog
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ("Blog" (,@(muse-project-alist-dirs "~/temp/tiddlyWiki/muse/source/blog")
                 :default "WikiIndex")
         ;; Publish this directory and its subdirectories.  Arguments
         ;; are as follows.  The above `muse-project-alist-dirs' part
         ;; is also needed.
         ;;   1. Source directory
         ;;   2. Output directory
         ;;   3. Publishing style
         ;;   remainder: Other things to put in every generated style
         ,@(muse-project-alist-styles "~/temp/tiddlyWiki/muse/source/blog"
                                      "~/temp/tiddlyWiki/muse/publish/blog"
                                      "my-blosxom"
                                      :base-url "http://124.16.137.72/blog"))

;;  ("Default" (,@(muse-project-alist-dirs "~/temp/tiddlyWiki/muse/source/default")
;;          :default "WikiIndex"
;;          :force-publish ("WikiIndex"))
;;   ,@(muse-project-alist-styles "~/temp/tiddlyWiki/muse/source/default"
;;                    "~/temp/tiddlyWiki/muse/publish"
;;                    "default-xhtml"))

    ))

;;;;_+Some Ye Wenbin's functions You can get if from:
;;;;  http://learn.tsinghua.edu.cn:8080/2005211356/emacs/EmacsMusecof.html
(defun ywb-muse-html-markup-table ()
  (let ((str (match-string 1)))
    (when (= (aref str 0) ?|)
      (save-excursion
        (save-match-data
          (let ((endmarker (set-marker (make-marker) (match-end 0)))
                (start (match-beginning 0))
                (nextline (lambda () (forward-line 1) (point))))
            (goto-char (1+ start))
            (when (looking-at "|\\([-]+[|+]\\)+[ \t]*$")
              (delete-region (point) (funcall nextline))
              (perform-replace "[ \t]+|[ \t]+" " || " nil t nil nil nil
                               (point) (funcall nextline))
              (delete-region (funcall nextline) (funcall nextline)))
            (goto-char endmarker)
            (forward-line -1)
            (when (looking-at "|\\([-]+[|+]\\)+[ \t]*$")
              (delete-region (point) (funcall nextline)))
            (perform-replace "^|[ \t]*" "" nil t nil nil nil start endmarker)
            (perform-replace "|[ \t]*$" "" nil t nil nil nil start endmarker)))))
    (muse-html-markup-table)))
;;;;_+
(defun ywb-muse-publish-math-tab (beg end attrs)
  (require 'org)
  (let ((tag (or (cdr (assoc "tag" attrs)) "span")))
    (insert (concat "<" tag " class=\"math\">"
                    (org-export-html-convert-sub-super
                     (delete-and-extract-region beg end))
                    "</" tag ">\n"))
    (muse-publish-mark-read-only beg (point))))
;;;;_+
(defun ywb-muse-publish-src-tag (beg end attrs)
  (let ((mode (cdr (assoc "type" attrs))))
    (tp-muse-fontified-example-tag beg end nil
                                   (intern-soft (concat mode "-mode")))))
;;;;_+
(defun ywb-muse-handle-file-link (&optional string)
  (or string
      (setq string
        (let ((end (save-excursion
             (re-search-forward "]" nil t)
             (1- (point)))))
          (when end
        (buffer-substring-no-properties (point) end)))))
  (setq string
    (expand-file-name
     (concat (muse-get-keyword :path (nth 2 (muse-project)))
         "/" string)))
  (when (file-exists-p string)
    string))
;;;;_+
(add-to-list 'muse-html-markup-functions '(table . ywb-muse-html-markup-table))
(add-to-list 'muse-html-markup-tags      '("math" t t ywb-muse-publish-math-tag))
(add-to-list 'muse-html-markup-tags      '("src" t t ywb-muse-publish-src-tag))
(add-to-list 'muse-explicit-link-functions 'ywb-muse-handle-file-link)
;;;_+ insert contents. <contents> should strip all the tags
(defun ywb/muse-publish-strip-tags (string)
   (while (string-match "<.*?>" string)
     (setq string (replace-match "" nil t string)))
   string)
(defadvice muse-publish-contents-tag (around ywb activate)
   (let* ((beg (ad-get-arg 0))
          (end (ad-get-arg 1))
          (attrs (ad-get-arg 2))
          (max-depth (let ((depth (cdr (assoc "depth" attrs))))
                       (or (and depth (string-to-int depth)) 3)))
          (index 1)
          base contents l)
     (save-excursion
       (catch 'done
         (while (re-search-forward "^\\(\\*+\\)\\s-+\\(.+\\)" nil t)
           (setq l (length (match-string 1)))
           (if (null base)
               (setq base l)
             (if (< l base)
                 (throw 'done t)))
           (when (<= l max-depth)
             (setq contents (cons (cons l (match-string-no-properties 2))
                                  contents))
             (goto-char (match-beginning 2))
             (muse-html-insert-anchor (concat "sec" (int-to-string index)))
             (delete-backward-char 1)
             (setq index (1+ index))))))
     (setq index 1 contents (reverse contents))
     (let ((depth 1) (sub-open 0) (p (point)))
       (insert "<div class=\"mulu\">
                     <h6 class=\"mulu\">Contents</h6>\n")
       (insert "<dl class=\"contents\">\n")
       (while contents
         (insert "<dt class=\"contents\">\n")
         (insert "<a href=\"#sec" (int-to-string index) "\">"
                 (ywb/muse-publish-strip-tags (cdar contents))
                 "</a>\n")
         (setq index (1+ index))
         (insert "</dt>\n")
         (setq depth (caar contents)
               contents (cdr contents))
         (if contents
             (cond
              ((< (caar contents) depth)
               (let ((idx (caar contents)))
                 (while (< idx depth)
                   (insert "</dl>\n</dd>\n")
                   (setq sub-open (1- sub-open)
                         idx (1+ idx)))))
              ((> (caar contents) depth) ; can't jump more than one ahead
               (insert "<dd>\n<dl class=\"contents\">\n")
               (setq sub-open (1+ sub-open))))))
       (while (> sub-open 0)
         (insert "</dl>\n</dd>\n")
         (setq sub-open (1- sub-open)))
       (insert "</dl>\n")
       (insert "</div>\n")
       (put-text-property p (point) 'read-only t))))
;;;_+ insert toplink in html files
(defun ywb/muse-publish-markup-heading ()
   (let* ((len (length (match-string 1)))
          (start (muse-markup-text
                  (cond ((= len 1) 'section)
                        ((= len 2) 'subsection)
                        ((= len 3) 'subsubsection)
                        (t 'section-other))
                  len))
          (end   (muse-markup-text
                  (cond ((= len 1) 'section-end)
                        ((= len 2) 'subsection-end)
                        ((= len 3) 'subsubsection-end)
                        (t 'section-other-end))
                  len)))
     (delete-region (match-beginning 0) (match-end 0))
     (muse-insert-markup start)
     (insert
      (propertize
      "<span class=\"toplink\"><a href=\"#top\">top</a></span>"
      'rear-nonsticky '(read-only) 'read-only t))
     (end-of-line)
     (when end
       (muse-insert-markup end))
     (muse-publish-section-close len)))
(defalias 'muse-publish-markup-heading 'ywb/muse-publish-markup-heading)
;;;_+ publish functions
(defun ywb-muse-publish-project (&optional arg)
  (interactive "P")
  (let ((dir default-directory)
        (published (muse-project-publish (muse-project) arg))
        (muse-explicit-link-functions (remove
                                       'ywb-muse-handle-file-link
                                       muse-explicit-link-functions))
        cmd)
    (when (= (aref published 0) ?A)
      (setq default-directory dir)
      (setq cmd (concat "psync .*\\.muse$ "
                        (expand-file-name
                         (concat (muse-get-keyword :path (car (cddr
                                                               (muse-project))))
                                 "/wikisource/"))))
      (message cmd)
      (shell-command cmd))
    (message published)))

(defun ywb-muse-output-file ()
  "Get output file name"
  (let ((styles (muse-project-applicable-styles buffer-file-name (cddr (muse-project))))
        output-dir)
    (while (and styles
                (progn
                  (setq output-dir (muse-style-element :path (car styles)))
                  (not (file-exists-p output-dir))))
      (setq styles (cdr styles)))
    (when output-dir
      (muse-publish-output-file
       buffer-file-name
       output-dir
       "html"))))
;(defun ywb-muse-publish-this-file (&optional arg)
;  "Publish current file to html"
;  (interactive)
;  (save-buffer)
;  (let* ((path (file-name-directory (ywb-muse-output-file)))
;         (muse-explicit-link-functions (remove 'ywb-muse-handle-file-link muse-explicit-link-functions))
;         (source-path (concat path "/wikisource/")))
;    (unless (file-exists-p source-path)
;      (message "Creating wiki source directory %s" source-path)
;      (make-directory source-path t))
;    (copy-file buffer-file-name source-path t)
;    (muse-project-publish-file buffer-file-name (cddr muse-current-project) current-prefix-arg)))

;(defun ywb-muse-publish-this-file (&optional arg)
;  "Publish current file to html"
;  (interactive)
;  (save-buffer)
;  (let ((path (muse-get-keyword :path (nth 2 (muse-project)))))
;    (muse-publish-this-file "xhtml" path current-prefix-arg)))
(defvar my-muse-publish-directory "~/temp/tiddlyWiki/muse/publish/")
(defun ywb-muse-relative-path (file)
  (concat
   (file-relative-name
    my-muse-publish-directory
    (file-name-directory muse-publishing-current-output-path))
   file))
;;;###autoload
(defun ywb-muse-generate-index (&optional project-list)
  "Generate the index of all wikifile except the file in the\"website\" project"
  (unless project-list
    (setq project-list (list (car (muse-project)))))
  (let (project-files title)
    (muse-with-temp-buffer
      (dolist (project project-list)
        (setq project-files (muse-project-file-alist project))
        (progn
          (insert "* " project "\n"))
        (dolist (file project-files)
          (unless (or (equal (car file) "index")
                      (equal (car file) "WikiIndex"))
            (insert " - [[" project "#" (car file) "]["
                    (save-excursion
                      (set-buffer (generate-new-buffer "*index*"))
                      (insert-file-contents (cdr file))
                      (goto-char (point-min))
                      (setq title
                            (if (re-search-forward "^#title" nil t)
                                (buffer-substring (point) (line-end-position))
                              (car file)))
                      (kill-buffer (current-buffer))
                      title)
                    "]]\n")))
        (insert "\n"))
      (buffer-string))))
;;;;_+ redefine of function
(defun muse-colors-insert-image (link beg end invis-props)
  "Create an image using create-image or make-glyph and insert it
in place of an image link defined by BEG and END."
;;  (setq link (expand-file-name link))
  (let ((image-file (cond
                     ((eq muse-colors-inline-image-method 'default-directory)
                      link)
                     ((functionp muse-colors-inline-image-method)
                      (funcall muse-colors-inline-image-method link))))
        glyph)
    (when (stringp image-file)
      (if (fboundp 'create-image)
          ;; use create-image and display property
          (add-text-properties beg end
                               (list 'display (create-image image-file)))
        ;; use make-glyph and invisible property
        (and (setq glyph (muse-make-file-glyph image-file))
             (progn
               (add-text-properties beg end invis-props)
               (add-text-properties beg end (list
                                             'end-glyph glyph
                                             'help-echo link))))))))
;;;;_+ preview commands
(defun ywb-muse-preview-with-w3m ()
  "Preview the html file"
  (interactive)
;  (ywb-muse-publish-this-file)
 (muse-project-publish-this-file)
 (let ((file (ywb-muse-output-file)))
    (w3m-goto-url (if (string-match "^[a-zA-Z]:" file)
                      (ywb-convert-to-cygwin-path file)
                    (concat "file://" file)))))

(defun ywb-muse-preview-html ()
  "Preview the html file"
  (interactive)
;  (ywb-muse-publish-this-file)
  (muse-project-publish-this-file)
  (browse-url (ywb-muse-output-file)))

(defun ywb-muse-preview-source ()
  "Find the html file"
  (interactive)
;  (ywb-muse-publish-this-file)
  (muse-project-publish-this-file)
  (find-file (ywb-muse-output-file)))

;;;;_+ variable setting
(add-to-list 'magic-mode-alist
             '("#title " . muse-mode))
;; (when (featurep 'tp-muse-highlight)
;;   (tp-muse-html-syntax-highlight-tag "sqlexample" 'sql-mode)
;;   (tp-muse-html-syntax-highlight-tag "perlexample" 'cperl-mode)
;;   (tp-muse-html-syntax-highlight-tag "javaexample" 'java-mode))

(custom-set-variables
 '(muse-blosxom-use-tags t)
 '(muse-blosxom-base-directory "~/temp/tiddlyWiki/muse/source/blog/")
 '(muse-file-extension nil)
 '(muse-mode-auto-p t)
 '(muse-file-extension "muse")

; (setq muse-html-meta-content-type "text/html; charset=utf-8")
 '(muse-html-meta-content-encoding (quote utf-8))
 '(muse-html-charset-default "utf-8")

 '(muse-html-encoding-default (quote utf-8))
 '(muse-html-encoding-map "utf8")
 '(muse-colors-autogen-headings (quote outline))
 '(muse-colors-inline-image-method (quote muse-colors-use-publishing-directory))
 '(muse-html-meta-content-encoding (quote utf-8))

 '(muse-html-meta-content-type "text/xhtml; charset=utf-8")
 '(muse-mode-hook (quote (flyspell-mode footnote-mode)))
 '(muse-publish-comments-p t)
 '(muse-publish-desc-transforms (quote (muse-wiki-publish-pretty-title muse-wiki-publish-pretty-interwiki)))
 '(muse-html-markup-functions (quote ((anchor . muse-html-markup-anchor) (table . muse-html-markup-table) (footnote . muse-html-markup-footnote))))
 '(muse-table-line-regexp "^|?[[:blank:]]*\\(?:[^|\n]+\\||\\)[[:blank:]-]+\\([|+]+\\)\\(?:[[:blank:]-]+\\|$\\)[^|\n].*")
 '(muse-mode-highlight-p t)
 '(muse-wiki-ignore-bare-project-names t)
 '(muse-colors-evaluate-lisp-tags nil)
; '(muse-html-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"all\" href=\"../common/stylesheets/core.css\" />")
; '(muse-xhtml-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"all\" href=\"../common/stylesheets/core.css\" />")
 '(muse-wiki-publish-small-title-words (quote ("the" "and" "at" "on" "of" "for" "in" "an" "a" "page" "anime"))))

;; ;;;_. planner
;; (require 'planner nil t)
;; (require 'planner-id nil t)
;; (when (featurep 'planner)
;;   (global-set-key (kbd "<f9> t") 'planner-create-task-from-buffer)
;;   (global-set-key (kbd "<f9> c") 'planner-create-task)
;;   (global-set-key (kbd "<f9> <f9>") 'plan)
;;   (require 'remember-planner nil t)
;;   (when (featurep 'remember-planner)
;;     (setq remember-annotation-functions planner-annotation-functions)
;;     (setq remember-handler-functions '(remember-planner-append))))

;; (autoload 'remember "remember" nil t)
;; (autoload 'remember-region "remember" nil t)
;; (global-set-key (kbd "<f9> r") 'remember)
;; (global-set-key (kbd "<f9> s") 'remember-region)
;; (global-set-key (kbd "<f9> d") 'planner-diary-add-entry)

;; (require 'planner-diary nil t)
;; (when (featurep 'planner-diary)
;;   (defun planner-diary-add-entry (date time text)
;;     "Prompt for a diary entry to add to `diary-file'.  Will run
;;     planner-annotations to make hyper links"
;;     (interactive (list (planner-read-date)
;;                        (read-string "Time: ")
;;                        (read-string "Diary entry: ")))
;;     (save-excursion
;;       (save-window-excursion
;;         (make-diary-entry
;;          (concat
;;           (let ((cal-date (planner-filename-to-calendar-date date)))
;;             (if european-calendar-style
;;                 (format "%d/%d/%d"
;;                         (elt cal-date 1)
;;                         (elt cal-date 0)
;;                         (elt cal-date 2))
;;               (format "%d/%d/%d"
;;                       (elt cal-date 0)
;;                       (elt cal-date 1)
;;                       (elt cal-date 2))))
;;           " " time " " text " "
;;           (run-hook-with-args-until-success
;;            'planner-annotation-functions))))))
;;   (setq planner-diary-use-diary t)
;;   (planner-insinuate-diary)
;;   (planner-insinuate-calendar)
;;   (setq planner-diary-number-of-days 7)
;;   (setq planner-diary-number-of-diary-entries 7)
;;   (setq planner-diary-file diary-file))

(setq muse-mode-hook
      (lambda ()
        (footnote-mode)
        (auto-fill-mode 1)
        (modify-syntax-entry ?> ")" muse-mode-syntax-table)
        (modify-syntax-entry ?< "(" muse-mode-syntax-table)
        (define-key muse-mode-map (kbd "C-c /") 'sgml-close-tag)
        (define-key muse-mode-map (kbd "C-c t") 'sgml-tag)
;       (define-key muse-mode-map (kbd "C-c C-t") 'ywb-muse-publish-this-file)
;       (define-key muse-mode-map (kbd "C-c C-p") 'ywb-muse-publish-project)
        (define-key muse-mode-map (kbd "C-c C-c") 'ywb-muse-preview-source)
        (define-key muse-mode-map (kbd "C-c C-j") 'ywb-muse-preview-html)
        (define-key muse-mode-map (kbd "C-c C-m") 'ywb-muse-preview-with-w3m)
        (define-key muse-mode-map (kbd "C-c p b") 'wangxq-muse-blosxom-new-entry)
        (define-key muse-mode-map (kbd "C-c i")   'emacs-muse-insert-contents)
               (define-key muse-mode-map (kbd "<C-return>") 'ywb-html-insert-newline)
        (define-key muse-mode-map (kbd "M-RET") 'ywb-insert-item)
        ))

(defun emacs-muse-insert-contents ()
  (interactive)
  (ska-point-to-register)
  (beginning-of-buffer)
;;   (if (not (eq 10 (- (line-end-position) (line-beginning-position))))
;;   (if (and (not (eq 10 (- (line-end-position) (line-beginning-position))))
;;         (not (eq 10 (search-forward "<contents>" nil nil 1))))
;;   (string current-line)
;;   (if (not (current-line-equl "<contents>")))
;;    (beginning-of-buffer)
  (if (not (looking-at "<contents>"))
  (insert "<contents>\n")
  )
  (ska-jump-to-register)
)

;;;###autoload
(defun wangxq-muse-blosxom-new-entry (category tags title)
  "Start a new blog entry with given CATEGORY.
The filename of the blog entry is derived from TITLE.
The page will be initialized with the current date and TITLE."
  (interactive
   (list
    (funcall muse-completing-read-function
             "Category: "
             (mapcar 'list (muse-project-recurse-directory
                            muse-blosxom-base-directory)))

    (if muse-blosxom-use-tags
        (let ((tag "foo")
              (tags nil))
          (while (progn (setq tag (read-string "Tag (RET to continue): "))
                        (not (string= tag "")))
            (add-to-list 'tags tag t))
          tags)
;;       (funcall muse-completing-read-function
;;                "Category: "
;;                (mapcar 'list (muse-project-recurse-directory
;;                               muse-blosxom-base-directory)))
      )
    (read-string "Title: ")))
  (add-to-list 'tags category)

  (let ((file (muse-blosxom-title-to-file (concat (format-time-string "%Y-%m-%d ") title))))
    (muse-project-find-file
     file "blosxom" nil
     (if muse-blosxom-use-tags
;;       here i change this line to use both tag and category
;;          (directory-file-name muse-blosxom-base-directory)
         (concat (directory-file-name muse-blosxom-base-directory)
                 "/" category)
       (concat (directory-file-name muse-blosxom-base-directory)
               "/" category)
       )))
  (goto-char (point-min))
  (insert "#date " (format-time-string "%Y-%m-%d-%H-%M")
          "\n#title " title)
  (if muse-blosxom-use-tags
      (if (> (length category) 0)
;; and i add category here
          (insert (concat (concat "\n#category " category)
;;                        (concat "\n#tags " (mapconcat #'identity category ",")))))
                          (concat "\n#tags " (mapconcat #'identity tags ",")))))
    (unless (string= category "")
      (insert (concat "\n#category " category))))
  (insert "\n\n")
  (forward-line 2))