(use-package! org-download
  :after org
  :defer nil
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "images")
  (org-download-heading-lvl nil)
  (org-download-timestamp "%Y%m%d-%H%M%S_")
  (org-image-actual-width 300)
  (org-download-screenshot-method "/usr/local/bin/pngpaste %s"))

(after! org-download
  (setq org-image-actual-width nil
        org-download-annotate-function #'org-download-annotate-with-image-drawer))

(defun org-download-annotate-with-image-drawer (link)
  "Annotate LINK with and image drawer."
  (message ":IMAGE_INFO:\n#+ATTR_HTML: :width 200\n:END:\n"))

(after! org
  (message "Emabling org-download")
  (org-download-enable))

(map! :mode org-mode
      :desc "insert image from clipboard"
      "s-V" #'org-download-clipboard)
