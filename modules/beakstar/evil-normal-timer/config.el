(defun evil-normalize-all-buffers ()
  "Force a drop to normal state."
  (dolist (buffer (buffer-list))
    (set-buffer buffer)
    (unless (or (minibufferp)
                (eq evil-state 'emacs))
      (evil-force-normal-state)))
  (message "Dropped back to normal state in all buffers"))

(defvar evil-normal-timer
  (run-with-idle-timer 5 t #'evil-normalize-all-buffers)
  "Drop back to normal state after idle for 30 seconds.")
