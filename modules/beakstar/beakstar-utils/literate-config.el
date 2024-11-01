(defun curl (&optional start end)
  "runs system curl command on selection or user input and inserts
the results in the buffer."
  (interactive "r")
  (let ((url (if (use-region-p) (buffer-substring-no-properties start end)
               (read-string "url: "))))
    (ignore-errors
      (deactivate-mark))
    (end-of-line)
    (insert (concat "\n" (s-replace-regexp "" "" (shell-command-to-string (concat "curl -s -i '" url "'")))))
    (beginning-of-line)))

(defun occur-from-search ()
  "Runs occur on the regex used in the last '/' search. This is useful for capturing
all the matches (just the matches, not the whole lines) into the occur buffer so
you can do something with them.

Note: Assumes evil search, so you may need to tweak for your needs."
  (interactive)
  (let ((search-pattern evil-ex-search-pattern))
    (if search-pattern (let ((capture-type (if (zerop (regexp-opt-depth (nth 0 search-pattern))) "\\&"
                                             "\\1")))
                         (occur (nth 0 search-pattern) capture-type)
                         (other-window 1))
      (message "First search with '/'."))))


(defun what-face (pos)
  "Print info about the face at point."
  (interactive "d")
  (let ((face (or (get-char-property (point)
                                     'read-face-name)
                  (get-char-property (point)
                                     'face))))
    (if face
        (let ((text-properties (prin1-to-string (plist-get (text-properties-at (point))
                                                           'face))))
          (message "Face: %s Text Properties: %s" face
                   text-properties))
      (message "No face at %d" pos))))

(defun evil-buffer-new-window ()
  (interactive)
  (make-frame '((width . 160)
                (height . 50)))
  (evil-buffer-new 0 nil))

(defun save-new-file (f)
  "Create a new file and open it."
  (interactive "FFilename: ")
  (with-temp-buffer (write-file f t))
  (find-file f))

(defun with-universal-arg (f)
  "Run function with universal arg"
  (setq current-prefix-arg '(4)) ;; Strangely "4" is the universal arg. Should have been "42" lol
  (call-interactively f))

(defun format-elisp ()
  "Format the selected region as emacs-lisp code."
  (interactive)
    (if (region-active-p)
        (let ((str (buffer-substring (region-beginning) (region-end))))
          (delete-region (region-beginning) (region-end))
          (pp-emacs-lisp-code (read str))))
      (message "No active region."))

(defun add-base64-padding (base64-str)
  "Add padding to base64 encoded string if necessary."
  (let* ((remainder (% (length base64-str) 4))
         (padding-length (cond ((= remainder 2) 2)
                               ((= remainder 3) 1)
                               (t 0))))
    (concat base64-str (make-string padding-length ?=))))

(defun decode-jwt (jwt)
  "Decode JWT token using the json.el library."
  (require 'json)
  (let* ((jwt-parts (split-string jwt "\\." t))
         (header (json-read-from-string (base64-decode-string (add-base64-padding (nth 0 jwt-parts)))))
         (payload (json-read-from-string (base64-decode-string (add-base64-padding (nth 1 jwt-parts)))))
         (decoded-jwt (concat (json-encode header)
                              "."
                              (json-encode payload)
                              "."
                              (nth 2 jwt-parts))))
    (concat (with-temp-buffer
              (insert (json-encode header))
              (json-pretty-print-buffer)
              (buffer-string))
            "\n"
            (with-temp-buffer
              (insert (json-encode payload))
              (json-pretty-print-buffer)
              (buffer-string))
            "\n")))

(defun decode-jwt-token (begin end)
  "Decode JWT token in the region from BEGIN to END and replace it with decoded token."
  (interactive "r")
  (let ((jwt (buffer-substring-no-properties begin end)))
    (delete-region begin end)
    (insert (decode-jwt jwt))))

(defun base64-decode-region-padding (begin end)
  "Add any missing padding to the base64 string, then decode it."
  (interactive "r")
  (let ((s (buffer-substring-no-properties begin end)))
    (delete-region begin end)
    (insert (base64-decode-string (add-base64-padding s)))))

(after! term-toggle
  (defun pearpop-payout ()
    (interactive)
    (term-toggle-ansi)
    (term-send-raw-string (concat "pearpop-payout \n"))))

(defun purge-recent-files ()
  "Wipe the recent files list."
  (interactive)
  (setq recentf-list nil))

(defun insert-zero-width-space ()
  "Inserts a Unicode zero-width space character."
  (interactive)
  (insert "\u200B"))

(defun reset-font-scale ()
  (interactive)
  (set-face-attribute 'default nil :height 140)
  (text-scale-set 0))

(defun cc/move-sexp-backward ()
  "Move balanced expression (sexp) to the right of point backward one sexp.
Point must be at the beginning of balanced expression (sexp)."
  (interactive)
  (transpose-sexps 1)
  (forward-sexp -2))

(defun cc/move-sexp-forward ()
  "Move balanced expression (sexp) to the right of point forward one sexp.
Point must be at the beginning of balanced expression (sexp)."
  (interactive)
  (forward-sexp 1)
  (transpose-sexps 1)
  (forward-sexp -1))

(defun insert-v4-uuids (num-uuids)
  "Generate a number of V4 UUIDs adhering to the V4 specification and insert them into the current buffer, one per line."
  (interactive "nHow many UUIDs to generate? ")
  (dotimes (_ num-uuids)
    (let ((uuid (format "%04x%04x-%04x-4%03x-%04x-%04x%04x%04x"
                        (random (expt 16 4)) (random (expt 16 4))
                        (random (expt 16 4))
                        (logior (logand (random (expt 16 4)) #x0fff) #x4000)
                        (logior (logand (random (expt 16 4)) #x3fff) #x8000)
                        (random (expt 16 4)) (random (expt 16 4)) (random (expt 16 4)))))
      (insert (concat uuid "\n")))))

(defun switch-mode-and-jsdoc (f &rest r)
  (let ((initial-mode major-mode))
   (js-ts-mode)
   (let ((return (apply f r))) ;; Save the return so we can return whatever
     (funcall initial-mode)
     return)))

(advice-add 'jsdoc :around #'switch-mode-and-jsdoc)

(defvar less-important-buffer-names
        '("*Async-native-compile-log*"
          "*clojure-lsp*"
          "*clojure-lsp::stderr*"
          "*Compile-Log*"
          "*copilot events*"
          "*dap-ui.*"
          "*lsp-"
          "*magit-process:"
          "*Messages*"
          "*Native-compile-Log*"
          ;; "*new*"
          "*Pp Eval Output*"
          "*pyright.*"
          "*Python ::"
          "*scratch*"
          "*ts-ls*"
          "*ts-ls::stderr*"
          "*zprint-mode errors*"
          "*semgrep-")
        "Less important buffer names")

(defun filter-strings-by-regex (strings regex-list)
  "Filter out items in a list of strings based on a list of regex patterns."
  (cl-remove-if (lambda (string)
                        (seq-some (lambda (regex) (string-match-p regex string))
                                  regex-list))
                strings))

(defun important-buffer-count ()
       (length (filter-strings-by-regex
                 (seq-filter (lambda (name) (not (string-prefix-p " " name)))
                             (mapcar 'buffer-name (buffer-list)))
                 less-important-buffer-names)))

(advice-add #'next-buffer :around
            (lambda (f &rest r)
                    (when (> (important-buffer-count) 1) (apply f r))))

(advice-add #'previous-buffer :around
            (lambda (f &rest r)
                    (when (> (important-buffer-count) 1) (apply f r))))

(defun visidata-on-file ()
  "Run visidata on the file currently highlighted in dired or the file currently visited in the buffer."
  (interactive)
  (let*
    ((filename (if (eq major-mode 'dired-mode)
                 (dired-get-file-for-visit)
                 (buffer-file-name)))
      (file (if (tramp-tramp-file-p filename)
              (tramp-handle-file-local-copy filename)
              filename)))
    (if file
      (let ((command
              (format
                "open -a /Users/mtwomey/scripts/visidata-terminal.app %s"
                (shell-quote-argument file))))
           (message command)
           (save-excursion (set-buffer "*scratch*") (shell-command command)))
      (message "No file selected"))))

(provide 'beakstar-utils)
