;; -*- lexical-binding: t -*-

;; (require 'transient)

;; VC-dir (the built in emacs git handling package)
;; does not support rebasing or signing commits with gpg / pinentry
;; This is the one exception to 'no external packages'
;; Magit is basically an internal package anyways
(unless (locate-library "magit")
  (package-install 'magit t nil))

(require 'magit)
(defun setup-magit ()
  (setq project-switch-commands
    '((project-find-file "Find file")
       (project-find-regexp "Find regexp")
       (project-find-dir "Find directory")
       (magit-status "Magit" "m")
       (project-eshell "Eshell"))))

(add-hook 'after-init-hook 'setup-magit)
