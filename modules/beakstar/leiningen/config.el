(defun leiningen-new-app ()
  "Create a clojure app using the 'app' template."
  (interactive)
  (let (
        (project_name (read-string "Project Name: "))
        (project_dir (read-directory-name "Project Directory: ")))
  (shell-command (concat "cd \"" project_dir "\" && lein new app " project_name " > /dev/null 2>&1 && echo \"Project successfully created.\""))))

(defun leiningen-run ()
  "Run the clojure app in the current directory"
  (interactive)
  (setq current-prefix-arg '(4)) ;; So that the output will go to minibuffer
  (shell-command "lein run"))

(defun leiningen-clean ()
  "Run the clojure app in the current directory"
  (interactive)
  (setq current-prefix-arg '(4)) ;; So that the output will go to minibuffer
  (shell-command "lein clean"))

(defun leiningen-uberjar ()
  "Create uberjar"
  (interactive)
  (message "building uberjar...")
  (setq current-prefix-arg '(4)) ;; So that the output will go to minibuffer
  (shell-command "lein uberjar"))

(defhydra hydra-leiningen ()
  "
  +-----------------------------------------------------^^^^+
  |                        Leiningen                    ^^^^|
  |-----------------------------------------------------^^^^|
  |                                                     ^^^^|
  | _c_: Clean                    _r_: Run the application  |
  | _n_: Create new (app) project _u_: Create uberjar       |
  |                                                     ^^^^|
  +-----------------------------------------------------^^^^+
  "
  ("c" leiningen-clean nil :exit t)
  ("n" leiningen-new-app nil :exit t)
  ("u" leiningen-uberjar nil :exit t)
  ("r" leiningen-run nil :exit t))
