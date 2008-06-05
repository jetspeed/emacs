(require 'header)
;; (defvar wcy-header-project-name "XXXXXX")
;; 为header帮定一个 C-c p前缀
;; 主要用来program用的
;; (define-prefix-command 'C-c-p-map)
;; (global-set-key (kbd "C-c p") 'C-c-p-map)
;; (global-set-key (kbd "C-c p c") 'wcy-c-mode-config-header)
;; (global-set-key (kbd "C-c p h") 'make-header)
;; (global-set-key (kbd "C-c p r") 'make-revision)
(defun wcy-c-mode-config-header ()
  (interactive)
  (setq header-copyright-notice "
   (c) 2007 RDCPS.IOS.CAS
   addr: RDCPS, No.4 ZhongGunCun south 4th. Street, Beijing, 100080

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2, or (at
   your option) any later version.
   
   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.
")
  (make-local-variable 'user-full-name)
  (make-local-variable 'user-mail-address)
  (setq user-full-name "Xuanqiang Wang")
  (setq user-mail-address "shmimy-w@163.com")

  (setq  make-header-hooks '(header-mode-line
                             header-blank
                             ;;header-rcs
                             ;;header-AFS
                             wcy-header-file-name
;;                              wcy-header-project-name
                             wcy-header-file-description
                             header-creation-date
                             ;;header-rcs
                             header-author
                             wcy-header-author-email
                             header-modification-author
                             header-modification-date
                             header-update-count
;;                              header-blank
                             header-copyright
;;                              header-blank

                             ;;header-status
                             ;; Re-enable the following lines if you wish
;;                              header-blank
                             header-history
                             ;;header-purpose
                             ;;header-toc
                             header-blank
                             wcy-header-end-comment
                             ))
  (setq file-header-update-alist nil)
  (progn
    (register-file-header-action "[ \t]Update Count[ \t]*: "
                                 'update-write-count)
    (register-file-header-action "[ \t]Last Modified By[ \t]*: "
                                 'update-last-modifier)
    (register-file-header-action "[ \t]Last Modified On[ \t]*: "
                                 'update-last-modified-date)
    (register-file-header-action " File            : *\\(.*\\) *$" 'wcy-update-file-name)
    ))


(defun wcy-header-file-name ()
  "Places the buffer's file name and leaves room for a description."
  (insert header-prefix-string "File            : " (buffer-name) "\n")
  (setq return-to (1- (point))))
(defun wcy-header-project-name ()
  (insert header-prefix-string "Program/Library : " wcy-header-project-name "\n"))
(defun wcy-header-file-description()
  (insert header-prefix-string "Description     : \n"))
(defun wcy-header-author-email ()
  (insert header-prefix-string "Mail            : " user-mail-address "\n"))

(defun wcy-header-end-comment ()
  (if comment-end
      (insert  comment-end "\n")))
(defun wcy-update-file-name ()
  (beginning-of-line)
  ;; verify that we are looking at a file name for this mode
  (if (looking-at
       (concat (regexp-quote (header-prefix-string)) "File            : *\\(.*\\) *$"))
      (progn
        (goto-char (match-beginning 1))
        (delete-region (match-beginning 1) (match-end 1))
        (insert (file-name-nondirectory (buffer-file-name)) )
        )))