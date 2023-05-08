(defun temp-note ()
  "Creates a file named note-[timestamp].org in the /tmp directory. Then opens that file
in a new frame. Used to just get a quick note going, which you can later save-as where you
want it."
  (interactive)
  (let ((f (concat "/tmp/note-" (format-time-string "%Y-%m-%d_%H-%M-%S") ".org")))
    (with-temp-buffer (write-file f t))
    (find-file-other-frame f)))
