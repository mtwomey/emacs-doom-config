;; Transient is used by magit and manages saved default value for things
;; This makes sure those settings are saved to .doom.d rather than .emacs.d/.local/.etc/.transient

(after! magit
  (setq transient-values-file "~/.config/doom/transient/values.el"
        transient-history-file "~/.config/doom/transient/history.el"
        transient-levels-file "~/.config/doom/transient/levels.el")
  (message "transient mod4")
  (message transient-values-file))


(after! transient
  (setq transient-values-file "~/.config/doom/transient/values.el"
        transient-history-file "~/.config/doom/transient/history.el"
        transient-levels-file "~/.config/doom/transient/levels.el")
  (message "transient mod5")
  (message transient-values-file))
