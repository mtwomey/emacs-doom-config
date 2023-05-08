(setq dirvish-attributes '(all-the-icons subtree-state file-size))

(map! :desc "Open dirvish" :leader "." #'dirvish)

(setq dirvish-quick-access-entries '(("h" "~/" "Home")
                                     ("g" "~/Git_Repos" "Git Repos")
                                     ("d" "~/.config/doom" "Doom")))

(after! dirvish
  (dirvish-override-dired-mode)
  (map! :map dirvish-mode-map
      :desc "fuzzy search"
      :nvi "s" #'dirvish-narrow
      :desc "fuzzy search"
      :nvi "/" #'dirvish-narrow

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

      :nvi "q" #'(lambda ()
                 (interactive)
                 (progn
                   (dirvish-quit)
                   (+dired/quit-all)))))

;; Permissions problems when trying to use the mac trash based delete
(setq delete-by-moving-to-trash nil)
