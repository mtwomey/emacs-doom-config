;; (setq dirvish-attributes '(all-the-icons subtree-state file-size))

(after!
  dirvish
  (setq dirvish-attributes '(vscode-icon subtree-state file-size))
  (setq dirvish-vscode-icon-size 24) ;; Make the icons a little smaller
  (setq dired-listing-switches "--all --time-style=locale --group-directories-first --human-readable --no-group -g"))

;; Permissions problems when trying to use the mac trash based delete
(setq delete-by-moving-to-trash nil)

;; Enable emerge mode (the "grouping" functionality)
(add-hook 'dirvish-setup-hook #'dirvish-emerge-mode)

;; Required
(dirvish-override-dired-mode)

;; Show all files except . and ..
(add-hook-run-once 'dirvish-setup-hook
                   (lambda ()
                     (setq dired-omit-files "\\`[.]?#\\|\\`[.][.]?\\'")
                     (revert-buffer)))

(after! dirvish
  (pdf-tools-install))

(setq dirvish-quick-access-entries '(("h" "~/" "Home")
                                     ("g" "~/Git_Repos" "Git Repos")
                                     ("d" "~/.config/doom" "Doom")
                                     ("t" "/tmp" "tmp")
                                     ("b" "/Volumes/OMV_Documents/Documents/Boardgames" "Boardgames")
                                     ("v" "/Volumes")
                                     ("o" "~/org-mode")))

(setq dirvish-emerge-groups '(
  ("Directories" (predicate . directories))
  ("Recent files" (predicate . recent-files-2h))
  ("Documents" (extensions "pdf" "tex" "bib" "epub" "txt" "afpub"))
  ("Video" (extensions "mp4" "mkv" "webm"))
  ("Pictures" (extensions "jpg" "png" "svg" "gif"))
  ("Audio" (extensions "mp3" "flac" "wav" "ape" "aac"))
  ("Archives" (extensions "gz" "rar" "zip" "tar" "7z"))))

(defun kill-dirvish ()
  (interactive)
  (progn
    (dirvish-quit)
    (+dired/quit-all)))

(defun delete-dirvish-cache-directory ()
   "Delete the dirvish cache directory."
   (interactive)
   (if (file-directory-p dirvish-cache-dir)
     (progn (delete-directory dirvish-cache-dir t)
            (message "Deleted dirvish cache directory: %s" dirvish-cache-dir))
     (message "Dirvish cache directory not found: %s" dirvish-cache-dir)))

(advice-add #'dired-find-file
            :around
            (lambda (f &rest r)
                    (let ((is-file (not (file-directory-p
                                          (dired-get-file-for-visit)))))
                         (apply f r)
                         (when is-file (+dired/quit-all)))))

(map! :desc "Open dirvish"
      :leader "." #'dirvish)

(map! :map dirvish-mode-map
      :desc "Perform fd search"
      :nvi "/" #'dirvish-fd
      :desc "Live narrowing"
      :nvi "n" #'dirvish-narrow
      :desc "Sort current buffer"
      :nvi "s" #'dirvish-quicksort
      :desc "Get file information"
      :nvi "i" #'dirvish-file-info-menu
      :desc "dired find file"
      :nvi "C-l" #'dired-find-file
      :desc "dired find file"
      :nvi "l" #'dired-find-file
      :desc "dired up directory"
      :nvi "C-h" #'dired-up-directory
      :desc "dired up directory"
      :nvi "h" #'dired-up-directory
      :desc "Dirvish previous group"
      :nvi "C-k" #'dirvish-emerge-previous-group
      :desc "dired previous line"
      :nvi "k" #'dired-previous-line
      :desc "Dirvish next group"
      :nvi "C-j" #'dirvish-emerge-next-group
      :desc "dired next line"
      :nvi "j" #'dired-next-line
      :desc "Dirvish Dispatch"
      :nvi "?" #'dirvish-dispatch
      :nvi "g" #'revert-buffer
      :desc "Quick Access"
      :nvi "a" #'dirvish-quick-access
      :desc "Kill Dirvish"
      :nvi "q" #'kill-dirvish
      :desc "Kill Dirvish"
      :nvi "<escape>" #'kill-dirvish
      :desc "Dirvish Toggle emerge Group"
      :nvi "<tab>" (general-key "C-I"))

;; (general-auto-unbind-keys)

;; (general-define-key :keymaps 'dirvish-mode-map :states '(normal visual insert) "<tab>" (general-key "C-I"))
