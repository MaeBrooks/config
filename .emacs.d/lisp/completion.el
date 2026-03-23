;; -*- lexical-binding: t -*-

;; This makes the menu buffer that shows at the bottom
;; of emacs for commands and such, show completions
;; vertically
(require 'ido)
(ido-mode t)
(fido-vertical-mode t)
