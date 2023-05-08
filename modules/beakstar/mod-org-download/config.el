(defun org-download-annotate-with-image-drawer (link)
  "Annotate LINK with and image drawer."
  (message ":IMAGE_INFO:\n#+ATTR_HTML: :width 200\n:END:\n"))

(use-package! org-download
  :after org
  :defer nil
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "images")
  (org-download-heading-lvl nil)
  (org-download-timestamp "%Y%m%d-%H%M%S_")
  (org-image-actual-width 300)
  (org-download-screenshot-method "/usr/local/bin/pngpaste %s")
  :bind
  ("C-M-y" . org-download-screenshot)
  :config
  (require 'org-download))

(after! org-download
  ;; Turn off default / global image sizes so that I can deal with size per image
  (setq org-image-actual-width nil)

  ;; Use my custom function to add an image drawer above the screenshot
  (setq org-download-annotate-function #'org-download-annotate-with-image-drawer)
  (map! :desc "insert image from clipboard" :mode org-mode "s-V" #'org-download-clipboard))
