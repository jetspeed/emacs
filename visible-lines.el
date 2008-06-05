;;; visible-lines.el --- move across visible lines instead of logic lines

;; Authors:    an0@bbs.newsmth.org
;; Maintainer: an0@bbs.newsmth.org
;; Keywords: convenience, continuation
;; Last updated: Mar 27, 2007

;; Copyright (C) an0@bbs.newsmth.org

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301 USA

;;; Commentary:

;; Long lines can be wrapped for nice visual effect in Emacs. However
;; the line-oriented movements are still done on logic lines, which is
;; not so convenient or even anti-intuitive sometimes. For example,
;; imagine you were on the first visible line of a wrapped very long
;; line(say, wrapped to totally 10 visible lines) and wanted to move to
;; the 5th visible line. How would you do it? It turns out that no
;; matter you traveled from the very beginning or the very end(you could
;; move-end-of-line first), it was a suffering. Long lines mode which is
;; included as a standard library solve most of the long lines problem;
;; but it only provides movements across those space-delimited
;; continuation lines, which is unreasonable to people whose language
;; does not use space characters to delimit words or even sentences, for
;; example, we Chinese. Visible line mode provides means to do more
;; general visible-line-oriented movements, irrespective of where the
;; lines are wrapped.

;; To Chinese users:
;; visible lines mode 支持由字符宽度不等的多种字符集组成的混合文本，如可
;; 以正确处理中英文混合编辑。

;; Key bindings:
;; c-n	visible-lines-next-line		Move to the next visible line
;; c-p	visible-lines-previous-line		Move to the previous visible line
;; c-a  visible-lines-move-beginning-of-line	Move to the beginning of visible
;;                                      line
;; c-e  visible-lines-move-end-of-line	Move to the end of visible line

;; Put this file into your load-path and the following into your
;; ~/.emacs:
;;       (require 'visible-lines)

;;; Code:
(defvar visible-lines-goal-column nil
  "Semipermanent goal column for vertical motion.")
(make-variable-buffer-local 'visible-lines-goal-column)

(defvar visible-lines-mode-map nil
  "Local keymap for visible line mode.")

;; set up the keymap
(when (null visible-lines-mode-map)
  (setq visible-lines-mode-map (make-sparse-keymap))
  (define-key visible-lines-mode-map "\C-n" 'visible-lines-next-line)
  (define-key visible-lines-mode-map "\C-p" 'visible-lines-previous-line)
  (define-key visible-lines-mode-map "\C-a" 'visible-lines-move-beginning-of-line)
  (define-key visible-lines-mode-map "\C-e" 'visible-lines-move-end-of-line))

(defun visible-lines-beginning-column (&optional n)
  "Return the column of the first character on the current visible line.
With argument n not nil or 1, move forward n - 1 visible lines
first. If scan reaches end of buffer, return that column.

This function does not move point."
  (if (not n)
      (setq n 1))
  (save-excursion
    (visible-lines-beginning-of-line n)
    (current-column)))

(defun visible-lines-end-column (&optional n)
  "Return the column of the last character on the current visible line.
With argument n not nil or 1, move forward n - 1 lines visible
first. If scan reaches end of buffer, return that column.

This function does not move point."
  (if (not n)
      (setq n 1))
  (save-excursion
    (visible-lines-end-of-line n)
    (current-column)))

(defun visible-lines-next-line (&optional line)
  "next-line over visible lines"
  (interactive "p")
  (if (not (member last-command '(visible-lines-next-line visible-lines-previous-line)))
      (setq visible-lines-goal-column
	    (- (current-column)
	       (visible-lines-beginning-column))))
  (vertical-motion line)
  (move-to-column
   (+ (current-column)
      (min (- (visible-lines-end-column) (current-column)) visible-lines-goal-column))))


(defun visible-lines-previous-line (&optional line)
  "previous-line over visible lines"
  (interactive "p")
  (visible-lines-next-line (- line)))

(defun visible-lines-move-beginning-of-line (&optional line)
  "Move point to beginning of current visible line.
With argument line not nil or 1, move forward arg - 1 lines
first. If point reaches the beginning or end of buffer, it stops
there."
  (interactive "p")
  (visible-lines-beginning-of-line line))

(defun visible-lines-beginning-of-line (&optional line)
  "Move point to beginning of current visible line.
With argument line not nil or 1, move forward arg - 1 lines
first. If point reaches the beginning or end of buffer, it stops
there."
  (if (not line)
      (setq line 1))
  (vertical-motion (1- line)))

(defun visible-lines-move-end-of-line (&optional line)
  "Move point to end of current visible line.
 With argument line not nil or 1, move forward arg - 1 lines
first. If point reaches the beginning or end of buffer, it stops
there."
  (interactive "p")
  (visible-lines-end-of-line line))

(defun visible-lines-end-of-line (&optional line)
  "Move point to end of current visible line.
 With argument line not nil or 1, move forward arg - 1 lines
first. If point reaches the beginning or end of buffer, it stops
there."
  (if (not line)
      (setq line 1))
  (if (= (vertical-motion line) line)
      (forward-char -1)))

(defun bovlp ()
  "Tell whether the point is at visible-lines-beginning-of-line."
  (let ((current-point (point)))
    (save-excursion
      (visible-lines-beginning-of-line)
      (= current-point (point)))))

(defun eovlp ()
  "Tell whether the point is at visible-lines-end-of-line."
  (let ((current-point (point)))
    (save-excursion
      (visible-lines-end-of-line)
      (= current-point (point)))))
    
(define-minor-mode visible-lines-mode
  "Toggle Visible Line mode.
In Visible Lines mode, wrapped continuation lines are treated as
  seperate lines in process of line-oriented movements:
	`next-line'
	`previous-line'
	`beginning-of-line'
	`end-of-line'"
  :lighter " Visible-Lines" :keymap visible-lines-mode-map)

(provide 'visible-lines)
;;; visible-lines.el ends here