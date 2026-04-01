;; -*- lexical-binding: t -*-

;; Set to 't' if you dont want the startup screen
(setq inhibit-startup-screen nil)

(add-hook 'after-init-hook
  (lambda () (setq default-directory "~")))

