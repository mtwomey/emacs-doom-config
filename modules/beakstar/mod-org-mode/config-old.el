(require 'org-mouse)

;; File and dir locations
;; (setq org-directory "~/org-mode/") ;; Set in main doom config.el
(setq org-default-notes-file "~/org-mode/notes.org")
(setq diary-file "~/.doom.d/diary") ;; Diary file location
(setq org-agenda-files '("~/org-mode/tasks-todo.org"))
(setq +org-capture-journal-file "~/org-mode/capture/journal.org")
(setq +org-capture-notes-file "~/org-mode/capture/notes.org")
(setq +org-capture-todo-file "~/org-mode/capture/todo.org")
(setq +org-capture-projects-file "~/org-mode/capture/projects.org")

(setq org-fontify-todo-headline t)
(setq org-startup-with-inline-images t)
(setq org-cycle-emulate-tab 'exc-hl-bol)

(setq org-todo-keyword-faces
   '(("⚑ WAIT" . +org-todo-onhold)))

;; Allow indenting of src blocks under headings
(setq org-src-preserve-indentation nil
      org-edit-src-content-indentation 0)

;; Settings about notes
(setq org-log-into-drawer t) ;; Take notes in a :LOGBOOK: drawer
(set-popup-rule! "^\\*Org Note*" :size 0.15 :select nil :ttl 0) ;; Make it popup at the bottom instead of in a window

;; Change the text heading for note
(setq org-log-note-headings '((done . "CLOSING NOTE %t")
 (state . "State %-12s from %-12S %t")
 (note . "%t")
 (reschedule . "Rescheduled from %S on %t")
 (delschedule . "Not scheduled, was %S on %t")
 (redeadline . "New deadline from %S on %t")
 (deldeadline . "Removed deadline, was %S on %t")
 (refile . "Refiled on %t")
 (clock-out . "")))

(map! :map org-mode-map :nv "j" #'evil-next-visual-line)
(map! :map org-mode-map :nv "k" #'evil-previous-visual-line)


(map! :map evil-org-agenda-mode-map :m "s" #'org-agenda-schedule) ;; This works, but some error about mapping "s c" too...

;; When you change TODO states in an org doc update agenda automagically
(add-hook 'org-after-todo-state-change-hook (lambda ()
  (org-agenda-buffer-reload)))

;; Also update agenda when a TODO is scheduled (doesn't appear to be a hook for this)
(advice-add #'org-schedule :after (lambda (&rest r)
  (org-agenda-buffer-reload)))

;; Archive all DONE tasks in the current file (there was a recommended way on the internet)
;; but it was a little fragile. Getting a list and then going through it in revere is better
(defun org-archive-done-tasks ()
  "Archive all tasks marked DONE in the file."
  (interactive)
  (mapc (lambda(entry)
          (goto-char entry)
          (org-archive-subtree))
        (reverse (org-map-entries (lambda () (point)) "TODO=\"★ DONE\"" 'file))))

(setq org-superstar-special-todo-items 'hide)
(setq org-superstar-headline-bullets-list '(8859 8855 8857 10047))
(setq org-superstar-item-bullet-alist '((42 . 8226) (43 . 8226) (45 . 9702)))

;; Stuff to do upon entering org-mode
(add-hook 'org-mode-hook (lambda ()
                           (org-superstar-mode 1) ;; Enable fancy buttets
                           (setq org-hide-emphasis-markers t) ;; Hide the work markup tags
                           (buffer-face-mode) ;; Allow a default face (org-default) for org-mode specifically
                           (flycheck-mode 0) ;; Disable flycheck
                           (flyspell-mode t) ;; Enable flyspell
                           (setq org-time-stamp-custom-formats '("<%A %b %-e>" . "<%A %b %-e %-l:%M %p>")) ;; Format for timestamp overlay
                           (setq org-display-custom-times t) ;; Use timestamp overlays
                           (add-hook 'after-change-functions 'set-org-agenda-dirty nil t)))


;; Add NEXT as a todo option
(setq org-todo-keywords '((Sequence "☛ TODO(t)" "NEXT(N)" "PROJ(p)" "LOOP(r)" "STRT(s)" "⚑ WAIT(w)" "HOLD(h)" "IDEA(i)" "|" "★ DONE(d)" "✘ KILL(k)")
  (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
  (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))

(setq org-agenda-span 20) ;; Increase agenda days 10 -> 20


(defun org-timestamp-tomorrow ()
  "Returns an org-mode style timestamp string for tomorrow."
  (format-time-string "<%Y-%m-%d %a>"
                      ((lambda ()
                         (let ((now (decode-time)))
                           (incf (nth 3 now))
                           (encode-time now))))))

;; Remove exiting templates matching key
(defun remove-org-capture-template-by-key (key)
  "Removes any templates from org-capture-templates that are triggered by 'key."
  (mapc (lambda (item)
          (setq org-capture-templates (remove item org-capture-templates)))
        (seq-filter (lambda (item)
                      (string= (car item) key))
                    org-capture-templates)))

;;(mapc 'remove-org-capture-template-by-key '("t"))

(setq org-capture-templates '(("g" "Add to General TODOs" entry (file+headline "~/org-mode/tasks-todo.org" "General TODOs")
                               "* ☛ TODO %?" :empty-lines-before 1 :empty-lines-after 1)
                              ("t" "Do it today!" entry (file+headline "~/org-mode/tasks-todo.org" "General TODOs")
                               "* ☛ TODO %?\nSCHEDULED: %t" :empty-lines-before 1 :empty-lines-after 1)
                              ("m" "Do it tomorrow.." entry (file+headline "~/org-mode/tasks-todo.org" "General TODOs")
                               "* ☛ TODO %?\nSCHEDULED: %(org-timestamp-tomorrow)" :empty-lines-before 1 :empty-lines-after 1)
                              ("e" "Do it for EMACS" entry (file+headline "~/org-mode/tasks-todo.org" "EMACS TODOs")
                               "* ☛ TODO %?" :empty-lines-before 1 :empty-lines-after 1)
                              ("?" "Do it later, maybe" entry (file+headline "~/org-mode/tasks-todo.org" "Do later, maybe...")
                               "* ☛ TODO %?" :empty-lines-before 1 :empty-lines-after 1)
                              ("l" "Do it way later" entry (file+headline "~/org-mode/tasks-todo.org" "Things for way later")
                               "* ☛ TODO %?" :empty-lines-before 1 :empty-lines-after 1)))

(setq org-capture-bookmark nil) ;; Don't store bookmark of last capture

;;
;; This section is all about refreshing the agenda and keeping things how I want them
;;

(defun org-agenda-buffer-reload ()
  "If the \"*Org Agenda*\" buffer exists, reload it."
  (let ((agenda-buffer (get-buffer "*Org Agenda*")))
       (if agenda-buffer
           (ignore-errors (with-current-buffer agenda-buffer
              (org-agenda nil "a"))))))

;; After capture, reset visibility in the todo list and refresh the agenda
(defun org-agenda-refresh-after-capture ()
  "To be called in an \"org-capture-after-finalize-hook\" hook."
  (when (not org-note-abort)
    (ignore-errors (org-agenda-buffer-reload))
    (let ((todo-buffer (get-buffer "tasks-todo.org")))
      (if todo-buffer
          (with-current-buffer todo-buffer
            (with-universal-arg 'org-global-cycle))))))

(add-hook 'org-capture-after-finalize-hook 'org-agenda-refresh-after-capture)

;; Refresh agenda periodically
(defun stop-org-agenda-buffer-reload-timer ()
  "Cancel the org-agenda-buffer-reload-time, if it's running."
  (ignore-errors (cancel-timer org-agenda-buffer-reload-timer)))

(defun set-org-agenda-dirty (&rest r)
  (setq org-agenda-dirty t))

(set-org-agenda-dirty)

(defun start-org-agenda-buffer-reload-timer () ;; Called in 'org-mode-hook
  "Cancels and reinstates the timer so you don't end up with multipe timers."
  (stop-org-agenda-buffer-reload-timer)
  (setq org-agenda-buffer-reload-timer
    (run-with-idle-timer .5 t (lambda ()
                                (if (and (string= (buffer-name) "tasks-todo.org") org-agenda-dirty)
                                    (progn (org-agenda-buffer-reload)
                                           (setq org-agenda-dirty nil)))))))

(start-org-agenda-buffer-reload-timer)

;; (defun without-org-agenda-buffer-reload-timer (f &rest args)
;;   "Disable this timer before running this function. Mainly used to provide
;; advice for functions this timer goofs up."
;;   (stop-org-agenda-buffer-reload-timer)
;;   (let ((res (apply f (first args)))) ;; I don't like that I seem to have to "unwrap" args. Maybe in the future I'll understand a cleaner way
;;     (start-org-agenda-buffer-reload-timer)
;;     res))

;; (define-advice org-sort-entries (:around (f &rest args) nil)
;;   "Turn off the timer before running org-sort."
;;   (without-org-agenda-buffer-reload-timer f args))

;; (define-advice org-priority (:around (f &rest args) nil)
;;   "Turn off the timer before running org-sort."
;;   (without-org-agenda-buffer-reload-timer f args))


;; (define-advice universal-argument--mode (:around (f &rest args) nil)
;;   "Turn off the timer before running org-sort."
;;   (without-org-agenda-buffer-reload-timer f args))

;; (add-hook 'after-change-functions '(lambda (a b c) (message "here")) nil t)
;;(add-hook 'after-change-functions '(lambda (a b c) (setq org-agenda-dirty t)) nil t)



;;(add-hook 'after-change-functions '(lambda (a b c) (run-with-idle-timer 5 nil 'org-agenda-buffer-reload)) nil t)

;;(add-hook 'after-change-functions '(lambda (a b c) (setq org-agenda-dirty t)) nil t)
