;; -*- lexical-binding: t -*-

;; Keep scratch buffers empty
(setq initial-scratch-message
  "Hello! Welcome to the emacs scratch buffer!
Type 'Ctrl h h' For a quick help popup")

;; Indent lisp code in the common lisp format
;; Anyone reading this confused, really
;; doesnt need to be concerned about this
(setq lisp-indent-function 'common-lisp-indent-function)

;; Lisp code should indent in sets of 2, instead of the default 8
(setq lisp-indent-offset 2)

;; Display 
(which-key-mode)
