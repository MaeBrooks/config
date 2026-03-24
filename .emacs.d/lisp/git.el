;; -*- lexical-binding: t -*-

;; (require 'transient)

;; VC-dir (the built in emacs git handling package)
;; does not support rebasing or signing commits with gpg / pinentry
;; This is the one exception to 'no external packages'
;; Magit is basically an internal package anyways
(unless (locate-library "magit")
  (package-install 'magit t nil))
