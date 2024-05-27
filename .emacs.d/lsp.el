(defun format-buffer ()
  (unless (not 'eglot-format-buffer)
    (funcall 'eglot-format-buffer)))

(add-hook 'after-save-hook 'format-buffer)
