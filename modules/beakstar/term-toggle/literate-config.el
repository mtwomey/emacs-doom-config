(let ((current-directory (file-name-directory (or load-file-name buffer-file-name))))
  (load (concat current-directory "term-toggle.el")))
