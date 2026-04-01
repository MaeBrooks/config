;; -*- lexical-binding: t -*-

;; Macos configurations

(when (memq window-system '(mac ns))
  ;; Set the opacity of emacs
  ;; (let ((alpha 100)) (set-frame-parameter nil 'alpha (list alpha alpha)))

  ;; Set the 'theme' for the emacs application window itself to be dark
  ;; This does not set emacs to be dark, but rather the title bar and border
  ;;   (if you have those enabled)
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  ;; Removes the title bar! - No more green, yellow, red buttons taking up
  ;; horizontal space at the top!
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
