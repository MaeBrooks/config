;; -*- lexical-binding: t -*-

;; Load files in the lisp directory
;; Dont worry about this code
(require 'cl nil t)
(loop for file in (directory-files "~/.emacs.d/lisp" t ".el")
  do (load file))

(dired "~")
