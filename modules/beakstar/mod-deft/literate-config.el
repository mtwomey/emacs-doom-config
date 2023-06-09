(after! deft
  (set-evil-initial-state! 'deft-mode 'emacs)
  (setq deft-directory "~/org-mode")
  (setq deft-recursive t)
  (setq deft-extensions '("txt" "org"))
  (setq deft-use-filename-as-title t)
  (setq deft-current-sort-method 'title)

  (map! :map deft-mode-map

        :desc "next line"
        :e "C-j" 'next-line

        :desc "previous line"
        :e "C-k" 'previous-line

        :desc "scroll-page-down"
        :e "C-d" 'evil-scroll-page-down

        :desc "scroll-page-up"
        :e "C-u" 'evil-scroll-page-up

        :desc "leader-key"
        :e "C-SPC" #'doom/leader

        :desc "deft-filter-clear"
        :e "C-<backspace>" #'deft-filter-clear

        :desc "kill-this-buffer"
        :e "C-q" #'kill-this-buffer

        :desc "kill deft"
        :e "<escape>" #'(lambda () (interactive) (kill-buffer (current-buffer))))


  (setq deft-auto-save-interval 0))
