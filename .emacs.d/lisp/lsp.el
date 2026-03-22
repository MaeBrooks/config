;; -*- lexical-binding: t -*-

;; Tell emacs to avoid displaying 'inlay hints'
;;   Inlay hints turn stuff like this:
;;     let foo = 3;
;;   Into this:
;;     let foo :int = 3
(setq eglot-ignored-server-capabilities '(:inlayHintProvider))
