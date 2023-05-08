(map! :map ivy-posframe-mode-map
      :desc "ivy-immediate-done"
      "C-<return>" #'ivy-immediate-done)

(after! ivy-posframe
  (set-face-attribute 'ivy-posframe nil :foreground "white"
                      :background "#181818")
  (set-face-attribute 'ivy-posframe-border nil
                      :background "#046307")

  (setq ivy-posframe-border-width 3
        ivy-posframe-parameters
        '((left-fringe . 4)
          (right-fringe . 4))
        ivy-posframe-min-width
        160)

  (ivy-posframe-mode 1)

  ;; Hack to workaround how the posframe doesn't show up in the right place after moving the frame with the mouse
  (advice-add 'ivy-posframe-cleanup :after #'(lambda (&rest _)
    (posframe-delete ivy-posframe-buffer))))
