;; -*- lexical-binding: t -*-

;; A transient (magit like) module for the
;; node package manager (NPM)
(require 'transient)

(defun -npm-process (cmd &optional args)
  (switch-to-buffer
    (apply 'make-term
      (append
	'("npm-process" "npm" nil)
	(append (list cmd) args)))))

(defun -npm--publish (&optional args)
  "Publishing a package does not default to the project root, it default the path to the current directory"
  (interactive (list (transient-args 'npm-publish)))

  (let* ((-run t)
	  ;; (-current-default-directory default-directory)
	  (-current-file-path (expand-file-name (buffer-file-name (window-buffer (minibuffer-selected-window)))))
	  (-current-directory (expand-file-name (file-name-parent-directory -current-file-path)))
	  (-project-directory (expand-file-name (project-root (project-current)))))

    ;; If the project directory is the current directory
    ;; Check with the user that they do indeed want to publish
    (when (string= -project-directory -current-directory)
      (setq -run
	(y-or-n-p "Current directory is project root. Are you sure you want to publish?")))

    ;; If the current file path is not apart of the current project
    ;; Ask the user if they really want to publish
    (if (and -run (not (file-in-directory-p -current-file-path -project-directory)))
      (setq -run
	(y-or-n-p
	  (format
	    "Folder: %s\nIs not apart of the current project, Are you sure you want to publish?"
	    -current-directory))))

    ;; Run publish with the current working directory
    (when -run
      (setq default-directory -current-directory)
      (-npm-process "publish" args))))

(transient-define-prefix npm-publish ()
  "Transient for running 'npm publish'"

  ["Flags"
    ("r" "Registry" "--registry=" :allow-empty nil)
    ("t" "Tag" "--tag=" :always-read t :allow-empty nil)]

  ["Commands"
    ("p" "Publish" -npm--publish)])

(defun -npm--add-user (&optional args)
  (interactive (list (transient-args 'npm-add-user)))
  (setq default-directory (project-root (project-current)))
  ;; Switch to terminal running our npm add-user command
  (-npm-process "add-user" args))

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
  (setq default-directory (project-root (project-current)))
  (-npm-process "install" args))

(transient-define-prefix npm-install ()
  "Transient for running 'npm install'"

  ["Flags"
    ("v" "Verbose" "--verbose" :always-read t)
    ("l" "Legacy Peer Deps" "--legacy-peer-deps" :always-read t)]

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
  (npm))

(add-to-list 'project-switch-commands '(project-npm "npm" "n"))
(global-set-key (kbd "C-x p n") 'project-npm)
