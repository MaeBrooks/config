;;; -*- lexical-binding: t -*-
(defun sort-lines-by-length (reverse beg end)
  "Sort lines by length."
  (interactive "P\nr")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
        ((inhibit-field-text-motion t))
        (sort-subr reverse 'forward-line 'end-of-line nil nil
          (lambda (l1 l2)
            (apply #'< (mapcar (lambda (range) (- (cdr range) (car range)))
                         (list l1 l2)))))))))
