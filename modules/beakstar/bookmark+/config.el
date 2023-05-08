(setq bookmark-default-file "~/.doom.d/bookmarks")
(setq bmkp-last-as-first-bookmark-file nil)

(map! :leader :desc "bookmarks+" "<RET>" #'bookmark-bmenu-list)
