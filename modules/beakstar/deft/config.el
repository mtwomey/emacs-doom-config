(after! deft
  (setq deft-directory "~/org-mode")

  (add-hook 'deft-mode-hook
            (lambda ()
              (add-to-list 'evil-emacs-state-modes 'deft-mode)))

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
        :e "C-<backspace>" #'deft-filter-clear)

  (setq deft-auto-save-interval 0))
