(setq dirvish-attributes '(all-the-icons subtree-state file-size))
(setq dired-listing-switches "--all --time-style=locale --group-directories-first --human-readable --no-group -g")

;; Show all files except . and ..
(setq dired-omit-files "\\`[.]?#\\|\\`[.][.]?\\'")

;; Permissions problems when trying to use the mac trash based delete
(setq delete-by-moving-to-trash nil)

;; Enable emerge mode (the "grouping" functionality)
(add-hook 'dirvish-setup-hook #'dirvish-emerge-mode)

;; Required
(dirvish-override-dired-mode)

(setq dirvish-quick-access-entries '(("h" "~/" "Home")
                                     ("g" "~/Git_Repos" "Git Repos")
                                     ("d" "~/.config/doom" "Doom")
                                     ("t" "/tmp" "tmp")
                                     ("b" "/Volumes/OMV_Documents/Documents/Boardgames")))

(setq dirvish-emerge-groups '(("Recent files" (predicate . recent-files-2h))
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

;; (file-directory-p file) is it a directory

;; (advice-add #'dired-find-file :after
;;             (lambda (&rest r)
;;               ;; (message "I am here")
;;               (when (not (file-directory-p (dired-file-name-at-point)))
;;                   (kill-dirvish))
;;               ;; (message (dired-file-name-at-point))
;;               ;; (message r)
;;               ;; (kill-dirvish)
;;               ))

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
      :desc "dired previous line"
      :nvi "C-k" #'dired-previous-line
      :desc "dired previous line"
      :nvi "k" #'dired-previous-line
      :desc "dired next line"
      :nvi "C-j" #'dired-next-line
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
