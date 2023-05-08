(deftheme beakstar-dusk "Created 2021-06-27.")

(let* ((dark-background-1 "#000000")
       (dark-background-2 "#101010")
       (thunder-cloud "#505160")
       (warm-bright-yellow "#fabd2f")
       (black-1 "#000000")
       (warm-orange "#F39C12")

       (selection-highlight-background-1 warm-bright-yellow)
       (selection-highlight-background-2 warm-orange)
       (selection-highlight-foreground-1 black-1))

  (custom-theme-set-faces 'beakstar-dusk
                          `(bold ((t (:weight bold :foreground nil))))
                          `(bold-italic ((t (:inherit (bold italic)))))
                          `(italic ((t (:slant italic))))
                          `(escape-glyph ((t (:foreground "#8ec07c"))))
                          `(fringe ((t (:inherit default :foreground "#665c54"))))
                          `(region ((t (:background ,selection-highlight-background-1 :foreground ,selection-highlight-foreground-1
                                        :distant-foreground "#bcaf8e"
                                        :extend t))))
                          `(highlight ((t (:background "#fabd2f" :foreground "#0d1011"
                                           :distant-foreground "#fbf1c7"))))
                          `(cursor ((t (:background "white"))))
                          `(shadow ((t (:foreground "#7c6f64"))))
                          `(minibuffer-prompt ((t (:foreground "#8ec07c"))))
                          `(tooltip ((t (:background "#1d2021" :foreground "#ebdbb2"))))
                          `(secondary-selection ((t (:background "#928374" :extend t))))
                          `(lazy-highlight ((t (:background ,selection-highlight-background-1 :foreground ,selection-highlight-foreground-1
                                                :distant-foreground "#0d1011"
                                                :bold t))))
                          `(match ((t (:foreground "#b8bb26" :background "#0d1011"
                                       :weight bold))))
                          `(trailing-whitespace ((t (:background "#fb4934"))))
                          `(nobreak-space ((t (:inherit default :underline nil))))
                          `(vertical-border ((t (:background "#2c1802" :foreground "#2c1802"))))
                          `(link ((t (:foreground "#d3869b" :underline t
                                      :weight bold))))
                          `(error ((t (:foreground "#fb4934"))))
                          `(warning ((t (:foreground "#fabd2f"))))
                          `(success ((t (:foreground "#b8bb26"))))
                          ;;`(font-lock-builtin-face ((t (:foreground "#fe8019"))))
                          `(font-lock-builtin-face ((t (:foreground ,thunder-cloud))))
                          `(font-lock-comment-face ((t (:foreground "#928374"))))
                          `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
                          `(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#dfd2b8"))))
                          `(font-lock-constant-face ((t (:foreground "#d3869b"))))
                          `(font-lock-function-name-face ((t (:foreground "#b8bb26"))))
                          `(font-lock-keyword-face ((t (:foreground "#fb4934"))))
                          `(font-lock-string-face ((t (:foreground "#b8bb26"))))
                          `(font-lock-type-face ((t (:foreground "#fabd2f"))))
                          `(font-lock-variable-name-face ((t (:foreground "#83a598"))))
                          `(font-lock-warning-face ((t (:inherit warning))))
                          `(font-lock-negation-char-face ((t (:inherit bold :foreground "#ebdbb2"))))
                          `(font-lock-preprocessor-face ((t (:inherit bold :foreground "#ebdbb2"))))
                          `(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground "#ebdbb2"))))
                          `(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground "#ebdbb2"))))
                          `(mode-line ((t (:background "#2c1802" :foreground "#dfd2b8"
                                           :box nil))))
                          `(mode-line-inactive ((t (:background "#443e3a" :foreground "#928374"
                                                    :box nil))))
                          `(mode-line-emphasis ((t (:foreground "#fabd2f" :distant-foreground "#282828"))))
                          `(mode-line-highlight ((t (:inherit highlight :distant-foreground "#282828"))))
                          `(mode-line-buffer-id ((t (:weight bold))))
                          `(header-line ((t (:inherit mode-line))))
                          `(header-line-highlight ((t (:inherit mode-line-highlight))))
                          `(tab-line ((t (:background "#1d2021" :foreground "#1d2021"
                                          :box nil))))
                          `(line-number ((t (:inherit default :foreground "#7c6f64"
                                             :distant-foreground nil
                                             :weight normal
                                             :italic nil
                                             :underline nil
                                             :strike-through nil))))
                          `(line-number-current-line ((t (:inherit (hl-line default)
                                                          :foreground "#fabd2f"
                                                          :distant-foreground nil
                                                          :weight normal
                                                          :italic nil
                                                          :underline nil
                                                          :strike-through nil
                                                          :background "#3c3836"))))
                          `(all-the-icons-blue ((t (:foreground "#83a598"))))
                          `(all-the-icons-blue-alt ((t (:foreground "#8ec07c"))))
                          `(all-the-icons-cyan ((t (:foreground "#8ec07c"))))
                          `(all-the-icons-cyan-alt ((t (:foreground "#8ec07c"))))
                          `(all-the-icons-dblue ((t (:foreground "#458588"))))
                          `(all-the-icons-dcyan ((t (:foreground "#689d6a"))))
                          `(all-the-icons-dgreen ((t (:foreground "#80821a"))))
                          `(all-the-icons-dmaroon ((t (:foreground "#8e1914"))))
                          `(all-the-icons-dorange ((t (:foreground "#b15911"))))
                          `(all-the-icons-dpink ((t (:foreground "#fb6452"))))
                          `(all-the-icons-dpurple ((t (:foreground "#935d6c"))))
                          `(all-the-icons-dred ((t (:foreground "#af3324"))))
                          `(all-the-icons-dsilver ((t (:foreground "#9c8f81"))))
                          `(all-the-icons-dyellow ((t (:foreground "#ae8420"))))
                          `(all-the-icons-green ((t (:foreground "#b8bb26"))))
                          `(all-the-icons-lblue ((t (:foreground "#a8c0b6"))))
                          `(all-the-icons-lcyan ((t (:foreground "#afd2a3"))))
                          `(all-the-icons-lgreen ((t (:foreground "#cdcf67"))))
                          `(all-the-icons-lmaroon ((t (:foreground "#db6560"))))
                          `(all-the-icons-lorange ((t (:foreground "#fea65e"))))
                          `(all-the-icons-lpink ((t (:foreground "#fdada3"))))
                          `(all-the-icons-lpurple ((t (:foreground "#e0aab9"))))
                          `(all-the-icons-lred ((t (:foreground "#fc7f70"))))
                          `(all-the-icons-lsilver ((t (:foreground "#ded9d5"))))
                          `(all-the-icons-lyellow ((t (:foreground "#fbd06d"))))
                          `(all-the-icons-maroon ((t (:foreground "#cc241d"))))
                          `(all-the-icons-orange ((t (:foreground "#fe8019"))))
                          `(all-the-icons-pink ((t (:foreground "#fc887b"))))
                          `(all-the-icons-purple ((t (:foreground "#d3869b"))))
                          `(all-the-icons-purple-alt ((t (:foreground "#9b8379"))))
                          `(all-the-icons-red ((t (:foreground "#fb4934"))))
                          `(all-the-icons-red-alt ((t (:foreground "#a17a6a"))))
                          `(all-the-icons-silver ((t (:foreground "#c3bab2"))))
                          `(all-the-icons-yellow ((t (:foreground "#fabd2f"))))
                          `(avy-background-face ((t (:foreground "#928374"))))
                          `(avy-lead-face ((t (:background "#fabd2f" :foreground "#282828"
                                               :distant-foreground "#ebdbb2"
                                               :weight bold))))
                          `(avy-lead-face-0 ((t (:inherit avy-lead-face :background "#fbd06d"))
                                             (t (:inherit avy-lead-face :background "#ae8420"))))
                          `(avy-lead-face-1 ((t (:inherit avy-lead-face :background "#fde4ab"))
                                             (t (:inherit avy-lead-face :background "#644b12"))))
                          `(avy-lead-face-2 ((t (:inherit avy-lead-face :background "#fef8ea"))
                                             (t (:inherit avy-lead-face :background "#181204"))))
                          `(company-tooltip ((t (:inherit tooltip))))
                          `(company-tooltip-common ((t (:foreground "#8ec07c"))))
                          ;;`(company-tooltip-common ((t (:foreground "#000000"))))
                          `(company-tooltip-search ((t (:background "#fabd2f" :foreground "#282828"
                                                        :distant-foreground "#ebdbb2"
                                                        :weight bold))))
                          `(company-tooltip-search-selection ((t (:background "#3c3633"))))
                          `(company-tooltip-selection ((t (:background ,selection-highlight-background-1 :foreground ,selection-highlight-foreground-1))))
                          `(company-tooltip-mouse ((t (:background "#2c1802" :foreground nil))))
                          `(company-tooltip-annotation ((t (:foreground "#8ec07c"))))
                          `(company-scrollbar-bg ((t (:background "#3c3836"))))
                          `(company-scrollbar-fg ((t (:background "#8ec07c"))))
                          ;;`(company-scrollbar-fg ((t (:background "#000000"))))
                          `(company-preview ((t (:foreground "#928374"))))
                          `(company-preview-common ((t (:foreground "#8ec07c"))))
                          ;;`(company-preview-common ((t (:foreground "#000000"))))
                          `(company-preview-search ((t (:inherit company-tooltip-search))))
                          ;;`(company-tooltip-common-selection ((t (:foreground "#8ec07c"))))
                          `(company-tooltip-common-selection ((t (:foreground "#000000"))))
                          `(company-tooltip-annotation-selection ((t (:foreground "#8ec07c"))))
                          ;;`(company-tooltip-annotation-selection ((t (:foreground "#000000"))))
                          `(compilation-column-number ((t (:inherit font-lock-comment-face))))
                          `(compilation-line-number ((t (:foreground "#fabd2f"))))
                          `(compilation-error ((t (:inherit error :weight bold))))
                          `(compilation-warning ((t (:inherit warning :slant italic))))
                          `(compilation-info ((t (:inherit success))))
                          `(compilation-mode-line-exit ((t (:inherit compilation-info))))
                          `(compilation-mode-line-fail ((t (:inherit compilation-error))))
                          `(custom-button ((t (:foreground "#83a598"
                                               :background "#282828"
                                               :box (:line-width 1 :style none)))))
                          `(custom-button-unraised ((t (:foreground "#d3869b"
                                                        :background "#282828"
                                                        :box (:line-width 1 :style none)))))
                          `(custom-button-pressed-unraised ((t (:foreground "#282828"
                                                                :background "#d3869b"
                                                                :box (:line-width 1 :style none)))))
                          `(custom-button-pressed ((t (:foreground "#282828"
                                                       :background "#83a598"
                                                       :box (:line-width 1 :style none)))))
                          `(custom-button-mouse ((t (:foreground "#282828"
                                                     :background "#83a598"
                                                     :box (:line-width 1 :style none)))))
                          `(custom-variable-button ((t (:foreground "#b8bb26" :underline t))))
                          `(custom-saved ((t (:foreground "#b8bb26" :background "#444527"
                                              :bold t))))
                          `(custom-comment ((t (:foreground "#ebdbb2" :background "#2c1802"))))
                          `(custom-comment-tag ((t (:foreground "#928374"))))
                          `(custom-modified ((t (:foreground "#83a598" :background "#3a413e"))))
                          `(custom-variable-tag ((t (:foreground "#cc241d"))))
                          `(custom-visibility ((t (:foreground "#83a598" :underline nil))))
                          `(custom-group-subtitle ((t (:foreground "#fb4934"))))
                          `(custom-group-tag ((t (:foreground "#d3869b"))))
                          `(custom-group-tag-1 ((t (:foreground "#83a598"))))
                          `(custom-set ((t (:foreground "#fabd2f" :background "#282828"))))
                          `(custom-themed ((t (:foreground "#fabd2f" :background "#282828"))))
                          `(custom-invalid ((t (:foreground "#fb4934" :background "#522e2a"))))
                          `(custom-variable-obsolete ((t (:foreground "#928374" :background "#282828"))))
                          `(custom-state ((t (:foreground "#b8bb26" :background "#444527"))))
                          `(custom-changed ((t (:foreground "#83a598" :background "#282828"))))
                          `(diff-added ((t (:inherit hl-line :foreground "#b8bb26"))))
                          `(diff-changed ((t (:foreground "#d3869b"))))
                          `(diff-context ((t (:foreground "#cec09c"))
                                          (t (:foreground "#eddfbb"))))
                          `(diff-removed ((t (:foreground "#fb4934" :background "#3c3836"))))
                          `(diff-header ((t (:foreground "#8ec07c" :background nil))))
                          `(diff-file-header ((t (:foreground "#83a598" :background nil))))
                          `(diff-hunk-header ((t (:foreground "#d3869b"))))
                          `(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
                          `(diff-refine-changed ((t (:inherit diff-changed :inverse-video t))))
                          `(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))
                          `(dired-directory ((t (:foreground "#8ec07c"))))
                          `(dired-ignored ((t (:foreground "#928374"))))
                          `(dired-flagged ((t (:foreground "#fb4934"))))
                          `(dired-header ((t (:foreground "#8ec07c"))))
                          `(dired-mark ((t (:foreground "#fe8019" :weight bold))))
                          `(dired-marked ((t (:foreground "#fabd2f"))))
                          `(dired-perm-write ((t (:foreground "#ebdbb2" :underline t))))
                          `(dired-symlink ((t (:foreground "#8ec07c"))))
                          `(dired-warning ((t (:foreground "#fabd2f"))))
                          `(doom-modeline-bar-inactive ((t (:background nil))))
                          `(evil-ex-info ((t (:foreground "#fb4934" :slant italic))))
                          `(evil-ex-search ((t (:background "#fabd2f" :foreground "#0d1011"
                                                :weight bold))))
                          `(evil-ex-substitute-matches ((t (:background "#0d1011" :foreground "#fb4934"
                                                            :weight bold
                                                            :strike-through t))))
                          `(evil-ex-substitute-replacement ((t (:foreground "#8ec07c" :strike-through nil
                                                                :inherit evil-ex-substitute-matches))))
                          `(evil-snipe-first-match-face ((t (:foreground "white" :background "#fabd2f"))))
                          `(evil-snipe-matches-face ((t (:foreground "#fabd2f" :bold t
                                                         :underline t))))
                          `(evil-goggles-default-face ((t (:inherit region :background "#3c3836"))))
                          `(flycheck-error ((t (:underline (:style wave :color "#fb4934")
                                                :background "#3c3836"))))
                          `(flycheck-warning ((t (:underline (:style wave :color "#fabd2f")
                                                  :background "#3c3836"))))
                          `(flycheck-info ((t (:underline (:style wave :color "#83a598")
                                               :background "#3c3836"))))
                          `(flycheck-fringe-error ((t (:inherit fringe :foreground "#fb4934"))))
                          `(flycheck-fringe-warning ((t (:inherit fringe :foreground "#fabd2f"))))
                          `(flycheck-fringe-info ((t (:inherit fringe :foreground "#b8bb26"))))
                          `(flyspell-incorrect ((t (:underline (:style wave :color "#fb4934")
                                                    :inherit unspecified))))
                          `(flyspell-duplicate ((t (:underline (:style wave :color "#fabd2f")
                                                    :inherit unspecified))))
                          `(git-commit-summary ((t (:foreground "#b8bb26"))))
                          `(git-commit-overlong-summary ((t (:inherit error :background "#0d1011"
                                                             :slant italic
                                                             :weight bold))))
                          `(git-commit-nonempty-second-line ((t (:inherit git-commit-overlong-summary))))
                          `(git-commit-keyword ((t (:foreground "#8ec07c" :slant italic))))
                          `(git-commit-pseudo-header ((t (:foreground "#dfd2b8" :slant italic))))
                          `(git-commit-known-pseudo-header ((t (:foreground "#dfd2b8" :weight bold
                                                                :slant italic))))
                          `(git-commit-comment-branch-local ((t (:foreground "#cc241d"))))
                          `(git-commit-comment-branch-remote ((t (:foreground "#b8bb26"))))
                          `(git-commit-comment-detached ((t (:foreground "#fe8019"))))
                          `(git-commit-comment-heading ((t (:foreground "#fb4934"))))
                          `(git-commit-comment-file ((t (:foreground "#d3869b"))))
                          `(git-commit-comment-action ((t (:inherit (bold)))))
                          `(highlight-numbers-number ((t (:inherit bold :foreground "#fee659"))))
                          `(highlight-quoted-symbol ((t (:foreground "#689d6a"))))
                          `(highlight-quoted-quote ((t (:foreground "#ebdbb2"))))
                          `(hl-line ((t (:background "#3c3836"))))
                          `(hl-todo ((t (:foreground "#fb4934" :weight bold))))
                          `(isearch ((t (:foreground "#0d1011" :background "#fe8019"))))
                          `(isearch-fail ((t (:background "#fb4934" :foreground "#0d1011"
                                              :weight bold))))
                          ;;`(ivy-current-match ((t (:background "#2c1802"))))
                          `(ivy-current-match ((t (:background ,selection-highlight-background-1 :foreground ,selection-highlight-foreground-1))))
                          `(ivy-minibuffer-match-face-1 ((t (:background nil :foreground "#fabd2f"))))
                          `(ivy-minibuffer-match-face-2 ((t (:background nil :foreground "#fabd2f"))))
                          `(ivy-minibuffer-match-face-3 ((t (:inherit ivy-minibuffer-match-face-2 :foreground "#b8bb26"
                                                             :weight semi-bold))))
                          `(ivy-minibuffer-match-face-4 ((t (:inherit ivy-minibuffer-match-face-2 :foreground "#fabd2f"
                                                             :weight semi-bold))))
                          `(ivy-minibuffer-match-highlight ((t (:foreground "#8ec07c"))))
                          ;;`(ivy-minibuffer-match-highlight ((t (:background ,selection-highlight-background-2 :foreground ,selection-highlight-foreground-1))))
                          `(ivy-highlight-face ((t (:foreground "#d3869b"))))
                          `(ivy-confirm-face ((t (:foreground "#b8bb26"))))
                          `(ivy-match-required-face ((t (:foreground "#fb4934"))))
                          `(ivy-virtual ((t (:inherit italic :foreground "#dfd2b8"))))
                          `(ivy-modified-buffer ((t (:inherit bold :foreground "#fabd2f"))))
                          `(magit-bisect-bad ((t (:foreground "#fb4934"))))
                          `(magit-bisect-good ((t (:foreground "#b8bb26"))))
                          `(magit-bisect-skip ((t (:foreground "#fe8019"))))
                          `(magit-blame-hash ((t (:foreground "#8ec07c"))))
                          `(magit-blame-date ((t (:foreground "#fb4934"))))
                          `(magit-blame-heading ((t (:foreground "#fe8019" :background "#3c3836"
                                                     :extend t))))
                          `(magit-branch-current ((t (:underline "#b8bb26" :inherit magit-branch-local))))
                          `(magit-branch-local ((t (:foreground "#8ec07c"))))
                          `(magit-branch-remote ((t (:foreground "#b8bb26"))))
                          `(magit-cherry-equivalent ((t (:foreground "#d3869b"))))
                          `(magit-cherry-unmatched ((t (:foreground "#8ec07c"))))
                          `(magit-diff-added ((t (:foreground "#7c7e19" :background "#333327"
                                                  :extend t))))
                          `(magit-diff-added-highlight ((t (:foreground "#9c9e20" :background "#3f3f26"
                                                            :weight bold
                                                            :extend t))))
                          `(magit-diff-base ((t (:foreground "#cb6614" :background "#3d3026"
                                                 :extend t))))
                          `(magit-diff-base-highlight ((t (:foreground "#fe8019" :background "#523924"
                                                           :weight bold
                                                           :extend t))))
                          `(magit-diff-context ((t (:foreground "#3c3836" :foreground "#d5c4a1"))))
                          `(magit-diff-context-highlight ((t (:foreground "#ebdbb2" :background "#1d2021"
                                                              :extend t))))
                          `(magit-diff-file-heading ((t (:foreground "#ebdbb2" :weight bold
                                                         :extend t))))
                          `(magit-diff-file-heading-selection ((t (:foreground "#cc241d" :background "#458588"
                                                                   :weight bold
                                                                   :extend t))))
                          `(magit-diff-hunk-heading ((t (:background "#3c3836" :foreground "#d5c4a1"))))
                          `(magit-diff-hunk-heading-highlight ((t (:background "#2c1802" :foreground "#ebdbb2"))))
                          `(magit-diff-lines-heading ((t (:foreground "#fabd2f" :background "#fb4934"
                                                          :extend t
                                                          :extend t))))
                          `(magit-diff-removed ((t (:foreground "#aa3123" :background "#4b3834"
                                                    :extend t))))
                          `(magit-diff-removed-highlight ((t (:foreground "#d53e2c" :background "#5a3934"
                                                              :weight bold
                                                              :extend t))))
                          `(magit-diffstat-added ((t (:foreground "#9c9e20"))))
                          `(magit-diffstat-removed ((t (:foreground "#d53e2c"))))
                          `(magit-dimmed ((t (:foreground "#928374"))))
                          `(magit-hash ((t (:foreground "#928374"))))
                          `(magit-header-line ((t (:background "#458588"
                                                   :foreground "#fbf1c7"
                                                   :weight bold
                                                   :box (:line-width 3 :color "#458588")))))
                          `(magit-filename ((t (:foreground "#d3869b"))))
                          `(magit-log-author ((t (:foreground "#fe8019"))))
                          `(magit-log-date ((t (:foreground "#83a598"))))
                          `(magit-log-graph ((t (:foreground "#928374"))))
                          `(magit-process-ng ((t (:inherit error))))
                          `(magit-process-ok ((t (:inherit success))))
                          `(magit-reflog-amend ((t (:foreground "#cc241d"))))
                          `(magit-reflog-checkout ((t (:foreground "#83a598"))))
                          `(magit-reflog-cherry-pick ((t (:foreground "#b8bb26"))))
                          `(magit-reflog-commit ((t (:foreground "#b8bb26"))))
                          `(magit-reflog-merge ((t (:foreground "#b8bb26"))))
                          `(magit-reflog-other ((t (:foreground "#8ec07c"))))
                          `(magit-reflog-rebase ((t (:foreground "#cc241d"))))
                          `(magit-reflog-remote ((t (:foreground "#8ec07c"))))
                          `(magit-reflog-reset ((t (:inherit error))))
                          `(magit-refname ((t (:foreground "#928374"))))
                          `(magit-section-heading ((t (:foreground "#8ec07c" :weight bold))))
                          `(magit-section-heading-selection ((t (:foreground "#fe8019" :weight bold
                                                                 :extend t))))
                          `(magit-section-highlight ((t (:inherit hl-line))))
                          `(magit-section-secondary-heading ((t (:foreground "#d3869b" :weight bold
                                                                 :extend t))))
                          `(magit-sequence-drop ((t (:foreground "#fb4934"))))
                          `(magit-sequence-head ((t (:foreground "#83a598"))))
                          `(magit-sequence-part ((t (:foreground "#fe8019"))))
                          `(magit-sequence-stop ((t (:foreground "#b8bb26"))))
                          `(magit-signature-bad ((t (:inherit error))))
                          `(magit-signature-error ((t (:inherit error))))
                          `(magit-signature-expired ((t (:foreground "#fe8019"))))
                          `(magit-signature-good ((t (:inherit success))))
                          `(magit-signature-revoked ((t (:foreground "#cc241d"))))
                          `(magit-signature-untrusted ((t (:foreground "#fabd2f"))))
                          `(magit-tag ((t (:foreground "#fabd2f"))))
                          `(message-header-name ((t (:foreground "#b8bb26"))))
                          `(message-header-subject ((t (:foreground "#fabd2f" :weight bold))))
                          `(message-header-to ((t (:foreground "#fabd2f" :weight bold))))
                          `(message-header-cc ((t (:inherit message-header-to :foreground "#d4a027"))))
                          `(message-header-other ((t (:foreground "#d3869b"))))
                          `(message-header-newsgroups ((t (:foreground "#fabd2f"))))
                          `(message-header-xheader ((t (:foreground "#dfd2b8"))))
                          `(message-separator ((t (:foreground "#928374"))))
                          `(message-mml ((t (:foreground "#928374" :slant italic))))
                          `(message-cited-text-1 ((t (:foreground "#cc241d"))))
                          `(org-archived ((t (:foreground "#dfd2b8"))))
                          `(org-block ((t (:background "#3c3836" :extend t))))
                          `(org-block-begin-line ((t (:inherit org-block :foreground "#928374"))))
                          `(org-block-end-line ((t (:inherit org-block-begin-line))))
                          `(org-checkbox ((t (:inherit org-todo))))
                          `(org-checkbox-statistics-done ((t (:inherit org-done))))
                          `(org-checkbox-statistics-todo ((t (:inherit org-todo))))
                          `(org-code ((t (:foreground "#fe8019"))))
                          `(org-date ((t (:foreground "#b8bb26"))))
                          `(org-default ((t (:inherit variable-pitch))))
                          `(org-document-info ((t (:foreground "#fb4934"))))
                          `(org-document-title ((t (:foreground "#fb4934"))))
                          `(org-done ((t (:inherit org-headline-done :bold inherit))))
                          `(org-ellipsis ((t (:underline nil :foreground "#fe8019"))))
                          `(org-footnote ((t (:foreground "#fe8019"))))
                          `(org-formula ((t (:foreground "#b8bb26"))))
                          `(org-headline-done ((t (:foreground "#7c6f64"))))
                          `(org-hide ((t (:foreground "#282828"))))
                          `(org-latex-and-related ((t (:foreground "#fbf1c7" :weight bold))))
                          `(org-list-dt ((t (:foreground "#8ec07c"))))
                          `(org-meta-line ((t (:foreground "#928374"))))
                          `(org-priority ((t (:foreground "#fb4934"))))
                          `(org-property-value ((t (:foreground "#dfd2b8"))))
                          `(org-quote ((t (:background "#323232" :slant italic
                                           :extend t
                                           :inherit italic
                                           :foreground "#d5c4a1"))))
                          `(org-special-keyword ((t (:foreground "#dfd2b8"))))
                          `(org-table ((t (:foreground "#8ec07c"))))
                          `(org-tag ((t (:foreground "#7c6f62" :weight normal))))
                          `(org-todo ((t (:foreground "#b8bb26" :bold inherit))))
                          `(org-verbatim ((t (:foreground "#fabd2f"))))
                          `(org-warning ((t (:foreground "#fabd2f"))))
                          `(org-agenda-done ((t (:inherit org-done))))
                          `(org-agenda-dimmed-todo-face ((t (:foreground "#928374"))))
                          `(org-agenda-date ((t (:foreground "#d3869b" :weight ultra-bold))))
                          `(org-agenda-date-today ((t (:foreground "#e4b6c3" :weight ultra-bold))))
                          `(org-agenda-date-weekend ((t (:foreground "#7e505d" :weight ultra-bold))))
                          `(org-agenda-structure ((t (:foreground "#ebdbb2" :weight ultra-bold))))
                          `(org-agenda-clocking ((t (:background "#3a413e"))))
                          `(org-upcoming-deadline ((t (:foreground "#c4b796"))))
                          `(org-upcoming-distant-deadline ((t (:foreground "#89816d"))))
                          `(org-scheduled ((t (:foreground "#ebdbb2"))))
                          `(org-scheduled-today ((t (:foreground "#d5c4a1"))))
                          `(org-scheduled-previously ((t (:foreground "#fbf1c7"))))
                          `(org-time-grid ((t (:foreground "#928374"))))
                          `(org-sexp-date ((t (:foreground "#ebdbb2"))))
                          `(outline-1 ((t (:foreground "#d3869b" :weight bold
                                           :extend t))))
                          `(outline-2 ((t (:foreground "#8ec07c" :weight bold
                                           :extend t))))
                          `(outline-3 ((t (:foreground "#b8bb26" :weight bold
                                           :extend t))))
                          `(outline-4 ((t (:foreground "#db9eaf" :weight bold
                                           :extend t))))
                          `(outline-5 ((t (:foreground "#8db58f" :weight bold
                                           :extend t))))
                          `(outline-6 ((t (:foreground "#e4b6c3" :weight bold
                                           :extend t))))
                          `(outline-7 ((t (:foreground "#b3ceb4" :weight bold
                                           :extend t))))
                          `(outline-8 ((t (:foreground "#edced7" :weight bold
                                           :extend t))))
                          `(persp-face-lighter-default ((t (:foreground "#fabd2f" :weight bold))))
                          `(persp-face-lighter-buffer-not-in-persp ((t (:foreground "#dfd2b8"))))
                          `(persp-face-lighter-nil-persp ((t (:foreground "#928374"))))
                          `(popup-face ((t (:inherit tooltip))))
                          `(popup-tip-face ((t (:inherit popup-face :foreground "#d3869b"
                                                :background "#0d1011"))))
                          `(rainbow-delimiters-depth-1-face ((t (:foreground "#fe8019"))))
                          `(rainbow-delimiters-depth-2-face ((t (:foreground "#fb4934"))))
                          `(rainbow-delimiters-depth-3-face ((t (:foreground "#cc241d"))))
                          `(rainbow-delimiters-depth-4-face ((t (:foreground "#83a598"))))
                          `(rainbow-delimiters-depth-5-face ((t (:foreground "#8ec07c"))))
                          `(rainbow-delimiters-depth-6-face ((t (:foreground "#83a598"))))
                          `(rainbow-delimiters-depth-7-face ((t (:foreground "#cc241d"))))
                          `(rainbow-delimiters-depth-8-face ((t (:foreground "#b8bb26"))))
                          `(rainbow-delimiters-depth-9-face ((t (:foreground "#d3869b"))))
                          `(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "#fb4934"))))
                          `(rainbow-delimiters-base-face ((t (:inherit default))))
                          `(rainbow-delimiters-unmatched-face ((t (:foreground "#fb4934" :weight bold
                                                                   :inverse-video t))))
                          `(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
                          `(reb-match-0 ((t (:foreground "#fe8019" :inverse-video t))))
                          `(reb-match-1 ((t (:foreground "#cc241d" :inverse-video t))))
                          `(reb-match-2 ((t (:foreground "#b8bb26" :inverse-video t))))
                          `(reb-match-3 ((t (:foreground "#fabd2f" :inverse-video t))))
                          `(sp-pair-overlay-face ((t (:background "#2c1802"))))
                          `(smerge-lower ((t (:background "#444527"))))
                          `(smerge-upper ((t (:background "#623b35"))))
                          `(smerge-base ((t (:background "#3a413e"))))
                          `(smerge-markers ((t (:background "#928374" :foreground "#282828"
                                                :distant-foreground "#ebdbb2"
                                                :weight bold))))
                          `(smerge-refined-added ((t (:inherit diff-added :inverse-video t))))
                          `(smerge-refined-removed ((t (:inherit diff-removed :inverse-video t))))
                          `(solaire-default-face ((t (:inherit default :background "#1d2021"))))
                          `(solaire-hl-line-face ((t (:inherit hl-line :background "#282828"
                                                      :extend t))))
                          `(swiper-line-face ((t (:background "#2c1802"))))
                          `(swiper-match-face-1 ((t (:inherit unspecified :background "#0d1011"
                                                     :foreground "#7c6f64"))))
                          `(swiper-match-face-2 ((t (:inherit unspecified :background "#fe8019"
                                                     :foreground "#0d1011"
                                                     :weight bold))))
                          `(swiper-match-face-3 ((t (:inherit unspecified :background "#cc241d"
                                                     :foreground "#0d1011"
                                                     :weight bold))))
                          `(swiper-match-face-4 ((t (:inherit unspecified :background "#b8bb26"
                                                     :foreground "#0d1011"
                                                     :weight bold))))
                          `(which-func ((t (:foreground "#8ec07c"))))
                          `(which-key-key-face ((t (:foreground "#b8bb26"))))
                          `(which-key-group-description-face ((t (:foreground "#dfd2b8"))))
                          `(which-key-command-description-face ((t (:foreground "#ebdbb2"))))
                          `(which-key-local-map-description-face ((t (:foreground "#8ec07c"))))
                          `(whitespace-empty ((t (:background "#3c3836"))))
                          `(whitespace-space ((t (:foreground "#665c54"))))
                          `(whitespace-newline ((t (:foreground "#665c54"))))
                          `(whitespace-tab ((t (:foreground "#665c54" :background "#3c3836"))))
                          `(whitespace-indentation ((t (:foreground "#665c54" :background nil))))
                          `(whitespace-trailing ((t (:inherit trailing-whitespace))))
                          `(whitespace-line ((t (:background "#0d1011" :foreground "#fb4934"
                                                 :weight bold))))
                          `(widget-button-pressed ((t (:foreground "#fb4934"))))
                          `(widget-documentation ((t (:foreground "#b8bb26"))))
                          `(widget-single-line-field ((t (:background "#3c3836" :distant-foreground "#282828"))))
                          `(widget-field ((t (:background "#3c3836"
                                              :distant-foreground "#282828"
                                              :box (:line-width -1 :color "#928374"):extend
                                              t))))
                          `(window-divider ((t (:inherit vertical-border))))
                          `(window-divider-first-pixel ((t (:inherit window-divider))))
                          `(window-divider-last-pixel ((t (:inherit window-divider))))
                          `(yas-field-highlight-face ((t (:inherit match))))
                          `(button ((t (:foreground "#8ec07c" :underline t
                                        :weight bold))))
                          `(+workspace-tab-selected-face ((t (:background "#98971a" :foreground "white"))))
                          `(doom-modeline-project-dir ((t (:bold t :foreground "#8ec07c"))))
                          `(doom-modeline-buffer-path ((t (:inherit bold :foreground "#b8bb26"))))
                          `(doom-modeline-buffer-file ((t (:inherit bold :foreground "#ebdbb2"))))
                          `(doom-modeline-buffer-modified ((t (:inherit bold :foreground "#fabd2f"))))
                          `(doom-modeline-buffer-major-mode ((t (:foreground "#b8bb26" :bold t))))
                          `(doom-modeline-info ((t (:bold t :foreground "#8ec07c"))))
                          `(doom-modeline-bar ((t (:background "#98971a")))) ;; The text descriptions on the menu
                          `(doom-modeline-panel ((t (:background "#98971a" :foreground "#ebdbb2")))) ;; The key combos on the right
                          `(doom-dashboard-menu-title ((t (:foreground "#cb6614"))))
                          `(doom-dashboard-menu-desc ((t (:foreground "#d4a027"))))
                          `(ivy-subdir ((t (:background nil :foreground "#8ec07c"))))
                          `(ivy-action ((t (:background nil :foreground "#8ec07c"))))
                          `(ivy-grep-line-number ((t (:background nil :foreground "#8ec07c"))))
                          `(counsel-key-binding ((t (:foreground "#8ec07c"))))
                          `(org-drawer ((t (:foreground "#bbd9b0"))))
                          `(tab-bar ((t (:background "#1d2021" :foreground "#1d2021"
                                         :box nil))))
                          `(tab-bar-tab ((t (:background "#282828" :foreground "#ebdbb2"
                                             :box nil))))
                          `(tab-bar-tab-inactive ((t (:inherit tab-line-tab :background "#1d2021"
                                                      :foreground "#d5c4a1"
                                                      :box nil))))
                          `(show-paren-match ((t (:foreground nil :background "#7c6f64"
                                                  :bold t))))
                          `(show-paren-mismatch ((t (:foreground nil :background "red"))))
                          `(sp-show-pair-match-face ((t (:foreground nil :background "#7c6f64"
                                                         :bold t))))
                          `(sp-show-pair-mismatch-face ((t (:foreground nil :background "red"))))
                          `(solaire-mode-line-face ((t (:background "#2c1802" :foreground "#dfd2b8"
                                                        :box nil))))
                          `(solaire-mode-line-inactive-face ((t (:background "#443e3a" :foreground "#928374"
                                                                 :box nil))))
                          `(xref-file-header ((t (:inherit success))))
                          `(xref-line-number ((t (:foreground "#fabd2f"))))
                          `(xref-match ((t (:foreground "#b8bb26" :background "#0d1011"
                                            :weight bold))))
                          `(default ((t (:background ,dark-background-1 :foreground "#ebdbb2"))))))

(provide-theme 'beakstar-dusk)
