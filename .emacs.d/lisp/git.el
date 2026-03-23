;; -*- lexical-binding: t -*-

;; (require 'transient)

;; VC-dir (the built in emacs git handling package)
;; does not support rebasing
;; It also doesnt seem to support signing commits with gpg / pinentry
;; (unless (locate-library "magit")
;;  (package-install 'magit))
;; (require 'magit)

(require 'transient)

(package 'git)

(term "git commit -m 'Hi mae'")

(defun git-init ())
(defvar git-init-function 'git-init)

;; ;; ;;

;; (defun git-commit-arguments nil (transient-args 'git-commit))

(defun git-root ()
  (interactive)
  (let ((root (project-root (project-current))))
    (when (not (stringp root))
      (project-switch-project)
      (setq root (project-root (project-current)))

      (if (not (stringp root))
	(error "No project found, unable to get git-root")))
    root))

(defun git-commit-create (&optional args)
  "Create a new commit."
  (interactive (list (git-commit-arguments)))
  
  (when (setq args (git-commit-assert args))
    (let ((default-directory (git-root)))
      (term-exec-1 "commit -m" ))))

(defun tmp ()
  (message "HAI"))

(defun git--commit (&optional args)
  "Just a quick commit function"
  (interactive (list (transient-args transient-current-command)))
  ;; Create scratch buffer, with new git-commit-mode
  ;; in git-commit-mode, if C-c C-c is called,
  (let ((msg "hai mae - from git--commit"))
    (make-term "git-commit" (format "git commit -m '%s')" msg)
      )
    (message "%s" (list (transient-args transient-current-command))))
  

(transient-define-prefix git-commit ()
  "Git commit"
  ["Foo bar"
    ("c" "create" git--commit)])

(transient-define-prefix git-status ()
  "Git status"
  ["Commands"
    ("c" "commit" git-commit)])



