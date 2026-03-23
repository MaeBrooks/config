;; -*- lexical-binding: t -*-

(require 'epa-file)
(epa-file-enable)

;; (require 'pinentry)
;; (pinentry-start)

;; TODO: Can we hook on to vc's commit mode
;; And have us enter the code before saving?
;; - Look at vc code for when vc-next-action thingy causes summary message
;; - Look at what is called for C-c C-c
;; - Create a hook that is called right then / override the function here
;;   So that we can call out to whatever is used for gpg-encrypt-region / gpg-descrypt-region

