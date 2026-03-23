;; -*- lexical-binding: t -*-

;; 'project' is the emacs package that contains commands for working with
;; 'projects' -- For all intents and purposes, a project is basically a git
;;               project and its contents.
;;
;;               Its useful to note, that most commands are reachable with:
;;               'C-x p p' -> select project ->
;;                     f: find file in project
;;                     g: grep for text in project
;;                     d: find directory in project
;;                     v: open version control interface (git) for project
;;
;; Useful keybinds:
;; C-x p b: Switch to open buffer in project
;; C-x p f: find file in project
;; C-x p d: find directory in project
;;          (if you want a general, 'open this directory' use: C-x d)
(require 'project)

;; Set 'C-x C-f' to multi directory file search
(global-set-key (kbd "C-x C-f") 'project-find-file)

;; Set 'C-x C-r' to project wide text search
(global-set-key (kbd "C-x C-r") 'project-find-regexp)
