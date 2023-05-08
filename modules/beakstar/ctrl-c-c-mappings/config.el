;; Global mappings

;; File & Directory actions
;;(general-define-key
;;  :prefix "C-c"
;;  :states 'normal
;;  "f" '(:ignore t :which-key "file & dir")
;;  "f d" '(:ignore t :which-key "directory")
;;  "f d c" '(make-directory :which-key "create directory"))

(general-define-key
  :prefix "C-c"
  :states 'normal
  "M" '(:ignore t :which-key "major mode")
  "M l" '(emacs-lisp-mode :which-key "emacs lisp mode")
  "M j" '(json-mode :which-key "json mode")
  "f" '(:ignore t :which-key "file & dir")
  "f d" '(:ignore t :which-key "directory")
  "f d c" '(make-directory :which-key "create directory"))
