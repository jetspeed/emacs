(add-to-list 'load-path    "~/.emacs.d/myBigEmacs/rails/emacs-rails")
(add-to-list 'load-path    "~/.emacs.d/myBigEmacs/rails/ruby-mode")
(add-to-list 'load-path    "~/.emacs.d/myBigEmacs/rails/rails-other")
(add-to-list 'load-path    "~/.emacs.d/myBigEmacs/rails/rails-other/yaml-mode")


;;(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)
(setq auto-mode-alist  (cons '("\\.rjs$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rsel$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.autotest$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.xml$" . nxml-mode) auto-mode-alist))
(require 'rdoc-mode)
(setq auto-mode-alist  (cons '("\\README$" . rdoc-mode) auto-mode-alist))


(require 'snippet)
(require 'find-recursive)
(require 'rails)

(require 'toggle)
(toggle-style "rspec")
;; disable new line syntax check
(setq flymake-start-syntax-check-on-newline nil)

(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "IMENU")
            (require 'ruby-electric)
            (ruby-electric-mode t)
            (local-set-key "\t" 'hippie-expand)
            ;; for autotest
            (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)
            (define-key ruby-mode-map (kbd "C-c y") 'toggle-buffer)
            ))

(add-hook 'nxml-mode-hook
          (lambda ()
            (setq local-abbrev-table nxml-mode-abbrev-table)))

(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))


(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; for javascript

(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '( "\\.js\\'" . javascript-mode))

;; Rinari Mode (Rails)
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/rails/rinari")
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/rails/rinari/rhtml")
(require 'rinari)
(setq auto-mode-alist (cons '("\\.rhtml\\'" . rhtml-mode) auto-mode-alist))

;; for autotest

(require 'autotest)

(autoload 'autotest-switch "autotest" "doco" t)
(autoload 'autotest "autotest" "doco" t)

(define-prefix-command 'C-c-g-map)
(global-set-key (kbd "C-c g") 'C-c-g-map)

;; (global-set-key "\C-r"  'toggle-buffer)

(global-set-key (kbd "C-c g m") 'rails-nav:goto-models)

(global-set-key (kbd "C-c g c") 'rails-nav:goto-controllers)

(global-set-key (kbd "C-c g l") 'rails-nav:goto-layouts)

(global-set-key (kbd "C-c g j") 'rails-nav:goto-javascripts)

(global-set-key (quote [M-right]) 'ecb-nav-goto-next)
(global-set-key (quote [M-left]) 'ecb-nav-goto-previous)

;; (global-set-key (kbd "C-c g C") 'rails-model-layout:switch-to-controller)
;; (global-set-key (kbd "C-c g h") 'rails-controller-layout:switch-to-helper)
;; (global-set-key (kbd "C-c g M") 'rails-controller-layout:switch-to-model)
