;; Slightly larger overall font
;; (setq doom-font (font-spec :family "Input Mono Narrow"
;; (setq doom-font (font-spec :family "MonoLisa"
;; (setq doom-font (font-spec :family "Dank Mono"
;; (setq doom-font (font-spec :family "Gintronic"
;; (setq doom-font (font-spec :family "Fira Code"
(setq doom-font (font-spec :family "Hack"
                           :size 14
                           :weight 'regular)
      doom-variable-pitch-font
      (font-spec :family "Input Sans") ; inherits `doom-font''s :size
      doom-unicode-font
      (font-spec :family "Input Mono Narrow"
                 :size 30)
      doom-big-font
      (font-spec :family "Fira Mono"
                 :size 19))

;; Initial frame size
(setq initial-frame-alist '((top . 0)
                            (left . 0)
                            (width . (text-pixels . 1420)) ;; I don't know why but it's adding 20 to this 1420, resulting in 1440 which is what I want..
                            (height . (text-pixels . 847))))

;; Set color theme
;; (defun color-theme-beakstar-dusk ()
;;   (interactive)
;;   (load-theme 'beakstar-dusk t))

;; (add-hook 'after-init-hook
;;          'color-theme-beakstar-dusk)


;; Set color theme
;; (require 'color-theme-sanityinc-tomorrow)
;; (defun color-theme-beakstar-bright ()
;;   (interactive)
;;   (load-theme 'beakstar-bright t))

;; (add-hook 'after-init-hook 'color-theme-beakstar-bright)

;; Allows cycling to new buffers that havn't been saved
;; Used to include new buffers in doom's real/unreal buffer concept
(defun new-buffer-p (buf)
  "Returns true if this buffer name starts with *new*"
  (string-prefix-p "*new*"
                   (buffer-name buf)))
(add-to-list 'doom-real-buffer-functions #'new-buffer-p)

;; (defun messages-buffer-p (buf)
;;   "Returns true if this buffer name starts with *new*"
;;   (string-prefix-p "*Messages*"
;;                    (buffer-name buf)))
;; (add-to-list 'doom-real-buffer-functions #'messages-buffer-p)

;; Additional buffers to consider "real" (so I can cycle / switch to them)
;; (defun beakstar-buffer-p (buf)
;;   "Returns true if buffer matches rules."
;;   (string-match-p "^*Messages*" (buffer-name buf)))

;; (add-to-list 'doom-real-buffer-functions #'beakstar-buffer-p)


;; Allow horizontal mouse scrolling
(setq mouse-wheel-flip-direction t
      mouse-wheel-tilt-scroll t)

;; Stop nagging me when I quit
(setq confirm-kill-emacs nil)

;; Disable global line highlight
;; (remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

;; Nice smooth scrolling in emacs 29
(pixel-scroll-precision-mode)
