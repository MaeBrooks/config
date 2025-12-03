;; -*- lexical-binding: t -*-

(when (< emacs-major-version 30)
	(error "Hey, so, this wont work, use emacs version 30 or higher"))

(setq custom-file "~/.emacs.custom.el")

;; use-package comes with emacs, but you can choose to build without it
;; We require it anyways
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;; Macos window ui - transparent, dark mode, and no title bar.
(when (memq window-system '(mac ns))
	(let ((alpha 80))
		(set-frame-parameter nil 'alpha (list alpha alpha)))
	(add-to-list 'default-frame-alist '(ns-appearance . dark))
	(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(use-package exec-path-from-shell :ensure t :config
	(exec-path-from-shell-initialize))

(use-package catppuccin-theme
	:vc (:url "https://github.com/catppuccin/emacs" :branch main :rev :newest)
	:ensure t
	:config
	(load-theme 'catppuccin :no-confirm)
	(catppuccin-load-flavor 'mocha)

	(if (x-list-fonts "Hack")
		(set-frame-font "Hack-18" nil)))

;; Technically this does "nothing" but make the code a bit cleaner
(use-package emacs :ensure t :config
	;; Type y or n instead of yes or no
	(defalias 'yes-or-no-p 'y-or-n-p)

	;; Makes the move a few lines up and down bindings less jarring IMO
	(global-set-key (kbd "M-v") (lambda () (interactive) (previous-line 6)))
	(global-set-key (kbd "C-v") (lambda () (interactive) (next-line 6)))

	;; Replace fill-column with dired
	(global-set-key (kbd "C-x f") 'find-file)
	(setq dired-dwim-target t)

	;; The M-x compile ignores ansi color filters by default, lets not do that
	(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

	;; If you have a ~/.emacs.local.el
	;; include it! I dont commit this file, usually it will contain private work stuff
	(if (file-exists-p "~/.emacs.local.el")
			(load-file "~/.emacs.local.el"))

	;; Open up this file!
	(defun config ()
		(interactive)
		(find-file (format "%s%s" (getenv "HOME") "/.emacs")))
	;; Open up the stream!
	(defun stream ()
		(interactive)
		(find-file (format "%s%s" (getenv "HOME") "/.notes/stream.org")))
	(defun docket ()
		(interactive)
		(find-file (format "%s%s" (getenv "HOME") "/.notes/docket.org")))

	;; Often I need to get the full path of a file
	;; Now you can do so with M-x pwd
	(defun pwd ()
		(interactive)
		(kill-new (buffer-file-name))
		(message (buffer-file-name))))

;; Project is a built in emacs package that contains project level commands
;; Check it out with:
;;	 C-x p p - switch to project
;;	 C-x p c - run M-x compile at the project root
(use-package project :ensure t :config
	;; Replace find-file with project file search
	(global-set-key (kbd "C-x C-f") 'project-find-file)

	;; Replace find-file (readonly) with project grep (which is set to us ripgrep (rg) as the default grep command
	;; This is set using M-x customize-variable xref-search-program 'ripgrep
	(global-set-key (kbd "C-x C-r") 'project-find-regexp))

;; Magit - The only git thing you want, need, or will ever be happy with again :3
(use-package magit :ensure t
	:config
	(defalias 'magit-show 'magit-log-buffer-file)

	(defun magit-copy-branch-name ()
		"copy the current branch name to the system clipboard"
		(interactive)
		(if (magit-get-current-branch)
			(progn
				(kill-new (magit-get-current-branch))
				(message "%s" (magit-get-current-branch)))
			(user-error "No Current branch!!")))

	(use-package git-gutter :ensure t
		:vc (:url "https://github.com/emacsorphanage/git-gutter" :branch master :rev :newest)
		:config
		(global-git-gutter-mode +1)))

(use-package multiple-cursors :ensure t :config
	(define-key mc/keymap (kbd "<return>") nil)
	;; Mark next line
	(global-set-key (kbd "C-M-c") 'mc/mark-next-like-this)
	(global-set-key (kbd "C-M-d") 'mc/mark-all-in-region))

;; Vertical completion - see completion options
(use-package compat :ensure t :config
	(use-package vertico :ensure t :after compat :config
		(context-menu-mode t)
		;; Hide commands for other modes
		(setopt
			vertico-mode t
			vertico-mouse-mode t
			vertico-cycle t
			enable-recursive-minibuffers t
			read-extended-command-predicate #'command-completion-default-include-p)))

;; Better completion order for multiple packages
(use-package orderless :ensure t :config
	:custom
	(completion-styles '(orderless basic))
	(completion-pcm-leading-wildcard t)
	(completion-category-overrides '((file (styles partial-completion)))))

	;; Auto completion while typing
(use-package corfu :ensure t :init (global-corfu-mode) :config
	(setopt
	 corfu-auto t
	 corfu-auto-delay 0.1
	 corfu-cycle t)

	;; Icons for completion
	(use-package svg-lib :ensure t :config)
	(use-package kind-icon :ensure t :after corfu :config
		(add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)))

;; Snippets!
(use-package yasnippet :ensure t :config
	(setq yas-snippet-dirs `(,(format "%s/%s" (getenv "HOME") ".emacs.snippets")))
	(yas-global-mode t))


(use-package eglot :ensure t :config
	;; Show code actions, like add import!
	(global-set-key (kbd "M-n") 'eglot-code-actions)
	;; Format the current buffer
	(global-set-key (kbd "C-x C-q") 'eglot-format-buffer)
	;; Goto definition
	(global-set-key (kbd "C-M-i") 'xref-find-definitions)
	;; Show the definition of the current item at cursor
	(global-set-key (kbd "s-n") 'eldoc-doc-buffer)

	;; (use-package go-mode :ensure t)

	(use-package lua-mode :ensure t :mode "\\.lua$")

	(use-package typescript-ts-mode :ensure t :mode "\\.ts[x]*$")

	(use-package gdscript-mode
		:vc (:url "https://github.com/godotengine/emacs-gdscript-mode" :branch master :rev :newest)
		:ensure t
		:mode "\\.gd$"
		:hook (gdscript-mode . eglot-ensure)
		:custom (gdscript-eglot-version 3))

	(use-package zig-mode :ensure t
		:hook (zig-mode . eglot-ensure)
		:config
		(setenv "PATH" (format "%s:%s"
				 (format "%s/opt/zig-15" (getenv "HOME"))
				 (getenv "PATH")))
		(setenv "PATH" (format "%s:%s"
				 (format "%s/opt/zls" (getenv "HOME"))
										 (getenv "PATH")))
		(use-package zig-ts-mode
			:vc (:url "https://codeberg.org/meow_king/zig-ts-mode" :branch main :rev :newest)
			:ensure t
			:mode "\\.zig$"
			:hook (zig-mode . zig-ts-mode)))

	(use-package odin-ts-mode :ensure t
		:vc (:url "https://github.com/Sampie159/odin-ts-mode" :branch main :rev :newest)
		:mode "\\.odin\\'"))

;; Org-mode! Note taking is awesome
(use-package org :ensure t)

;; Tree sitter setup
(use-package treesit-fold :ensure t :if (treesit-available-p) :config
	;; Add tree sitter grammar locations! so that emacs can prompt and install them
	(setq treesit-language-source-alist '())
	(defun add-ts-grammar (mode-name url &optional branch folder)
		(add-to-list 'treesit-language-source-alist (list mode-name url branch folder)))

	;; C language
	(add-ts-grammar 'c "https://github.com/tree-sitter/tree-sitter-c")
	(add-hook 'c-mode-hook 'c-++-ts-mode)
	;;
	(add-ts-grammar 'odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")

	;; Gd script
	(add-ts-grammar 'gd "https://github.com/PrestonKnopp/tree-sitter-gdscript.git")
	(add-ts-grammar 'zig "https://github.com/maxxnino/tree-sitter-zig")

	;; Web
	(add-ts-grammar 'css "https://github.com/tree-sitter/tree-sitter-css")
	(add-ts-grammar 'html "https://github.com/tree-sitter/tree-sitter-html")
	(add-ts-grammar 'typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(add-ts-grammar 'javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	;; (add-ts-grammar tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")

	;; General
	(add-ts-grammar 'elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(add-ts-grammar 'bash "https://github.com/tree-sitter/tree-sitter-bash")
	(add-ts-grammar 'markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(add-ts-grammar 'json "https://github.com/tree-sitter/tree-sitter-json")

	;; (add-ts-grammar cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	;; (add-ts-grammar 'cmake "https://github.com/uyha/tree-sitter-cmake")
	;; (add-ts-grammar 'make "https://github.com/alemuller/tree-sitter-make")
	(add-ts-grammar 'go "https://github.com/tree-sitter/tree-sitter-go")
	(add-ts-grammar 'ruby "https://github.com/tree-sitter/tree-sitter-ruby")
	(add-ts-grammar 'python "https://github.com/tree-sitter/tree-sitter-python")
	(add-ts-grammar 'toml "https://github.com/tree-sitter/tree-sitter-toml")
	(add-ts-grammar 'yaml "https://github.com/ikatyang/tree-sitter-yaml"))

;; Eww is the built in browser for emacs
;; It doesnt eval javascript, but its really really nice for documentation
;; purposes
(use-package eww :ensure t :config
	(global-set-key (kbd "M-s b") 'eww-list-bookmarks))

(defun init-package ()
	"Install missing packages & 'import' package so that you can do M-x package-install"
	(interactive)
	(require 'package)
	(package-initialize)
	(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
	(package-refresh-contents))

(load "~/.emacs.utils.el")

(load custom-file)
