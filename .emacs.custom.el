;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("." . "~/.emacs.d/.saves")))
 '(catppuccin-flavor 'mocha)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(create-lockfiles nil)
 '(css-indent-offset 2)
 '(custom-safe-themes
    '("4f79800557fec5f3db08b1643e43931eb0bbbed99db4862ec5611a3e5b46171c"
       "9c6aa7eb1bde73ba1142041e628827492bd05678df4d9097cda21b1ebcb8f8b9"
       default))
 '(eglot-ignored-server-capabilities '(:inlayHintProvider))
 '(git-gutter:added-sign "┃")
 '(git-gutter:deleted-sign "┃")
 '(git-gutter:modified-sign "│")
 '(global-display-line-numbers-mode t)
 '(global-whitespace-mode t)
 '(grep-command "rg -nS --no-heading ")
 '(indent-tabs-mode nil)
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
 '(org-clock-sound "~/.assets/old-phone-ringing.wav")
 '(org-timer-default-timer "5")
 '(org-timer-display 'frame-title)
 '(package-selected-packages '(catppuccin-theme emms exec-path-from-shell slime))
 '(package-vc-selected-packages
    '((slime :url "https://github.com/slime/slime.git" :branch "master")
       (catppuccin-theme :url "https://github.com/catppuccin/emacs"
         :branch "main")
       (odin-ts-mode :url "https://github.com/Sampie159/odin-ts-mode"
         :branch "main")
       (navigel :url "https://github.com/DamienCassou/navigel" :branch
         "master")
       (zig-ts-mode :url "https://codeberg.org/meow_king/zig-ts-mode"
         :branch "main")
       (git-gutter :url "https://github.com/emacsorphanage/git-gutter"
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
