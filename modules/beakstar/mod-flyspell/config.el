(setq ispell-personal-dictionary "~/.aspell.en.pws")
;; Mouse-3 is right click, which is what I want here
(eval-after-load "flyspell"
  '(progn
     (map! :map flyspell-mouse-map
           [down-mouse-3]
           #'flyspell-correct-word)
     (map! :map flyspell-mouse-map
           [mouse-3]
           #'undefined)
     (map! :map flyspell-mouse-map
           [down-mouse-2]
           nil)
     (map! :map flyspell-mouse-map
           [mouse-2]
           nil)))

;; This also works, but trying to do things the map! way

;; (eval-after-load "flyspell"
;;   '(progn
;;      (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
;;      (define-key flyspell-mouse-map [mouse-3] #'undefined)
;;      (define-key flyspell-mouse-map [down-mouse-2] nil)
;;      (define-key flyspell-mouse-map [mouse-2] nil)))
