(defun sqlfmt-format-buffer ()
  "Format the entire buffer using sqlfmt."
  (interactive)
  (save-excursion
    (shell-command-on-region (point-min) (point-max) "sqlfmt -l 100 - 2>/dev/null" t t)))
