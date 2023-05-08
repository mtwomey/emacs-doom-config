;; Make it so when I switch to the repl it always going into insert mode at the end
;; This is because I hate that it puts the cursor on the errors if there are any and
;; I have to hit a bunch of keys to get back to the regular mode
;; Also map some keys
(after! python
  (map! :map inferior-python-mode-map
        :desc "previous command"
        :i "<up>"#'comint-previous-input :desc "previous command"
        :i "C-k"#'comint-previous-input :desc "next command"
        :i "<down>"#'comint-next-input :desc "next command"
        :i "C-j"#'comint-next-input)
  (add-hook 'inferior-python-mode-hook
            '(lambda ()
               (add-hook 'buffer-list-update-hook
                         '(lambda ()
                            (with-current-buffer (get-buffer (car (buffer-list)))
                              (if (string= major-mode "inferior-python-mode")
                                  (progn
                                    (evil-insert-state)
                                    (goto-char (point-max)))))))))
  (add-hook 'python-mode-hook
            '(lambda ()
               (f-traverse-upwards (lambda (path)
                                     (let ((venv-path (f-expand "venv" path)))
                                       (when (f-exists? venv-path)
                                         (pyvenv-activate venv-path))))))))
