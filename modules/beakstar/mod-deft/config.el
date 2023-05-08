(defconst this-directory (file-name-directory (or load-file-name buffer-file-name)))

(org-babel-load-file (concat this-directory "literate-config.org"))
