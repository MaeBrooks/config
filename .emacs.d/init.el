;; -*- lexical-binding: t -*-

(progn
  ;; 1 of 2 exceptions for external packages
  ;; exec-path-from-shell ensures that the $PATH that you see in your shell
  ;; is the same $PATH that emacs sees for commands
  (unless (locate-library "exec-path-from-shell")
    (package-install 'exec-path-from-shell t nil))
  
  (require 'exec-path-from-shell)
  (setq exec-path-from-shell-debug t)
  (exec-path-from-shell-initialize))


;; Load files in the lisp directory
;; In this case, we include "Common lisp" for the `loop for file in ...` macro used below
(require 'cl nil t)

;; Load our configuration files
(loop for file in (directory-files "~/.emacs.d/lisp" t ".el")
  do (load file))
