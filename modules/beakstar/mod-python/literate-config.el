;; (after! python
;;         (map! :map
;;               inferior-python-mode-map
;;               :desc "previous command" :i "<up>" #'comint-previous-input
;;               :desc "previous command" :i "C-k" #'comint-previous-input
;;               :desc "next command" :i "<down>" #'comint-next-input
;;               :desc "next command" :i "C-j" #'comint-next-input)
;;         (add-hook
;;           'inferior-python-mode-hook
;;           '(lambda ()
;;                    (add-hook
;;                      'buffer-list-update-hook
;;                      '(lambda ()
;;                               (with-current-buffer
;;                                 (get-buffer (car (buffer-list)))
;;                                 (if (string= major-mode "inferior-python-mode")
;;                                   (progn (evil-insert-state)
;;                                          (goto-char (point-max)))))))))
;;         (add-hook 'python-mode-hook
;;                   '(lambda ()
;;                            (f-traverse-upwards
;;                              (lambda (path)
;;                                      (let ((venv-path (f-expand "venv" path)))
;;                                           (when (f-exists? venv-path)
;;                                             (pyvenv-activate venv-path))))))))

(after! dap-mode
        (dap-register-debug-template "Python :: Run file (buffer)"
                                     (list :type "python"
                                           :args ""
                                           :cwd nil
                                           :module nil
                                           :program nil
                                           :request "launch"
                                           :name "Python :: Run file (buffer)"
                                           :debugger "debugpy")))
