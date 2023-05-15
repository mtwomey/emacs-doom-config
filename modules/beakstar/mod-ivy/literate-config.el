(setq beakstar-ivy-switch-buffers-ignore-names
    '("*new*"
      "*scratch*"
      "*Async-native-compile-log*"
      "*Native-compile-Log*"
      "*lsp-log*"
      "*ts-ls*"
      "*ts-ls::stderr*"
      "*clojure-lsp*"
      "*clojure-lsp::stderr*"))


(setq beakstar-ivy-switch-buffers-ignore-regexes
        '("\\`*Dirvish-"))

(defun beakstar-ivy-switch-buffer ()
  "Calls ivy-switch-buffer ignoring any buffers in beakstar-ivy-switch-buffers-ignore-names
or that match a regex in beakstar-ivy-switch-buffers-ignore-regexes.
Calling it with the universal argument will show all buffers."
  (interactive)
  (if current-prefix-arg
      (ivy-switch-buffer)
    (let ((ivy-ignore-buffers (append
                               beakstar-ivy-switch-buffers-ignore-regexes
                               '((lambda (b)
                                   (if (member b beakstar-ivy-switch-buffers-ignore-names)
                                       0
                                     nil))))))
      (ivy-switch-buffer))))

(map! :desc "Switch to buffer" :leader "," #'beakstar-ivy-switch-buffer)

(after! ivy (defun ivy-rich--switch-buffer-directory! (orig-fun &rest args)
              (cl-letf (((symbol-function 'directory-file-name) #'file-name-directory))
                (apply orig-fun args))))
(after! ivy
  (advice-add 'ivy-rich--switch-buffer-directory :around #'ivy-rich--switch-buffer-directory!))
