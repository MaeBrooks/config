(defun not-nil (value) (not (eq value nil)))
(defun list-filter (callback list) (seq-filter callback list))
(defun list-filter-not (callback list) (seq-remove callback list))
(defun list-map (callback list) (seq-map callback list))
