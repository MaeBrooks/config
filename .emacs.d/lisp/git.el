;; -*- lexical-binding: t -*-

;; (require 'transient)
;; VC-dir does not support rebasing
;; It also doesnt seem to support signing commits with gpg / pinentry
;; TODO Create a simple magit out of 'transient'

;; TODO look at our normal config and steal some of the magit stuff there
;; WE need to be able to use pinentry! But it doesnt seem to work!

(require 'epg)
;; This should work? but doesnt?
(setq epg-pinentry-mode 'loopback)
