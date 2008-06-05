;;; color-emms-old.el --- install color themes
(add-to-list 'load-path "~/.emacs.d/myBigEmacs/emms/")
(require 'emms-setup)
(emms-devel)

;; players
(setq emms-player-mplayer-command-name "mplayer"
      ;emms-player-mpg321-command-name "mpg321"
      emms-player-mplayer-parameters '("-slave")
      ;emms-player-mplayer-parameters '("-playlist")
      emms-player-list '(emms-player-mplayer
                         emms-player-mplayer-playlist
                         emms-player-ogg123
                         emms-player-mpg321))
(setq emms-player-mpg321-parameters '("-o" "oss"));;mpg321使用alsa输出
;; coding
(setq emms-info-mp3info-coding-system 'gbk
      emms-lyrics-coding-system 'gbk
      emms-cache-file-coding-system 'utf-8)

;; files
(setq emms-source-file-default-directory "~/music/auto"
      emms-lyrics-dir "~/music/auto"
)

;; mode line format
(setq emms-mode-line-format "[ %s ]"
      emms-lyrics-display-format "      %s"
      emms-playing-time-display-format "%s")

(setq global-mode-string
      '("" appt-mode-string
        display-time-string " "
        battery-mode-line-string " "
        erc-modified-channels-object
        emms-mode-line-string " "
        emms-playing-time-string " "
        emms-lyrics-mode-line-string " "))
(setq emms-lyrics-scroll-timer-interval 8)
;; faces
(set-face-foreground 'emms-playlist-selected-face "magenta")
(set-face-foreground 'emms-playlist-track-face  "green")

(setq emms-source-file-directory-tree-function
      'emms-source-file-directory-tree-find)

(add-hook 'emms-player-started-hook 'emms-show)

(setq emms-playlist-sort-prefix "S")

(define-key emms-playlist-mode-map (kbd "S s") 'emms-playlist-sort-by-score)

(global-set-key (kbd "<f3>") 'emms-playlist-mode-go-popup)

(defun emms-playlist-mode-jump ()
  "Jump to the directory of track at point in `emms-playlist-buffer'."
  (interactive)
  (dired
   (file-name-directory
    (emms-track-get (emms-playlist-track-at) 'name))))

(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e b") 'emms-start)
(global-set-key (kbd "C-c e x") 'emms-stop)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e o") 'emms-show)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e SPC") 'emms-pause)
(global-set-key (kbd "C-c e f") 'emms-no-next)
(global-set-key (kbd "C-c e a") 'emms-add-directory-tree)

(global-set-key (kbd "C-c e r")   'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R")   'emms-toggle-repeat-playlist)
(global-set-key (kbd "C-c e m")   'emms-lyrics-toggle-display-on-minibuffer)
(global-set-key (kbd "C-c e M")   'emms-lyrics-toggle-display-on-modeline)

(global-set-key (kbd "C-c e 0") 'emms-volume-raise)
(global-set-key (kbd "C-c e 9") 'emms-volume-lower)

(global-set-key (kbd "C-c e <left>")  (lambda () (interactive) (emms-seek -10)))
(global-set-key (kbd "C-c e <right>") (lambda () (interactive) (emms-seek +10)))
(global-set-key (kbd "C-c e <down>")  (lambda () (interactive) (emms-seek -60)))
(global-set-key (kbd "C-c e <up>")    (lambda () (interactive) (emms-seek +60)))

(global-set-key (kbd "C-c e s u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e s d") 'emms-score-down-playing)
(global-set-key (kbd "C-c e s o") 'emms-score-show-playing)

(global-set-key (kbd "C-c e l") 'baidu-lrc-get)
(global-set-key (kbd "C-c e 3") 'baidu-mp3-get)
;;; for baiduMusic

;;; (setq emms-lyrics-dir "~/music/")
;;; (setq emms-source-file-default-directory "~/music/")
(defvar my-bin-path "/home/wangxq/bin/")
(defun baidu-mp3-get (name)
  (interactive "P")
  (if name
      (let ((default-path emms-lyrics-dir)
            (musicname (concat "-n" name))
            (musicpath (concat "-p" emms-source-file-default-directory)))
        (start-process "baiduMusic" "*Messages*" (concat my-bin-path "baiduMusic") musicname musicpath "-m"))
    (let ((default-music (if (and transient-mark-mode mark-active)
                             (buffer-substring-no-properties (region-beginning) (region-end))
                           (current-word nil t)))
          (default-path emms-lyrics-dir))
      (setq music (read-string (format "Music Name is (default %s): " default-music) nil nil default-music))
      (setq path (read-string (format "Store path is (default %s): " default-path) nil nil default-path))
      (setq musicname (concat "-n" music))
      (setq musicpath (concat "-p" path))
      (start-process "baiduMusic" "*Messages*" (concat my-bin-path "baiduMusic") musicname musicpath "-m -l"))))


(defun baidu-lrc-get (name)
  (interactive "P")
  (if name
      (let ((default-path emms-lyrics-dir))
        (setq musicname (concat "-n" name))
        (setq musicpath (concat "-p" emms-lyrics-dir))
        (start-process "baiduMusic" "*Messages*" (concat my-bin-path "baiduMusic") musicname musicpath "-l"))
    (let ((default-lyrics (if (and transient-mark-mode mark-active)
                              (buffer-substring-no-properties (region-beginning) (region-end))
                            (current-word nil t)))
          (default-path emms-lyrics-dir))
      (setq lyrics (read-string (format "Music Name is (default %s): " default-lyrics) nil nil default-lyrics))
      (setq path (read-string (format "Store path is (default %s): " default-path) nil nil default-path))
      (setq musicname (concat "-n" lyrics))
      (setq musicpath (concat "-p" path))
                                        ;    (message "get lyrics of %s to the dir of%s" musicname musicpath)
      (start-process "baiduMusic" "*Messages*" (concat my-bin-path "baiduMusic") musicname musicpath "-l"))))
