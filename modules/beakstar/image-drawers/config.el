(after! org
  (defun unpack-image-drawers (&rest r)
    "Replace drawers named \"IMAGE_INFO\" with their contents."
    (let* ((drawer-name "IMAGE_INFO")
           (save-string "#+ATTR_SAVE: true\n")
           (image-drawers
            (reverse (org-element-map
                         (org-element-parse-buffer) 'drawer
                       (lambda (el)
                         (when (string= drawer-name (org-element-property :drawer-name el))
                           el))))))
      (cl-loop for drawer in image-drawers do
               (let* ((drawer-begin (org-element-property :begin drawer))
                      (drawer-end (org-element-property :end drawer))
                      (drawer-contents-begin (org-element-property :contents-begin drawer))
                      (drawer-contents-end (org-element-property :contents-end drawer))
                      (drawer-contents (buffer-substring drawer-contents-begin (- drawer-contents-end 1))))
                 (goto-char drawer-begin)
                 (delete-char (- drawer-end drawer-begin 1))
                 (insert (concat save-string drawer-contents))))))

  (defun repack-image-drawers (&rest _)
    "Restore image drawers replaced using `unpack-image-drawers'."
    (let* ((drawer-name "IMAGE_INFO")
           (save-string "#+ATTR_SAVE: true\n")
           (image-paragraphs
            (reverse (org-element-map
                         (org-element-parse-buffer) 'paragraph
                       (lambda (el)
                         (when (string= "true" (nth 0 (org-element-property :attr_save el)))
                           el))))))
      (cl-loop for paragraph in image-paragraphs do
               (let* ((paragraph-begin (org-element-property :begin paragraph))
                      (paragraph-contents-begin
                       (org-element-property :contents-begin paragraph)))
                 (goto-char (- paragraph-contents-begin 1))
                 (insert "\n:END:")
                 (goto-char paragraph-begin)
                 (delete-char (length save-string))
                 (insert (concat ":" drawer-name ":\n"))))))

  (defun apply-with-image-drawers-unpacked (f &rest r)
    "Replace drawers named \"IMAGE_INFO\" with their contents, run the function,
  finally restore the drawers as they were. Also collapses all drawers before returning."
    (unpack-image-drawers)
    (apply f r)
    (repack-image-drawers)
    (org-hide-drawer-all))

  (advice-add #'org-display-inline-images :around #'apply-with-image-drawers-unpacked)
  (add-hook 'org-export-before-processing-hook 'unpack-image-drawers))

;; Don't touch the character \n? right before the image or things get weird
