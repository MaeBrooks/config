; Remove Noisy UI Element
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq create-lockfiles nil)
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq inhibit-startup-message t)
(show-paren-mode t)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 2 120 2))
(add-to-list 'exec-path "/home/zoft/.nodenv/shims/")

(add-hook 'dired-mode-hook 'auto-revert-mode)
(global-display-line-numbers-mode t)
(setq whitespace-style '(face tabs tab-mark))
(global-whitespace-mode 1)

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (show-paren-mode)
             (setq autopair-handle-action-fns
                   (list 'autopair-default-handle-action
                         '(lambda (action pair pos-before)
                            (hl-paren-color-update))))))

(set-frame-font "JetBrains Mono-14" nil t)

