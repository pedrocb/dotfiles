;; Packages
(require 'package)

;; Add package repositories
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/") t)
(package-initialize)
(setq package-check-signature nil)

(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Ensure all the packages are downloaded
(use-package use-package-ensure
  :config
  (setq use-package-always-ensure t))

;; Add local packages folder to load path
(add-to-list 'load-path "~/.emacs.d/packages/")

;; Load secrets
(let ((secret.el (expand-file-name ".secret.el" user-emacs-directory)))
  (when (file-exists-p secret.el)
    (load secret.el)))

;; Add themes path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Theme
;(load-theme 'ample-flat t)
(load-theme 'Chameleon t)

(load-file "~/.emacs.d/init-org.el")
(load-file "~/.emacs.d/init-evil.el")

;; Personal information
(setq user-full-name "Pedro Belém"
      user-mail-address "pbelem1995@gmail.com")

;; Tab width
(setq tab-width 4)

;; Undo limits
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

;; Remove bell
(setq ring-bell-function 'ignore)

;; Disables bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Double brackets
(electric-pair-mode 1)

;; Replace active region
(delete-selection-mode 1) ; Replace active region

;; Highlights matching paren pair
(show-paren-mode 1)

;; Helm
(use-package helm
  :diminish helm-mode
  :init
  (progn
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)
    (helm-mode)
    )
  :config
  ; rebind tab to do persistent action
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

  ; C-<vim motion key> to navigate helm
  (define-key helm-find-files-map (kbd "C-h") 'helm-find-files-up-one-level)
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  (define-key helm-find-files-map (kbd "C-l") 'helm-execute-persistent-action)
  (use-package helm-swoop)

  (use-package helm-descbinds
    :defer t
    )
  :bind (("M-x" . helm-M-x))
  )

;; History
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; Font
(set-default-font "-*-gohufont-*-*-*--*-*-*-*-*-*-*-*")


;; Backup directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; default apps
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

;; Change yes or no message
(fset 'yes-or-no-p 'y-or-n-p)

;; Disable splash screen
(setq inhibit-splash-screen t)

;; Esc quits minibuffer
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)


;; Deletes useless whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keep track of recent open files
(use-package recentf
  :config
  (setq recentf-max-saved-items 200
	recentf-max-menu-items 15)
  (recentf-mode))

;; Auto-Complete
(use-package company
  :diminish company-mode
  :config
  (global-company-mode t)
  )

;; Colorize color names
(use-package rainbow-mode
  :hook prog-mode)

;; Highlight current line number
(use-package linum-highlight-current-line-number
  :load-path "~/.emacs.d/packages/linum-highlight-current-line-number.el"
  :hook (prog-mode . display-line-numbers-mode)
  :config (setq linum-format 'linum-highlight-current-line-number))

;; Line number format
(setq linum-format " %d ")

;; Temporary buffers as popup windows
(use-package popwin
  :config
  (popwin-mode 1))

;; Update buffer if it was changed elsewhere
(global-auto-revert-mode t)

;; Light that blinks on cursor when buffer is scrolled
(use-package beacon
  :config
  (setq
   beacon-blink-delay 0.1
   beacon-blink-duration 0.1
   beacon-blink-when-focused t
   beacon-dont-blink-commands nil
   beacon-size 40
   )
  (beacon-mode 1)
  )

;; Show available keybinds in popup
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-add-key-based-replacements
    "SPC o" "org mode")
  )

;; Line Mode
(use-package telephone-line
  :config
  (setq telephone-line-lhs
	'((evil   . (telephone-line-evil-tag-segment))
	  (accent . (telephone-line-buffer-segment
		     telephone-line-erc-modified-channels-segment
		     telephone-line-process-segment))
	  (nil    . (telephone-line-minor-mode-segment))))

  (setq telephone-line-rhs
	'((nil    . (telephone-line-misc-info-segment
		     telephone-line-vc-segment))
	  (accent . (telephone-line-major-mode-segment))
	  (evil   . (telephone-line-airline-position-segment))))

  (telephone-line-mode t)
  )

;; Util functions
(load-file "~/.emacs.d/functions.el")

;; Whitespace mode. Only activated manually
(use-package whitespace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
