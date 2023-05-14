;; (setq org-directory "~/org-mode/") ;; Set in main doom config.el
(setq org-default-notes-file "~/org-mode/notes.org")
(setq diary-file "~/org-mode/org-diary") ;; Diary file location
(setq org-agenda-files '("~/org-mode/tasks-todo.org"))
(setq +org-capture-journal-file "~/org-mode/capture/journal.org")
(setq +org-capture-notes-file "~/org-mode/capture/notes.org")
(setq +org-capture-todo-file "~/org-mode/capture/todo.org")
(setq +org-capture-projects-file "~/org-mode/capture/projects.org")

(map! :map org-mode-map :nv "j" #'evil-next-visual-line)
(map! :map org-mode-map :nv "k" #'evil-previous-visual-line)

(setq org-superstar-headline-bullets-list '(8859 8855 8857 10047))
(setq org-superstar-item-bullet-alist '((42 . 8226) (43 . 8226) (45 . 9702)))

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

(setq org-hide-emphasis-markers t) ;; Hide markup things like / / around italics and * * around bold
