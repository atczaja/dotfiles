;; nyx-theme

;; Based on yupferris' pastel-tron-theme 
;; https://github.com/yupferris/dotfiles/blob/master/emacs/pastel-tron-theme/pastel-tron-theme.el
;; and vim jellyeabns theme

(deftheme nyx
  "Soft but vibrant colors. Recommend changing Faces->Basic->Default->foreground to whites moke")

(let ((background "#0f0f0f")
      (selection "#0f0f0f")
      (region "#303030")
      (foreground "#e0e0e0")
      (comment "#686868")
      (cursor "#949494")
      (gray "#212121") (gray-2 "#1c1c1c") (gray-3 "#121212")
                       (gray-4 "#080808")
      (red "#e35152") (red-2 "#ff3333") (red-3 "#ff34000")
      (yellow "#fff1b9") (yellow-2 "#cdcd00")
      (orange "#e78700")
      (green "#7ccd8c")
      (aqua "#33bab9")
      (blue "#7eb6ff")
      (purple "#dda0ff"))

  (custom-theme-set-faces
   'nyx

   ;; Basics
   `(default ((t (:background ,background :foreground ,foreground))))
   `(region ((t (:background ,region))))
   `(fringe ((t (:background ,background))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(hl-line ((t (:background ,gray-3))))

   ;; Font-lock stuff
   `(font-lock-builtin-face ((t (:foreground ,blue))))
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-constant-face ((t (:foreground ,red))))
   `(font-lock-doc-face ((t (:foreground ,comment))))
   `(font-lock-doc-string-face ((t (:foreground ,comment))))
   `(font-lock-function-name-face ((t (:foreground ,aqua))))
   `(font-lock-keyword-face ((t (:foreground ,blue))))
   `(font-lock-negation-char-face ((t (:foreground ,aqua))))
   `(font-lock-preprocessor-face ((t (:foreground ,red))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,purple))))
   `(font-lock-warning-face ((t (:foreground ,red))))

   ;; UI related
   `(mode-line ((t (:background ,blue :foreground ,gray))))
   `(mode-line-inactive ((t (:background ,gray :foreground ,red))))
   `(vertical-border ((t (:background ,background :foreground ,selection))))

   ;; Linum
   `(linum ((t (:background ,background :foreground ,gray))))

   ;; show-paren-mode
   `(show-paren-match ((t (:background ,green :foreground ,gray-2))))
   `(show-paren-mismatch ((t (:background ,orange :foreground ,gray-2))))

   ;; ido
   `(ido-only-match ((t (:foreground ,orange))))
   `(ido-subdir ((t (:foreground ,purple))))

   ;; whitespace-mode
   `(whitespace-empty ((t (:background ,yellow-2 :foreground ,red))))
   `(whitespace-hspace ((t (:foreground ,gray-2))))
   `(whitespace-indentation ((t (:foreground ,gray-2))))
   `(whitespace-line ((t (:background ,gray-2))))
   `(whitespace-newline ((t (:foreground ,gray-2))))
   `(whitespace-space ((t (:foreground ,gray-2))))
   `(whitespace-space-after-tab ((t (:foreground ,gray-2))))
   `(whitespace-tab ((t (:foreground ,gray-2))))
   `(whitespace-trailing ((t (:background ,red-3 :foreground ,yellow))))

   ;; magit
   `(magit-diff-add ((t (:foreground ,green))))
   `(magit-diff-del ((t (:foreground ,red))))
   `(magit-item-highlight ((t (:background ,gray-2))))

   ;; highlight-indentation-mode
   `(highlight-indentation-face ((t (:background ,gray-4))))
   `(highlight-indentation-current-column-face ((t (:background ,gray-3))))

   ;; org-mode
   `(org-date ((t (:foreground ,purple))))
   `(org-done ((t (:foreground ,green))))
   `(org-hide ((t (:foreground ,gray-2))))
   `(org-link ((t (:foreground ,blue))))
   `(org-todo ((t (:foreground ,red))))

   ;; company
   `(company-tooltip ((t (:background "#404040" :foreground "#f0f0f0"))))
   `(company-scrollbar-bg ((t (:background "#707070"))))
   `(company-scrollbar-fg ((t (:background "#c0c0c0"))))
   `(company-tooltip-selection ((t (:background "#707070" :foreground ,blue))))
   `(company-tooltip-common ((t (:foreground ,green))))
   `(company-tooltip-annotation ((t (:foreground ,purple))))
   )

  (custom-theme-set-variables
   'nyx

   ;; Fill Column Indicator mode
   `(fci-rule-color ,gray-2)
   `(fci-rule-character-color ,gray-2)

   `(ansi-color-names-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])))

(provide-theme 'nyx)
