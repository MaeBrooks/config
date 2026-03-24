;; -*- lexical-binding: t -*-

;; A transient (magit like) module for the
;; node package manager (NPM)
(require 'transient)

(defun -npm--publish (&optional args)
  (interactive (list (transient-args 'npm-publish)))
  ;; Switch to terminal running our npm publish command
  (switch-to-buffer
    (apply 'make-term
      (append
	'("npm-process" "npm" nil)
	(append '("publish") args)))))

(transient-define-prefix npm-publish ()
  "Transient for running 'npm publish'"

  ["Flags"
    ("r" "Registry" "--registry=" :allow-empty nil)
    ("t" "Tag" "--tag=" :always-read t :allow-empty nil)]

  ["Commands"
    ("p" "Publish" -npm--publish)])

(defun -npm--add-user (&optional args)
  (interactive (list (transient-args 'npm-add-user)))
  ;; Switch to terminal running our npm add-user command
  (switch-to-buffer
    (apply 'make-term
      (append
	'("npm-process" "npm" nil)
	(append '("add-user") args)))))

(transient-define-prefix npm-add-user ()
  "Transient for running 'npm add-user'"

  ["Flags"
    ("r" "Registry" "--registry=" :allow-empty nil)]

  ["Commands"
    ("a" "Add User" -npm--add-user)])

;; Actually runs the npm install command in the background
(defun -npm--install (&optional args)
  (interactive (list (transient-args 'npm-install)))
  ;; Switch to terminal running our npm install command
  (switch-to-buffer
    (apply 'make-term
      (append
	'("npm-process" "npm" nil)
	(append '("install") args)))))

(transient-define-prefix npm-install ()
  "Transient for running 'npm install'"

  ["Flags"
    ("v" "Verbose" "--verbose"
      :always-read t :allow-empty t
      :init-value (lambda (v) (oset v value "")))
    ("l" "Legacy Peer Deps" "--legacy-peer-deps")]

  ["Commands"
    ("i" "Install" -npm--install)])

(transient-define-prefix npm ()
  "Transient for running npm commands"
  ["Arguments"]
  ["Commands"
    ("i" "Install" npm-install)
    ("a" "Add User" npm-add-user)
    ("p" "Publish package" npm-publish)])

(defun project-npm ()
    (interactive)
    (let ((default-directory (project-root (project-current))))
      (npm)))

(add-to-list 'project-switch-commands '(project-npm "npm" "n"))
(global-set-key (kbd "C-x p n") 'project-npm)

