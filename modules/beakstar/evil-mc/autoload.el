;;;###autoload
(defun evil-mc-dwim ()
  "Invoke different evil-mc modes depending on the situation.
- If a region is seleced that spans more then one line, make cursors at the beginning of those lines.
- If a region is selected that's on a single line, call evil-mc-make-all-cursors on that selection.
- Otherwise, call evil-mc-make-all-cursors on the word at point."
  (interactive)
  (let ((saved-move-back evil-move-cursor-back)) ;; Save a restore this state afterward, fixes issue with block selections
    (setq evil-move-cursor-back nil)
    (if (equal (evil-visual-state-p) t)
        (if (= (line-number-at-pos (region-beginning)) (line-number-at-pos (region-end)))
            (evil-mc-make-all-cursors)
          (progn
            (evil-mc-make-cursor-in-visual-selection-beg)
            (evil-mc-execute-for-all-cursors #'evil-normal-state)))
      (evil-mc-make-all-cursors))
    (setq evil-move-cursor-back saved-move-back)))
