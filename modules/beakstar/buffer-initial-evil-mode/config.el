(defcustom set-evil-mode-by-buffer-name-alist
  '()
  "List of buffer names, evil modes, and times. When you switch
to a buffer matching the name,the specified evil mode will be
entered after TIME (in milliseconds).

Add to this list like:

(push '(\"*Org Note*\" \"insert\" 50) set-evil-mode-by-buffer-name-alist)"
  :type '(alist :value-type (group string integer)))

(push '("*Org Note*" "insert" 50) set-evil-mode-by-buffer-name-alist)

(defun set-evil-mode-by-buffer-name ()
  (let ((buffer-name-evil-init-modes set-evil-mode-by-buffer-name-alist)
        (top-buffer-name (buffer-name (car (buffer-list)))))
    (cl-loop for (key value time) in buffer-name-evil-init-modes collect
             (if (string= key top-buffer-name)
                 (pcase value
                   ("insert"
                    (run-at-time (concat (number-to-string time) " millisec")
                                 nil
                                 (lambda ()
                                   (call-interactively 'evil-insert)))))))))

(add-hook 'buffer-list-update-hook 'set-evil-mode-by-buffer-name)
