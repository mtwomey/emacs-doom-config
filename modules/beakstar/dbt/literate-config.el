(defun sqlfmt-format-buffer ()
  "Format the entire buffer using sqlfmt."
  (interactive)
  (save-excursion
    (shell-command-on-region (point-min) (point-max) "sqlfmt - 2>/dev/null" t t)))
