
;; Replace "sbcl" with the path to your implementation
(defun use-common-lisp ()
  (interactive)
  (load (expand-file-name "~/.quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl")
  (require 'slime)
  (slime-setup '(slime-fancy slime-quicklisp slime-asdf slime-mrepl))
  (slime-mode)
  (common-lisp-mode)
  (slime))
