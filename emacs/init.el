(require 'package)
(add-to-list `package-archives
  `("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

(defun install (name)
  (unless (package-installed-p name) (package-install name)))

(defun configure-emacs-globals ()
  (setq auto-save-default nil))
(configure-emacs-globals)

(defun configure-git ()
  (install 'magit))
(configure-git)

;; theme
(defun configure-ui ()
  ;; tool bars
  (menu-bar-mode 0)
  (toggle-scroll-bar 0)
  (tool-bar-mode 0)

  ;; remove the startup screen
  (setq inhibit-startup-screen t)

  ;; line numbers
  (global-display-line-numbers-mode)
  
  ;; highlighting
  (setq font-lock-maximum-decoration t)
  (setq font-lock-mode t)

  ;; font
  (let ((font "JetBrains Mono"))
    (set-face-attribute 'default nil :font font :height 140)
    (set-frame-font font 14 t))
  
  ;; Color scheme
  (unless (package-installed-p 'dracula-theme) (package-install 'dracula-theme))
  (load-theme 'dracula t)

  (install 'tree-sitter)
  (install 'tree-sitter-langs)
  (require 'tree-sitter)
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
)
(configure-ui)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(tree-sitter-langs tree-sitter dracula-theme magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
