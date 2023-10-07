(setq org-hugo-base-dir "~/org-mode/notes"
      org-hugo-default-section-directory "posts")

(with-eval-after-load 'ox
  (require 'ox-hugo))

(defun convert-notes-images (&rest _)
  (message "Calling convert-images.bb (this is :after advice on org-hugo-export-to-md)")
  (call-process "~/org-mode/notes/scripts/convert-images.bb"))

(advice-add #'org-hugo-export-to-md :after #'convert-notes-images)
