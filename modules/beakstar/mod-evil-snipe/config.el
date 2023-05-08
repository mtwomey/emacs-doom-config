;; Disable evil-snipe in ceratin other modes
;; Change snipe score to whole buffer
(after! evil-snipe
  (add-to-list 'evil-snipe-disabled-modes 'docker-container-mode)
  (setq evil-snipe-scope 'whole-buffer)
  (setq evil-snipe-repeat-scope 'whole-buffer)
  (setq evil-snipe-repeat-reverse 'whole-buffer)
)
