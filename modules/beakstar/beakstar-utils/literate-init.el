(defun this-directory ()
  (file-name-directory (or load-file-name buffer-file-name)))

(defmacro with-current-directory (directory &rest body)
  "Execute body setting the default directory and load-path."
  `(let ((load-path (cons ,directory load-path))
         (default-directory ,directory))
     ,@body))

(defmacro add-hook-run-once (hook func)
  "This takes a hook and a function. It defines a new function
that first calls the supplied function and then removes itself
from the hook with remove-hook and undefines itself. This new
function will be added to the hook using add-hook. This has the
effect of a hook function that will run only one time."
  (let ((unique-func-name (gensym "f")))
       `(progn (defun ,unique-func-name ()
                      (funcall ,func)
                      (remove-hook ,hook ',unique-func-name)
                      (fmakunbound ',unique-func-name))
               (add-hook ,hook ',unique-func-name))))

(defmacro without-kill-ring (&rest body)
  "Execute BODY while temporarily saving and restoring the kill ring.
The kill ring is saved before BODY is executed, and restored after."
  (let ((orig-kill-ring (gensym "orig-kill-ring")))
    `(let ((,orig-kill-ring kill-ring))
       (unwind-protect
           (progn
             ;; Execute the body
             ,@body)
         ;; Restore the kill ring
         (setq kill-ring ,orig-kill-ring)))))

(setq initial-major-mode 'emacs-lisp-mode)
