(defun marginalia-annotate-symbol-fixed (cand)
  "Annotate symbol CAND with its documentation string."
  (when-let (sym (intern-soft cand))
    (marginalia--fields
     (:left (marginalia-annotate-binding cand))
     ((marginalia--symbol-class sym) :face 'marginalia-type)
     ((cond
       ((fboundp sym) (marginalia--function-doc sym))
       ((facep sym) (documentation-property sym 'face-documentation))
       (t (documentation-property sym 'variable-documentation)))
      :truncate 1.0 :face 'marginalia-documentation))))

(advice-add 'marginalia-annotate-symbol :override #'marginalia-annotate-symbol-fixed)
