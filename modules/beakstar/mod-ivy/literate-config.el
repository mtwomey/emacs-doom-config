(setq beakstar-ivy-switch-buffers-ignore-regexes
      less-important-buffer-names)

(defun beakstar-ivy-switch-buffer ()
  "Calls ivy-switch-buffer ignoring any buffers in beakstar-ivy-switch-buffers-ignore-names
or that match a regex in beakstar-ivy-switch-buffers-ignore-regexes.
Calling it with the universal argument will show all buffers."
  (interactive)
  (if current-prefix-arg
      (ivy-switch-buffer)
    (let ((ivy-ignore-buffers (append
                               beakstar-ivy-switch-buffers-ignore-regexes)))
      (ivy-switch-buffer))))

(map! :desc "Switch to buffer" :leader "," #'beakstar-ivy-switch-buffer)

(after! ivy (defun ivy-rich--switch-buffer-directory! (orig-fun &rest args)
              (cl-letf (((symbol-function 'directory-file-name) #'file-name-directory))
                (apply orig-fun args)))
  (advice-add 'ivy-rich--switch-buffer-directory :around #'ivy-rich--switch-buffer-directory!))
