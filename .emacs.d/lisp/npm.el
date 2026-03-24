;; -*- lexical-binding: t -*-

(require 'transient)

;; TODO Transient for npm commands

(defun -npm--install (&optional args)
  (interactive (list (transient-args 'npm-install)))

  (message "npm install %s" '("--legacy-peer-deps"))
  (message "npm install %s" args)
  (apply 'make-term
    (append
      '("npm-process" "npm" nil)
      (append '("install") args))))

(transient-define-prefix npm-install ()
  "Transient for runnin 'npm install'"

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
    ("i" "Install" npm--install)])

