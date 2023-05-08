(after! treemacs
  (setq treemacs-position 'right)
  (map! :map treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;; treemacs automatically adds itself to be ignored by ace-window. I want ace-window to give me a number for itself.
 (advice-add #'ace-window :before #'(lambda (&rest r) (setq aw-ignored-buffers (delete 'treemacs-mode aw-ignored-buffers))))
