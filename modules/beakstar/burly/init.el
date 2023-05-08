;; https://github.com/Fuco1/eshell-bookmark
(defun eshell-bookmark--make-record ()
  "Create a eshell bookmark.
The bookmark will try to open an eshell session with the pwd set
to the location when the bookmark was created."
  (let ((bookmark `((handler . eshell-bookmark--restore)
                    (filename . ,default-directory))))
    bookmark))

(defun eshell-bookmark--restore (bookmark)
  "Restore eshell buffer according to BOOKMARK."
  (let ((eshell-buffer-name
         (or (bound-and-true-p shell-pop-last-shell-buffer-name)
             eshell-buffer-name)))
    (eshell)
    (setq default-directory (cdr (assq 'filename bookmark)))
    (eshell-reset)))

(defun eshell-bookmark-setup ()
  "Setup eshell-bookmark."
  (setq-local bookmark-make-record-function 'eshell-bookmark--make-record))

(setq eshell-buffer-name "*eshell*")
(add-hook! 'eshell-mode-hook #'eshell-bookmark-setup)


;; Sort of a "fake" bookmark for org-agenda. Really just opens agenda, but this means I can bookmark the window layout with burly
(defun org-agenda-bookmark--make-record ()
  "Create an agenda bookmark."
  `((handler . org-agenda-bookmark--restore)))

(defun org-agenda-bookmark--restore (&rest r)
  "Restore agenda buffer."
  (org-agenda-list))

(defun org-agenda-bookmark-setup ()
  "Setup org-agenda-bookmark."
  (setq-local bookmark-make-record-function 'org-agenda-bookmark--make-record))

(add-hook! 'org-agenda-mode-hook #'org-agenda-bookmark-setup)

;; Another "fake" bookmark for calendar-mode
(defun org-calendar-bookmark--make-record ()
  "Create a calendar bookmark."
  `((handler . org-calendar-bookmark--restore) (POS . 2)))

(defun org-calendar-bookmark--restore (&rest r)
  "Restore calendar buffer."
  (calendar))

(defun org-calendar-bookmark-setup ()
  "Setup org-calendar-bookmark."
  (setq-local bookmark-make-record-function 'org-calendar-bookmark--make-record))

(add-hook! 'calendar-mode-hook #'org-calendar-bookmark-setup)

;; After jumping to a calendar, reset it so the cursor is repositioned to the current date instead of the saved bookmark position
;; (add-hook 'bookmark-after-jump-hook
;;           (lambda ()
;;             (if (string= "calendar-mode" (symbol-name major-mode))
;;                  (calendar))))
