(after! cider
  ;; (add-to-list 'evil-emacs-state-modes 'cider-repl-mode)
  (remove-popup-rule! "^\\*cider-repl")
  (map! :map cider-repl-mode-map
        :desc "previous command"
        :eni "<up>"#'cider-repl-backward-input :desc "previous command"
        :eni "C-k"#'cider-repl-backward-input :desc "next command"
        :eni "<down>"#'cider-repl-forward-input :desc "next command"
        :eni "C-j"#'cider-repl-forward-input)
  (map! :map clojure-mode-map
        :desc "open repl"
        :leader "m o"#'+clojure/open-repl)

  (add-hook 'cider-mode-hook
            (lambda ()
                    (add-hook 'cider-after-eval-done-hook
                              (lambda ()
                                      (with-current-buffer (cider-current-repl 'clj)
                                        ;; (evil-scroll-left 2)
                                        (evil-normal-state)
                                        (set-window-hscroll (get-buffer-window (cider-current-repl 'clj)) 0)
                                        (cider-repl-closing-return))))))

                    ;; (add-hook 'after-save-hook
                    ;;           (lambda ()
                    ;;                   (if (and (boundp 'cider-mode) cider-mode)
                    ;;                     (cider-load-buffer))))))

  (setq
     cider-jack-in-auto-inject-clojure "1.11.1"
     cider-injected-nrepl-version "1.0.0"))

(after! clojure-mode
  ;; Allow easy opening of babashka repl when editing stand alone babashka scripts
  (setq cider-allow-jack-in-without-project t)
  (setq cider-jack-in-default 'babashka)

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
        :localleader :desc "deps" "D" #'hydra-clojure-deps/body))

;; (after! lsp-mode
;;  (lsp-register-client
;;         (make-lsp-client
;;         :download-server-fn (lambda (_client callback error-callback _update?)
;;                                 (lsp-package-ensure 'clojure-lsp callback error-callback))
;;         :semantic-tokens-faces-overrides '(:types (("macro" . font-lock-keyword-face)
;;                                                 ("keyword" . clojure-keyword-face)
;;                                                 ("event" . default)))
;;         :new-connection (lsp-stdio-connection
;;                         (lambda ()
;;                         (or lsp-clojure-custom-server-command
;;                                 `(,(lsp-clojure--server-executable-path))))
;;                         (lambda ()
;;                         (or lsp-clojure-custom-server-command
;;                                 (lsp-clojure--server-executable-path))))
;;         :major-modes '(clojure-mode clojurec-mode clojurescript-mode)
;;         :library-folders-fn (lambda (_workspace) (list lsp-clojure-workspace-cache-dir))
;;         :uri-handlers (lsp-ht ("jar" #'lsp-clojure--file-in-jar))
;;         :action-handlers (lsp-ht ("code-lens-references" #'lsp-clojure--show-references))
;;         :notification-handlers (lsp-ht ("clojure/textDocument/testTree" #'lsp-clojure--handle-test-tree))
;;         :initialization-options '(:dependency-scheme "jar"
;;                                 :show-docs-arity-on-same-line? t
;;                                 :source-paths ["src" "test" "/Users/mtwomey/.babashka"])
;;         :custom-capabilities `((experimental . ((testTree . ,(and (require 'lsp-treemacs nil t) t)))))
;;         :server-id 'clojure-lsp)))

;; (map! :desc "next buffer" "C-x l" #'hydra-buffer-cycle/next-buffer
;;       :desc "next buffer" "C-x <right>" #'hydra-buffer-cycle/next-buffer
;;       :desc "previous buffer" "C-x h" #'hydra-buffer-cycle/previous-buffer
;;       :desc "previous buffer" "C-x <left>" #'hydra-buffer-cycle/previous-buffer)
;;
;; (map! :map web-mode-map :nv "j" #'evil-next-visual-line)
;; (map! :map web-mode-map :nv "k" #'evil-previous-visual-line)
