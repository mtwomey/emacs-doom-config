(defun cycle-list-forward (l)
  "Cycles a list \"forward\" and returns a new list.
For example passing '(1 2 3) will return (2 3 1)."
  (append (cdr l) (cons (car l) ())))

(defun cycle-list-backward (l)
  "Cycles a list \"backward\" and returns a new list.
For example passing '(1 2 3) will return (3 1 2)."
  (reverse (cycle-list-forward (reverse l))))

(defcustom hydra-mode-cycle-modes '(org-mode text-mode web-mode emacs-lisp-mode)
  "Modes to cycle through with hydra-mode-cycle")

(defun hydra-mode-cycle-next-mode ()
  (interactive)
  (setq hydra-mode-cycle-modes (cycle-list-forward hydra-mode-cycle-modes))
  (funcall (car hydra-mode-cycle-modes)))

(defun hydra-mode-cycle-previous-mode ()
  (interactive)
  (setq hydra-mode-cycle-modes (cycle-list-backward hydra-mode-cycle-modes))
  (funcall (car hydra-mode-cycle-modes)))

(defhydra hydra-mode-cycle
  ()
  "Switch modes"
  ("l" hydra-mode-cycle-next-mode "Next mode")
  ("<right>" hydra-mode-cycle-next-mode "Next mode")
  ("h" hydra-mode-cycle-previous-mode "Previous mode")
  ("<left>" hydra-mode-cycle-previous-mode "Previous mode"))

(defhydra hydra-buffer-cycle ()
  "Switch buffers"
  ("l" next-buffer "Next buffer")
  ("<right>" next-buffer "Next buffer")
  ("h" previous-buffer "Previous buffer")
  ("<left>" previous-buffer "Previous buffer")
  ("x" hydra-mode-cycle/body "Cycle buffer mode" :exit t))

(defun delete-frame-without-prompt ()
  (interactive)
  (delete-frame))

(add-hook 'after-init-hook ;; Make sure these bindings go in after everything else has loaded
          (lambda ()
            (map! ;; Global maps
                  :desc "next buffer"
                  "C-x l" #'hydra-buffer-cycle/next-buffer

                  :desc "next buffer"
                  "C-x <right>" #'hydra-buffer-cycle/next-buffer

                  :desc "previous buffer"
                  "C-x h" #'hydra-buffer-cycle/previous-buffer

                  :desc "previous buffer"
                  "C-x <left>" #'hydra-buffer-cycle/previous-buffer

                  :desc "cycle modes"
                  "C-x x" #'hydra-mode-cycle/body

                  :desc "Org Insert Link"
                  "s-k" #'org-insert-link

                  :desc "Swiper" ;; Switch / to swiper in normal mode (from evil-ex-search-forward)                                                          ))))))
                  :nvm "/" #'swiper

                  ;; :desc "Console swiper"
                  ;; :nvm "/" #'swiper ;; Note these states (:nvm) this must go right before the string the rest can be in any order

                  ;; :desc "Consult Line"
                  ;; :nvm "/" #'consult-line

                  :desc "Kill buffer & window"
                  :leader "w k" #'kill-buffer-and-window ;; I can do all these bindings in bulk, but once I start with the ones that use :leader, I can't do "non-leader" ones anymore after that...

                  :desc "Ace window"
                  :leader "w w" #'ace-window

                  :desc "New file in new buffer"
                  :leader "b N" #'save-new-file

                  :desc "Delete frame (no prompt)"
                  :leader "q f" #'delete-frame-without-prompt

                  :desc "Open ansi terminal"
                  :leader "o s" #'term-toggle-ansi

                  )))
