(defun this-directory ()
  (file-name-directory (or load-file-name buffer-file-name)))

(defmacro with-current-directory (directory &rest body)
  "Execute body setting the default directory and load-path."
  `(let ((load-path (cons ,directory load-path))
         (default-directory ,directory))
     ,@body))
