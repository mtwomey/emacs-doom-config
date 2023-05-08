;;; Replaces the ASCII art on the default page with the art in the file splash.ascii

(defconst splashcii-file-name
  (expand-file-name "splash.ascii"
   (file-name-directory load-file-name)))

(defun read-lines (filePath)
  "Return a list of lines of a file at FILEPATH."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun beakstar-dashboard-draw-ascii-banner-fn ()
  (let* ((banner (read-lines splashcii-file-name))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert
        (+doom-dashboard--center
         +doom-dashboard--width
         (concat
          line
          (make-string
           (max 0 (- longest-line (length line)))
           32)))
        "\n"))
     'face
     'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn 'beakstar-dashboard-draw-ascii-banner-fn)

(setq +doom-dashboard--width 160)
