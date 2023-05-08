(defun unpack-image-drawers (&rest r)
  "Replace drawers named \"IMAGE_INFO\" with their contents."
  (let* ((drawer-name "IMAGE_INFO")
         (save-string "#+ATTR_SAVE: true\n")
         (image-drawers (reverse (org-element-map (org-element-parse-buffer)
                                     'drawer
                                   (lambda (el)
                                     (when (string= drawer-name (org-element-property :drawer-name el))
                                       el))))))
    (cl-loop for drawer in image-drawers do
             (setf (buffer-substring (org-element-property :begin drawer)
                                     (- (org-element-property :end drawer) 1)) ;; Don't touch the character \n? right before the image or things get weird
                   (concat save-string
                           (buffer-substring (org-element-property :contents-begin drawer)
                                             (- (org-element-property :contents-end drawer) 1))))))) ;; Don't touch the character \n? right before the image or things get weird

(defun repack-image-drawers (&rest _)
  "Restore image drawers replaced using `unpack-image-drawers'."
  (let* ((drawer-name "IMAGE_INFO")
         (save-string "#+ATTR_SAVE: true\n")
         (image-paragraphs (reverse (org-element-map (org-element-parse-buffer)
                                        'paragraph
                                      (lambda (el)
                                        (when (string= "true" (nth 0 (org-element-property :attr_save el)))
                                          el))))))
    (cl-loop for paragraph in image-paragraphs do
             (setf (buffer-substring (org-element-property :begin paragraph)
                                     (- (org-element-property :contents-begin paragraph) 1))
                   (concat ":" drawer-name ":\n"
                           (buffer-substring (+ (length save-string) (org-element-property :begin paragraph))
                                             (- (org-element-property :contents-begin paragraph) 1))
                           "\n:END:")))))


(defun apply-with-image-drawers-unpacked (f &rest r)
  "Replace drawers named \"IMAGE_INFO\" with their contents, run the function,
finally restore the drawers as they were. Also collapses all drawers before returning."
  (unpack-image-drawers)
  (apply f r)
  (repack-image-drawers)
  (org-hide-drawer-all))

(advice-add #'org-display-inline-images :around #'apply-with-image-drawers-unpacked)
(add-hook 'org-export-before-processing-hook 'unpack-image-drawers)
