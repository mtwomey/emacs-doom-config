(after! doom-modeline
  (setq doom-modeline-major-mode-icon t)
  (doom-modeline-def-modeline 'main
    '(bar matches buffer-info remote-host buffer-position
          parrot selection-info)
    '(misc-info minor-modes checker input-method
                buffer-encoding major-mode process vcs "  ")))
