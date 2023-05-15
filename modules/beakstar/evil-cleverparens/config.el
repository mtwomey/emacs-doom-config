;; Use evil-cleverparens in clojure
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'cider-repl-mode-hook #'evil-cleverparens-mode)
