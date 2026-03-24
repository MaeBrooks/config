;; -*- lexical-binding: t -*-

;; Org files are a lot like markdown (.md) files
;; org has with slightly different syntax
;; But comes with much more powerful features
;; Org files have the extension (.org)
;; See: 'https://orgmode.org/'
(require 'org)

(defcustom docket-file "~/.emacs.d/docket.org"
  "The location of our docket file")

(defun docket ()
  "Open up our docket file"
  (interactive)
  (find-file docket-file))

;; When you open up a markdown file, set the mode to
;; Treesitter Markdown Mode
;; 'treesitter' is a tool for language highlighting
;; TLDR: Add highlighting to markdown files
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-ts-mode))
