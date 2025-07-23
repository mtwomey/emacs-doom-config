;; (setq org-directory "~/org-mode/") ;; Set in main doom config.el
(setq org-default-notes-file "~/org-mode/notes.org")
(setq diary-file "~/org-mode/org-diary") ;; Diary file location
(setq org-agenda-files '("~/org-mode/tasks-todo.org"))
(setq +org-capture-journal-file "~/org-mode/capture/journal.org")
(setq +org-capture-notes-file "~/org-mode/capture/notes.org")
(setq +org-capture-todo-file "~/org-mode/capture/todo.org")
(setq +org-capture-projects-file "~/org-mode/capture/projects.org")

(map! :map org-mode-map
      :nv "j" #'evil-next-visual-line
      :nv "k" #'evil-previous-visual-line)

;; (setq org-superstar-headline-bullets-list '(?⊛ ?⊗ ?⊙ ?✿))
;; (setq org-superstar-item-bullet-alist '((?* . ?•) (?+ . ?•) (?- . ?◦)))

(setq org-modern-list '((?* . "•") (?+ . "◦") (?- . "•"))
      org-modern-replace-stars "⊛⊗⊙✿"
      org-modern-star 'replace)

(advice-add #'org-superstar--prettify-main-hbullet :after
            (lambda (&rest r)
              (put-text-property (match-beginning 1) (match-end 1)
                                 'display '(raise 0.1))))

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

(setq org-hide-emphasis-markers t) ;; Hide markup things like / / around italics and * * around bold

(custom-set-faces '(org-block ((t (:extend t
                                   :background "#151515151515"
                                   :slant normal
                                   :weight regular
                                   :height 1.0
                                   :width semi-condensed
                                   :foundry "nil"
                                   :family "Hack")))))

(org-babel-do-load-languages
    org-babel-load-languages
    '((dot . t)))

(setq org-capture-templates '(("r" "Robert Half - Time Entry" entry (file+headline "~/org-mode/robert-half/time-tracking.org" "Just tasks to report later")
                               "* %?" :empty-lines-before 1 :empty-lines-after 1)))

(setq org-capture-templates '(("r" "Robert Half - Time Entry" entry (file+headline "~/org-mode/robert-half/time-tracking.org" "Test1")
                               "- %?" :empty-lines-before 1 :empty-lines-after 0)))
