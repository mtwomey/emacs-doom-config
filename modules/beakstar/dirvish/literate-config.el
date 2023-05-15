(setq dirvish-attributes '(all-the-icons subtree-state file-size))
(setq dired-listing-switches "--all --time-style=locale --group-directories-first --human-readable --no-group -g")

;; Show all files except . and ..
(setq dired-omit-files "\\`[.]?#\\|\\`[.][.]?\\'")

;; Permissions problems when trying to use the mac trash based delete
(setq delete-by-moving-to-trash nil)

;; Required
(dirvish-override-dired-mode)

(setq dirvish-quick-access-entries '(("h" "~/" "Home")
                                     ("g" "~/Git_Repos" "Git Repos")
                                     ("d" "~/.config/doom" "Doom")
                                     ("t" "/tmp" "tmp")))

(defun kill-dirvish ()
  (interactive)
  (progn
    (dirvish-quit)
    (+dired/quit-all)))

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
      :nvi "<escape>" #'kill-dirvish)
