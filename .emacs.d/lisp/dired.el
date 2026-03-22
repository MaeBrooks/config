;; -*- lexical-binding: t -*-

;; Emacs by default uses C-x f to set the 'fill' column
;; 'fill'-ing is a technique for formatting text, like paragraphs.
;; Personally, I don't use this at all. So, its been overwritten with
;; a 'go to this file!' command
(global-set-key (kbd "C-x f") 'find-file)

;; Want to copy or move files to/from another directory?
;; This allows you to target those files with 'm'
;; and then in the other buffer, use 'C' or 'R' to copy and move
;; those files over!
(setq dired-dwim-target t)
