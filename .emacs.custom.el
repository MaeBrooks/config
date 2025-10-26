;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("." . "~/.emacs.d/.saves")))
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(create-lockfiles nil)
 '(css-indent-offset 2)
 '(git-gutter:added-sign "┃")
 '(git-gutter:deleted-sign "┃")
 '(git-gutter:modified-sign "│")
 '(global-display-line-numbers-mode t)
 '(global-whitespace-mode t)
 '(grep-command "rg -nS --no-heading ")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(lisp-indent-function 'common-lisp-indent-function)
 '(lisp-indent-offset 2)
 '(lua-indent-close-paren-align nil)
 '(lua-indent-level 2)
 '(lua-indent-nested-block-content-align nil)
 '(lua-ts-indent-continuation-lines nil)
 '(lua-ts-indent-offset 2)
 '(menu-bar-mode nil)
 '(package-selected-packages
		'(corfu dracula-theme gdscript-mode git-gutter go-mode kind-icon
			 lua-mode magit multiple-cursors orderless treesit-fold vertico
			 yasnippet zig-mode))
 '(package-vc-selected-packages
		'((git-gutter :url "https://github.com/emacsorphanage/git-gutter"
				:branch "master")
			 (gdscript-mode :url
				 "https://github.com/godotengine/emacs-gdscript-mode" :branch
				 "master")))
 '(scroll-bar-mode nil)
 '(split-height-threshold nil)
 '(split-width-threshold nil)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(transient-default-level 7)
 '(treesit-font-lock-level 4)
 '(vertico-sort-function 'vertico-sort-history-length-alpha)
 '(web-mode-code-indent-offset 2)
 '(whitespace-style '(face trailing tabs tab-mark))
 '(xref-search-program 'ripgrep)
 '(zig-format-on-save nil)
 '(zig-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:background "none" :foreground "#565575")))))
