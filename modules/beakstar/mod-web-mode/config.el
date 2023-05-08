(setq auto-mode-alist (seq-filter ;; Get rid of existing html association
                       (lambda (el) (not (string-match-p (regexp-quote "html") (car el))))
                       auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.\\(html?\\|css\\)\\'" . web-mode))

(add-hook 'web-mode-hook (lambda ()
                           (flyspell-mode)
                           (impatient-mode)
                           (httpd-stop)
                           (httpd-start)
                           (toggle-truncate-lines)))

(after! web-mode
  (map! :map web-mode-map :nv "j" #'evil-next-visual-line)
  (map! :map web-mode-map :nv "k" #'evil-previous-visual-line)
  )
