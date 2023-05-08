;; Random things to do on startup

;; Start up my TODO view
(after! beakstar-bright-theme
  (set-frame-position (make-frame '((width . 170)
                                    (height . 47)))
                      2438
                      -217)
  (bookmark-load bookmark-default-file)
  (bookmark-jump "TODOs")
  (other-frame 1))
