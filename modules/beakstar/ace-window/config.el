(after! ace-window
  (setq aw-scope 'frame)
  (setq aw-ignore-current t)
  (add-to-list 'aw-ignored-buffers "*Calendar*"))
