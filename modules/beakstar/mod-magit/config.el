(map! :map magit-mode-map
      :desc "magit log all"
      :leader "g l"#'magit-log-all)
(setq magit-repository-directories '(("/Users/mtwomey/Git_Repos" . 1)))

;; (after! magit
;;   (defun kill-magit-diff-buffer-in-current-repo (&rest _)
;;     "Delete the magit-diff buffer related to the current repo"
;;     (let ((magit-diff-buffer-in-current-repo (magit-mode-get-buffer 'magit-diff-mode)))
;;       (kill-buffer magit-diff-buffer-in-current-repo)))

;;   (add-hook 'git-commit-setup-hook
;;             #'(lambda ()
;;                 (add-hook 'with-editor-post-finish-hook #'kill-magit-diff-buffer-in-current-repo
;;                           nil t)
;;                 (add-hook 'with-editor-post-cancel-hook #'kill-magit-diff-buffer-in-current-repo
;;                           nil t)))
;;   ;; Some defaults
;;   (put 'magit-log-mode 'magit-log-default-arguments
;;      '("--graph" "-n256" "--decorate" "--color"))

;;   ;; Redefine this whole thing (taken from magit source) simply to add the default :value
;;   (transient-define-prefix magit-merge ()
;;     "Merge branches."
;;     :value '("--no-ff")
;;     :man-page "git-merge"
;;     :incompatible '(("--ff-only" "--no-ff"))
;;     ["Arguments"
;;      :if-not magit-merge-in-progress-p
;;      ("-f" "Fast-forward only" "--ff-only")
;;      ("-n" "No fast-forward"   "--no-ff")
;;      (magit-merge:--strategy)
;;      (5 magit-merge:--strategy-option)
;;      (5 "-b" "Ignore changes in amount of whitespace" "-Xignore-space-change")
;;      (5 "-w" "Ignore whitespace when comparing lines" "-Xignore-all-space")
;;      (5 magit-diff:--diff-algorithm :argument "-Xdiff-algorithm=")
;;      (5 magit:--gpg-sign)]
;;     ["Actions"
;;      :if-not magit-merge-in-progress-p
;;      [("m" "Merge"                  magit-merge-plain)
;;       ("e" "Merge and edit message" magit-merge-editmsg)
;;       ("n" "Merge but don't commit" magit-merge-nocommit)
;;       ("a" "Absorb"                 magit-merge-absorb)]
;;      [("p" "Preview merge"          magit-merge-preview)
;;       ""
;;       ("s" "Squash merge"           magit-merge-squash)
;;       ("i" "Dissolve"               magit-merge-into)]]
;;     ["Actions"
;;      :if magit-merge-in-progress-p
;;      ("m" "Commit merge" magit-commit-create)
;;      ("a" "Abort merge"  magit-merge-abort)]))
