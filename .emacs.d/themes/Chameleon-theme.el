(deftheme Chameleon
  "Chameleon Theme By pedrocb")
;; HUE = 36.83
;; ColorScheme = Shrek

  (custom-theme-set-variables
   'Chameleon
   '(fringe-mode '(0 . 0))
   '(linum-format " %d ")
   '(beacon-color "#f9c168")
   )

  (custom-theme-set-faces
   'Chameleon

   '(default
      ((t (:foreground "#ffffff" :background "#1e1e1e" ))))

   ;'(fixed-pitch
     ;((t (:family "Monospace"))))

   ;'(variable-pitch
     ;((t (:family "Sans Serif"))))

   '(escape-glyph ;; Things like  and other control chars.
     ((t (:foreground "#68a0f9" :background "#1e1e1e"))))

   ;; Line Numbers (linum-mode)
   '(linum
     ((t (:background "#1e1e1e" :foreground "#f9c168" :box nil :height 100))))

   '(line-number-current-line
     ((t (:foreground "#f9c168")))); Margin Fringes
   '(line-number
     ((t (:background "#1e1e1e"))))

   ;; Mode-line / status line
   '(mode-line
     ((t (:background "#f9c168" :box nil :foreground "#333333" :height 100))))

   '(mode-line-inactive
     ((t (:weight light :box nil :background "#504330" :foreground "#000000" :inherit (mode-line)))))
   '(mode-line-emphasis
     ((t (:weight bold))))

   '(mode-line-highlight
     ((t (:box nil (t (:inherit (highlight)))))))

   '(mode-line-buffer-id
     ((t (:weight bold :box nil))))

   ;; Cursor
   '(cursor
     ((t (:foreground "#ffffff" :background "#f9c168"))))

   '(vertical-border
     ((t (:foreground "#f9c168" :background "#f9c168"))))



   ;; Minibuffer
   '(minibuffer-prompt
     ((t (:weight bold :foreground "#b87100"))))

   '(minibuffer-message
     ((t (:foreground "#ffffff"))))

   ;; Region
   '(region
     ((t (:background "#433d32" :foreground "#ffffff"))))

   ;; Secondary region
   '(secondary-selection
     ((((class color) (min-colors 88) (background dark)) (:background "#323943"))))


   ;; font-lock - syntax
   '(font-lock-builtin-face              ((t (:foreground "#855e5f"))))
   '(font-lock-comment-face              ((t (:foreground "#555555"))))
   '(font-lock-comment-delimiter-face    ((t (:foreground "#555555" ))))
   '(font-lock-doc-face                  ((t (:inherit (font-lock-string-face)))))
   '(font-lock-function-name-face        ((t (:foreground "#f2efeb"))))
   '(font-lock-keyword-face              ((t (:foreground "#bf9b9c"))))
   '(font-lock-negation-char-face        ((t nil)))
   '(font-lock-preprocessor-face         ((t (:inherit (font-lock-builtin-face)))))
   '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   '(font-lock-string-face               ((t (:foreground "#e9af11"))))
   '(font-lock-constant-face             ((t (:foreground "#855e5f"))))
   '(font-lock-type-face                 ((t (:foreground "#dead62"))))
   '(font-lock-variable-name-face        ((t (:inherit (default)))))
   '(font-lock-warning-face              ((t (:weight bold :foreground "#FF0000"))))

   ;; Hightlight
   '(highlight
     ((((class color) (min-colors 88) (background light))
       (:background "#533300"))
      (((class color)
        (min-colors 88)
        (background dark))
       (:background "#503100"))
      (((class color) (min-colors 16)
        (background light))
       (:background "#503100"))
      (((class color)
        (min-colors 16)
        (background dark))
       (:background "#603b00"))
      (((class color)
        (min-colors 8))
       (:foreground "#000000" :background "#00FF00"))
      (t (:inverse-video t))))

   '(shadow
     ((((class color grayscale)
        (min-colors 88)
        (background light))
       (:foreground "#999999"))
      (((class color grayscale)
        (min-colors 88)
        (background dark))
       (:foreground "#999999"))
      (((class color)
        (min-colors 8)
        (background light))
       (:foreground "#00ff00"))
      (((class color)
        (min-colors 8)
        (background dark))
       (:foreground "#ffff00"))))

   '(trailing-whitespace
     ((((class color)
        (background light))
       (:background "#ff0000"))
      (((class color)
        (background dark))
       (:background "#ff0000")) (t (:inverse-video t))))


   '(link ((((class color) (min-colors 88)
       (background light)) (:underline t :foreground "#f09300")) (((class color)
       (background light)) (:underline t :foreground "#ff9d00")) (((class color) (min-colors 88)
       (background dark))  (:underline t :foreground "#aa6800")) (((class color)
       (background dark))  (:underline t :foreground "#aa6800")) (t (:inherit (underline)))))

   '(link-visited ((default (:inherit (link))) (((class color)
       (background light)) (:inherit (link))) (((class color)
       (background dark)) (:inherit (link)))))

   '(button ((t (:inherit (link)))))

   '(header-line ((default (:inherit (mode-line))) (((type tty)) (:underline t :inverse-video nil))
       (((class color grayscale)
         (background light)) (:box nil :foreground "#222222" :background "#bbbbbb"))
       (((class color grayscale)
         (background dark)) (:box nil :foreground "#bbbbbb" :background "#222222"))
       (((class mono)
         (background light)) (:underline t :box nil :inverse-video nil :foreground "#000000" :background "#ffffff"))
       (((class mono)
         (background dark)) (:underline t :box nil :inverse-video nil :foreground "#ffffff" :background "#000000"))))

   '(tooltip ((default nil) (nil nil)))

   '(isearch
     ((((class color) (min-colors 88)
        (background light)) (:foreground "#eecd99" :background "#444444"))
      (((class color) (min-colors 88)
        (background dark)) (:foreground "#eecd99" :background "##444444"))
      (((class color) (min-colors 16)) (:foreground "#0088cc" :background "#444444"))
      (((class color) (min-colors 8)) (:foreground "#0088cc" :background "#444444")) (t (:inverse-video t))))

   '(isearch-fail
     ((((class color)
        (min-colors 88)
        (background light))
       (:background "#ffaaaa"))
      (((class color)
        (min-colors 88)
        (background dark))
       (:background "#880000"))
      (((class color)
        (min-colors 16))
       (:background "#FF0000"))
      (((class color)
        (min-colors 8))
       (:background "#FF0000"))
      (((class color grayscale))
       (:foreground "#888888")) (t (:inverse-video t))))

   '(lazy-highlight
     ((((class color)
        (min-colors 88)
        (background light))
       (:background "#ddb677"))
      (((class color)
        (min-colors 88)
        (background dark))
       (:background "#779fdd"))
      (((class color)
        (min-colors 16))
       (:background "#4499ee"))
      (((class color)
        (min-colors 8))
       (:background "#4499ee")) (t (:underline t))))

   '(match
     ((((class color)
        (min-colors 88)
        (background light))
       (:background "#cc9133"))
      (((class color)
        (min-colors 88)
        (background dark))
       (:background "#cc9133"))
      (((class color)
        (min-colors 8)
        (background light))
       (:foreground "#000000" :background "#FFFF00"))
      (((class color)
        (min-colors 8)
        (background dark))
       (:foreground "#ffffff" :background "#0000FF")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "#888888"))))

   '(next-error
     ((t (:inherit (region)))))

   '(query-replace
     ((t (:inherit (isearch)))))
   '(show-paren-match ((t (:background "#cc9133"))))
   '(telephone-line-evil-insert ((t (:inherit telephone-line-evil :foreground "#333333" :background "#f9c168"))))
   '(telephone-line-evil-motion ((t (:inherit telephone-line-evil :foreground "#333333" :background "#bfbfbf"))))
   '(telephone-line-evil-normal ((t (:inherit telephone-line-evil :foreground "#333333" :background "#bfbfbf"))))
   '(telephone-line-evil-operator ((t (:inherit telephone-line-evil :foreground "#333333" :background "#68a0f9"))))
   '(telephone-line-evil-visual ((t (:inherit telephone-line-evil :foreground "#333333" :background "#ff9c00"))))

   )

(provide-theme 'Chameleon)
