(defun brew-ls-formula ()
  "Run 'brew ls --formula' and return the output as a string."
  (interactive)
  (shell-command-to-string "brew ls --formula"))

(defun brew-ls-cask ()
  "Run 'brew ls --cask' and return the output as a string."
  (interactive)
  (shell-command-to-string "brew ls --cask"))

(defun brew-ls-formula-and-cask ()
  "Run 'brew ls --formula' and 'brew ls --cask', and combine the output in a new buffer with headers."
  (interactive)
  (let ((output-buffer (generate-new-buffer "*brew-ls-formula-and-cask*")))
    (with-current-buffer output-buffer
      (insert "Formulas:\n\n")
      (insert (brew-ls-formula))
      (insert "\nCasks:\n\n")
      (insert (brew-ls-cask))
    (switch-to-buffer output-buffer))))

(defun brew-test1 ()
  "Run 'brew ls --formula' and 'brew ls --cask', and display the output as a selectable list."
  (interactive)
  (let ((formula-output (shell-command-to-string "brew ls --formula"))
        (cask-output (shell-command-to-string "brew ls --cask")))
    (ivy-read "Select a package: "
              (split-string (concat formula-output "\n" cask-output) "\n")
              :action #'message)))
