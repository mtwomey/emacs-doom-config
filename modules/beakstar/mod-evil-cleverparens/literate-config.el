(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'cider-repl-mode-hook #'evil-cleverparens-mode)
(add-hook 'org-mode-hook #'evil-cleverparens-mode)
(add-hook 'python-mode-hook #'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

(evil-define-operator evil-cp-delete-char-or-splice-backwards-or-join (_count)
  (interactive "p")
  (let ((unnamed-register (evil-get-register ?\")))
       (unwind-protect (progn (if (bolp)
                                (call-interactively
                                  #'evil-delete-backward-char-and-join)
                                (call-interactively
                                  #'evil-cp-delete-char-or-splice-backwards)))
                       (evil-set-register ?\" unnamed-register))))

(after! clojure-mode
        (map! :map clojure-mode-map
              :i "<backspace>" #'evil-cp-delete-char-or-splice-backwards-or-join)
        (map! :map cider-repl-mode-map
              :i "<backspace>" #'evil-cp-delete-char-or-splice-backwards-or-join))

(after! org
        (map! :map org-mode-map
              :i "<backspace>" #'evil-cp-delete-char-or-splice-backwards-or-join))

(after! python
        (map! :map python-mode-map
              :i "<backspace>" #'evil-cp-delete-char-or-splice-backwards-or-join))

(map! :map emacs-lisp-mode-map
      :i "<backspace>" #'evil-cp-delete-char-or-splice-backwards-or-join)
