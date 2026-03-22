;; -*- lexical-binding: t -*-

;; Tell Emacs to put file backups in the '~/.emacs.d/.saves' folder
(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))

;; Tell Emacs not to create so many of those '#file-name' files
(setq create-lockfiles nil)
