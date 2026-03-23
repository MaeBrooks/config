;; -*- lexical-binding: t -*-

;; (require 'transient)

;; VC-dir (the built in emacs git handling package)
;; does not support rebasing
;; It also doesnt seem to support signing commits with gpg / pinentry
(unless (locate-library "magit")
  (package-install 'magit))
(require 'magit)
