(flycheck-define-error-level
  'lsp-flycheck-info-unnecessary
  :severity -10
  :compilation-level 0
  :overlay-category 'flycheck-info-overlay
  :margin-spec (flycheck-make-margin-spec flycheck-default-margin-str
                                          'flycheck-fringe-info)
  :fringe-bitmap (cons 'flycheck-fringe-bitmap-double-arrow
                       'flycheck-fringe-bitmap-double-arrow-hi-res)
  :fringe-face 'flycheck-fringe-info
  :error-list-face 'flycheck-error-list-info)
