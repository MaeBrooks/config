(defun use-typescript ()
  (interactive)
  (typescript-ts-mode t))

(defun use-cpp ()
  (interactive)
  (c++-mode)
  (c++-ts-mode)
  )

(defun utils/scroll-up ()
  (interactive)
  (funcall 'follow-scroll-up)
  (funcall 'recenter))

(defun utils/scroll-down ()
  (interactive)
  (funcall 'follow-scroll-down)
  (funcall 'recenter))
