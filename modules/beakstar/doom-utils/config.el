(defun remove-popup-rule! (predicate)
  "Remove a popup rule created by set-popup-rule! (undo what Doom might have done here...)"
  (setq +popup--display-buffer-alist (seq-filter (lambda (elt) (not (equal predicate (car elt)))) +popup--display-buffer-alist))
  (when (bound-and-true-p +popup-mode)
    (setq display-buffer-alist +popup--display-buffer-alist)))
