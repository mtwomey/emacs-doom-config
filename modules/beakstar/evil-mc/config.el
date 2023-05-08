(use-package! evil-mc :defer)

(map! :desc "Make Cursors dwim"
      :nvm "C-m"#'evil-mc-dwim)
