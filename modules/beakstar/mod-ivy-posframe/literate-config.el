(after! ivy-posframe
  (set-face-attribute 'ivy-posframe nil :foreground "white" :background "#181818")
  (set-face-attribute 'ivy-posframe-border nil :background "#046307")
  (setq ivy-posframe-border-width 3
        ivy-posframe-parameters '((left-fringe . 4) (right-fringe . 4))
        ivy-posframe-min-width 160)

  (ivy-posframe-mode 1))

(map! :map ivy-posframe-mode-map
      :desc "ivy-immediate-done"
      "C-<return>" #'ivy-immediate-done)

(advice-add 'ivy-posframe--display :before #'(lambda (&rest _)
                                               (let* ((parent-window (selected-window))
                                                      (parent-frame (window-frame parent-window))
                                                      (parent-frame-width (frame-pixel-width parent-frame))
                                                      (parent-frame-height (frame-pixel-height parent-frame))
                                                      (posframe (window-frame (ivy-posframe--window)))
                                                      (posframe-width (frame-pixel-width posframe))
                                                      (posframe-height (frame-pixel-height posframe))
                                                      (info (list :parent-frame-width parent-frame-width
                                                                  :parent-frame-height parent-frame-height
                                                                  :posframe-width posframe-width
                                                                  :posframe-height posframe-height))
                                                      (position (posframe-poshandler-frame-center info))
                                                      (position (cons (car position) (truncate (* (cdr position) 1.5)))))

                                                 ;; (message "%s" (prin1-to-string parent-window))
                                                 ;; (message "%s" (prin1-to-string parent-frame))
                                                 ;; (message "%s" (prin1-to-string parent-frame-width))
                                                 ;; (message "%s" (prin1-to-string parent-frame-height))
                                                 ;; (message "%s" (prin1-to-string posframe))
                                                 ;; (message "%s" (prin1-to-string posframe-width))
                                                 ;; (message "%s" (prin1-to-string posframe-height))
                                                 ;; (message "%s" (prin1-to-string (plist-get info :parent-frame-width)))
                                                 ;; (message "%s" (prin1-to-string position))

                                                 (posframe--set-frame-position posframe position parent-frame-width parent-frame-height)
                                                 ;; (posframe-refresh ivy-posframe-buffer)
                                                 )))
