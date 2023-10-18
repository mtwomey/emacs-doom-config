(defun this-directory ()
  (file-name-directory (or load-file-name buffer-file-name)))

(defmacro with-current-directory (directory &rest body)
  "Execute body setting the default directory and load-path."
  `(let ((load-path (cons ,directory load-path))
         (default-directory ,directory))
     ,@body))

(defmacro add-hook-run-once (hook func)
  "This takes a hook and a body. It defines a function and adds it to the hook
using add-hook. The function will run the body and then remove itself from the
hook with remove-hook. Finally the funciton will undefine itself with fmakunbound.
This has the effect of a hook function that will run only one time"
  (let ((unique-func-name (gensym "f")))
       `(progn (defun ,unique-func-name ()
                      (funcall ,func)
                      (remove-hook ,hook ',unique-func-name)
                      (fmakunbound ',unique-func-name))
               (add-hook ,hook ',unique-func-name))))
