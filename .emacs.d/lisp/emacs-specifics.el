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

;; This tells emacs to show emacs lisp in more colors than bland
(setq elisp-fontify-semantically t)
(when elisp-fontify-semantically
  ;; Tell emacs to never underline variables
  (set-face-underline 'elisp-free-variable nil)

  ;; Tell emacs to make arguments and let variables italic
  (let ((-use-italics nil))
    (set-face-italic 'elisp-free-variable -use-italics)
    (set-face-italic 'elisp-bound-variable -use-italics)
    (set-face-italic 'elisp-binding-variable -use-italics)))

;; Typing a command? Emacs will also tell you the keybinding alongside the function
(which-key-mode)
