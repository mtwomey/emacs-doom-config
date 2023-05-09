;; Patch to fix "Error in post-command-hook (ivy--queue-exhibit)..."
;; From: https://github.com/Yevgnen/ivy-rich/issues/115
;; This is an issue in ivy-rich, doom hasn't updated yet
(after! ivy
  (defun ivy-rich--switch-buffer-directory! (orig-fun &rest args)
    (cl-letf (((symbol-function 'directory-file-name) #'file-name-directory))
      (apply orig-fun args)))
  (advice-add 'ivy-rich--switch-buffer-directory :around #'ivy-rich--switch-buffer-directory!))
