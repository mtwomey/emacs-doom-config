(let ((filename (expand-file-name "dired+.el"
                                  (file-name-directory load-file-name))))
  (load filename))

;; Stop opening separate buffers for _everything_...
(diredp-toggle-find-file-reuse-dir 1)

;; Also need to do this for mouse-clicks separately for some stupid reason
;; There is some weirdness with mouse-1 mapping to mouse-2 for some UI reasons (so that's why we're mapping mouse-2 here)
(map! :map dired-mode-map :n [mouse-2] 'diredp-mouse-find-file-reuse-dir-buffer)
;; FYI another method to do this
;;(substitute-key-definition 'dired-mouse-find-file-other-window 'diredp-mouse-find-file-reuse-dir-buffer dired-mode-map)

;; Show details by default
(setq diredp-hide-details-initially-flag nil)
(setq diredp-hide-details-propagate-flag nil)

;; Show all files
(setq dired-omit-files nil)
(setq dired-omit-extensions nil)

;; This approach doesn't work to disable omit mode
;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             (let ((current-prefix-arg 0))
;;               (dired-omit-mode 0)
;;               (message "I'm here" nil))))
