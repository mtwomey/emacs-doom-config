(defun find-file-target-window (target-window)
  "Visits a file using the target window. Target window is a number, starting with 0."

  (interactive) ;; setting keys expects interactive functions
  (let ((filename (dired-get-file-for-visit)))
    (select-window target-window)
    (find-file filename)))

(define-minor-mode nailed-dired
  "Tweaks dired directory listings so that opening a file, always opens
it in specific window

This line here:

(select-window (nth 0 (window-list nil nil (frame-first-window))))

This is how we get the \"nth\" window in a repeatable way. When you do (window-list)
in a window, it returns a list of windows based on the \"cylical ordring of windows\",
starting with the window you are in - read up on this. So this is basically saying:
Start with the top-left-most-window and use that as the starting point in the
cyclical order (which makes it return the list in the same order, no matter where
you call it from)."

  :keymap (let ((map (make-sparse-keymap))
                (f (lambda ()
                     (interactive)
                     (mouse-set-point last-input-event)
                     (redisplay t)
                     (if (file-directory-p (dired-get-file-for-visit))
                         (let ((starting-buffer (buffer-name)))
                           (find-file-target-window (get-buffer-window))
                           (kill-buffer starting-buffer))
                       (find-file-target-window (nth find-file-target-window (window-list nil nil (frame-first-window))))))))
            (map! :map map [return] f)
            (map! :map map :n [mouse-2] f) ;; This mouse binding is tricky has to have the mode
            map)
  (defvar-local find-file-target-window
    0
    "Target window "))

(add-hook 'dired-mode-hook 'nailed-dired)
