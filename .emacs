                                        ; -*- lexical-binding: t -*-
(setq custom-file "~/.emacs.custom.el")
(setq inhibit-startup-message t)
(load-theme 'leuven-dark t)

(package-initialize :before)
(setopt package-archives '(("melpa" . "https://melpa.org/packages/")))
(if (not package-archive-contents) (package-refresh-contents))

;; Save Files
(setq-default indent-tabs-mode nil)
(setq create-lockfiles nil)
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

(setq todos nil)
(defmacro use-key (key cmd) `(global-set-key (kbd ,key) ,cmd))
(defmacro neq (lhs rhs) `(not (eq ,lhs ,rhs)))
(defmacro TODO (todo)
  `(cond ((eq todos nil)
          (setq todos '(,todo)))
         ((eq (cdr todos) nil)
          (setq todos (append todos ,todo)))
         ((setq todos (list (car todos) (cdr todos) ,todo)))))
(defmacro foreach (item items body)
  `(mapcar
    (lambda (,item) ,body)
    ,items))
(defmacro string-contains-p (sub str)
  "returns if string contains the substring"
  `(neq nil (string-match-p ,sub ,str)))
(defmacro light-cmd ()
  "The path for the current 'light' command"
  `(progn
     (shell-command "whereis light")
     (with-current-buffer shell-command-buffer-name
       (let* ((output (substring (buffer-string) 0 -1))
              (items (cdr (split-string output  " "))))
         (seq-find
          (lambda (item)
            (string-contains-p "/gnu/store/" item))
          items))
       )))

(defun execute-out (command)
    "Execute commands out to xterm, does not escape '"
    (interactive "scommand: ")
    (shell-command
       (format "LANG=C xterm -e 'cd %s && %s'" (pwd) command)))

(use-package dracula-theme :ensure
  :init
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode 0)
  (column-number-mode 1)
  (show-paren-mode 1)
  (set-frame-font "JetBrainsMono Nerd Font-14" nil t)
  (setq whitespace-style '(face tabs tab-mark))
  (global-whitespace-mode 1)
  (when (version<= "26.0.50" emacs-version) (global-display-line-numbers-mode))
  :config
  (setq custom--inhibit-theme-enable nil)
  (load-theme 'dracula t)
  (custom-set-faces
   '(org-level-1 ((t (:inherit bold :extend nil :foreground "#ff79c6" :overline "#5d5862" :weight bold :height 1.3))))))

(use-package dashboard :ensure
  :config
  (setq dashboard-banner-logo-title "Welcome! To Mae's Lair!")
  (setq dashboard-startup-banner (concat (getenv "HOME") "/.emacs-bongo-cat.gif"))
  (setq dashboard-footer-messages '("Be Chonker's Strongest Soilder!"))
  (setq dashboard-footer-icon nil)
  (setq dashboard-items '((recents . 3) (projects . 5) ( agenda . 5 )))
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content nil)

  (setq dashboard-startupify-list
        '(dashboard-insert-banner
          dashboard-insert-newline
          dashboard-insert-banner-title
          dashboard-insert-newline
          dashboard-insert-footer
          dashboard-insert-items
          dashboard-insert-newline
          dashboard-insert-init-info))
  (dashboard-setup-startup-hook))

(use-package geiser :ensure)
(use-package geiser-guile :ensure :mode "\\.scm$")

(use-package magit :ensure)

(use-package vertico :ensure
  :config
  (setopt
   vertico-mode t
   vertico-mouse-mode t
   vertico-cycle t))

(use-package orderless :ensure
  :config
  (setopt
   completion-styles '(orderless basic)
   completion-category-overrides '((file (styles partial-completion)))))

(use-package multiple-cursors :ensure
  :config
  (define-key mc/keymap (kbd "<return>") nil)
  (use-key "C-M-c" 'mc/mark-next-like-this))

(use-package eglot :ensure
  :config
  (use-key "C-x C-q" 'eglot-format-buffer))

(use-package emacs :ensure
  :config
  ;; (global-set-key (kbd "M-x") 'amx)
  (use-key "C-x f" 'find-file)
  (use-key "C-x C-f" 'find-file)
  (use-key "C-x h" 'dashboard-open)
  (use-key "C-M-d" 'eshell)
  (use-key "C-h d" 'apropos-documentation)
  (use-key "C-h k" 'describe-key)
  (use-key "C-M-i" 'xref-find-definitions)

  (setq initial-scratch-message nil)

  (progn
    ;; Tree Sitter
    (setq treesit-language-source-alist '())
    (defmacro use-grammar (file-type url)
      `(add-to-list 'treesit-language-source-alist '(,file-type ,url)))
    (use-grammar gren "https://github.com/MaeBrooks/tree-sitter-gren")
    (use-grammar c "https://github.com/tree-sitter/tree-sitter-c")
    (use-grammar cpp "https://github.com/tree-sitter/tree-sitter-cpp")
    (use-grammar cmake "https://github.com/uyha/tree-sitter-cmake")
    (use-grammar elisp "https://github.com/Wilfred/tree-sitter-elisp")
    (use-grammar make "https://github.com/alemuller/tree-sitter-make")
    (use-grammar bash "https://github.com/tree-sitter/tree-sitter-bash")
    (use-grammar markdown "https://github.com/ikatyang/tree-sitter-markdown")
    (use-grammar html "https://github.com/tree-sitter/tree-sitter-html")
    (use-grammar nix "https://github.com/nix-community/tree-sitter-nix")
    ;; (use-grammar css "https://github.com/tree-sitter/tree-sitter-css")
    ;; (use-grammar typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
    ;; (use-grammar javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
    ;; (use-grammar json "https://github.com/tree-sitter/tree-sitter-json")
    ;; (use-grammar python "https://github.com/tree-sitter/tree-sitter-python")
    ;; (use-grammar go "https://github.com/tree-sitter/tree-sitter-go")
    ;; (use-grammar toml "https://github.com/tree-sitter/tree-sitter-toml")
    
    ;; (use-grammar tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
    ;; (use-grammar yaml "https://github.com/ikatyang/tree-sitter-yaml")

    ;; (add-hook 'c-ts-mode-hook '(lambda () (add-hook 'after-save-hook 'eglot-format-buffer)))
    (add-hook 'c-mode-hook 'c-ts-mode)))

(use-package corfu :ensure
  :custom
  ;; auto complete
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  ;; "allows cycling through canidates"
  (corfu-cycle t)
  :init
  (global-corfu-mode))

(use-package org-roam :ensure
  :init
  (progn
    ;; (org-roam-db-autosync-mode)
    (defmacro mkdir-a (directory)
      `(unless (file-directory-p ,directory)
         (make-directory ,directory)))
    
    (setq org-directory        (format "%s/.notes" (getenv "HOME")))
    (setq org-roam-directory   (format "%s/.roam" org-directory))
    (setq org-agenda-directory (format "%s/.agenda" org-directory))
    (mkdir-a org-directory)
    (mkdir-a org-roam-directory)
    (mkdir-a org-agenda-directory)

    (setq org-agenda-files (list org-agenda-directory)))
  :config
  ;; Org Mode
  (setq org-hide-emphasis-markers t)
  (setq org-hide-leading-stars t)
  (setq org-list-allow-alphabetical t)
  (org-roam-db-autosync-mode)

  (progn
    ;; todo items
    (setq org-log-done t))

  (use-key "C-c a" 'org-agenda))

(use-package nix-ts-mode :ensure :mode "\\.nix$")


;; Just until I somehow get gren mode published?
;; (load "~/projects/gren-mode/gren-mode.el")


(load custom-file)
