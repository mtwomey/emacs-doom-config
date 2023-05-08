(after! projectile
  (add-to-list 'projectile-globally-ignored-directories "*node_modules")
  (setq projectile-globally-unignored-files '(".env")))
