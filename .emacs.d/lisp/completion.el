;; -*- lexical-binding: t -*-

(require 'ido)

;; This makes the mini buffer that shows at the bottom
;; of emacs for commands and such, show completions
;; vertically
(require 'ido)
(ido-mode t)
(fido-vertical-mode t)

;; This makes the completions that you get in the mini buffer
;; work how everyone who isn't a power user would expect them to work
(setq completion-styles '(emacs22 substring))
(defun my-icomplete-styles () (setq-local completion-styles '(substring)))
(add-hook 'icomplete-minibuffer-setup-hook 'my-icomplete-styles)

