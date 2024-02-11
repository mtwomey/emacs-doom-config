(after! cider
  (remove-popup-rule! "^\\*cider-repl")

  (setq
   cider-jack-in-auto-inject-clojure "1.11.1"
   cider-injected-nrepl-version "1.0.0")


  (map! :map cider-repl-mode-map
        :desc "previous command"
        :eni "<up>"#'cider-repl-backward-input :desc "previous command"
        :eni "C-k"#'cider-repl-backward-input :desc "next command"
        :eni "<down>"#'cider-repl-forward-input :desc "next command"
        :eni "C-j"#'cider-repl-forward-input)

  (add-hook 'cider-mode-hook
            (lambda ()
                    (add-hook 'cider-after-eval-done-hook
                              (lambda ()
                                      (with-current-buffer (cider-current-repl 'clj)
                                        (evil-normal-state)
                                        (set-window-hscroll (get-buffer-window (cider-current-repl 'clj)) 0)
                                        (cider-repl-closing-return)))))))

(after! clojure-mode
  ;; Allow easy opening of babashka repl when editing stand alone babashka scripts
  (setq cider-allow-jack-in-without-project t)
  (setq cider-jack-in-default 'babashka)

  (map! :map clojure-mode-map
        :desc "open repl"
        :leader "m o"#'+clojure/open-repl))

(add-to-list 'auto-mode-alist '("\\.bb\\'" . clojure-mode))

  (defun clojure-jar ()
    (interactive)
    (message "Creating jar...")
    (sleep-for 0 300) ;; For display purposes
    (shell-command (concat "cd " (projectile-project-root)
                           "; clojure -T:build jar"))
    (message "Done."))

  (defun clojure-uberjar ()
    (interactive)
    (message "Creating uberjar...")
    (sleep-for 0 300) ;; For display purposes
    (shell-command (concat "cd " (projectile-project-root)
                           "; clojure -T:build uber"))
    (message "Done."))

  (defun clojure-install ()
    (interactive)
    (message "creating jar and installing...")
    (sleep-for 0 300) ;; for display purposes
    (shell-command (concat "cd " (projectile-project-root)
                           "; clojure -T:build install"))
    (message "done."))

  (defun clojure-install-clear-cache ()
    (interactive)
    (message "creating jar, installing, clearing cache...")
    (sleep-for 0 300) ;; for display purposes
    (shell-command (concat "cd " (projectile-project-root)
                           "; clojure -T:build install; rm -R ~/.clojure/.cpcache"))
    (message "done."))

  (defun clojure-clean ()
    (interactive)
    (message "Running clean...")
    (sleep-for 0 300) ;; For display purposes
    (shell-command (concat "cd " (projectile-project-root)
                           "; clojure -T:build clean"))
    (message "Done."))

  (defhydra hydra-clojure-deps (:color blue
                                :hint nil)
    "
^Deps Command^
^^------------
_i_: install
_I_: install & clear .cpcache
_u_: uberjar
_j_: jar
_c_: clean
"
    ("i" clojure-install)
    ("I" clojure-install-clear-cache)
    ("u" clojure-uberjar)
    ("j" clojure-jar)
    ("c" clojure-clean))

  (map! :after clojure-mode
        :map clojure-mode-map
        :localleader :desc "deps" "D" #'hydra-clojure-deps/body)
