(require 'package)
(add-to-list `package-archives
  `("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

(defun install (name)
  (unless (package-installed-p name) (package-install name)))

(defun configure-emacs-globals ()
  (setq shell-file-name "/bin/zsh")
  (setq auto-save-default nil)
  (setq-default tab-width 2)
  (setq tab-stop-list 1)
  (setq-default indent-tabs-mode t)
  (setq-default tab-width 2))
(configure-emacs-globals)

;; use path from shell
(defun setup-path ()
 	(install 'exec-path-from-shell)
	(exec-path-from-shell-initialize))
(setup-path)

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

(defun configure-git ()
  (install 'magit))
(configure-git)

(defun configure-utils ()
  (install 'which-key)
  (which-key-mode))
(configure-utils)

;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)

(defun configure-lsp ()
  (install 'lsp-mode)
  (require 'lsp-mode)

  ;; TODO: figure out how to get this to work??
	(setq lsp-keymap-prefix "C-.")

	;; company (auto completion)N
	(install 'company)
	(add-hook 'after-init-hook 'global-company-mode)
	
	;; which-key
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)

	;; golang
	(install 'go-mode)
  (require 'go-mode)
	(defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

  ;; Start LSP Mode and YASnippet mode
  (add-hook 'go-mode-hook #'lsp-deferred))
(configure-lsp)

;; custom functions
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))
		
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 '(exec-path-from-shell which-key evil tree-sitter-langs tree-sitter dracula-theme magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
