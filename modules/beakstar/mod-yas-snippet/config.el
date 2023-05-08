(after! yasnippet
  (map! :map yas-minor-mode-map
        [tab] nil
        :nvi [C-tab] 'yas-expand))
