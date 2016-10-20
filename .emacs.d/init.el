;; Packages
(require 'package)
(setq package-list '(evil
                     evil-leader
		     helm
		     org
		     company
		     go-mode
		     go-eldoc
           ))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") ; Add theme path
(load-file"~/.emacs.d/functions.el") ; Add theme path

;; Evil-mode
(require 'evil)
(evil-mode t)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "f" 'spacemacs/helm-find-files
  )

(setq tab-width 4) ; Tab width

;; Undo limits
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

(global-company-mode t)

(electric-pair-mode 1) ; Double brackets

(delete-selection-mode 1) ; Replace active region

(show-paren-mode 1) ; Highlights matching paren pair

;; Helm
(helm-mode)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(global-set-key (kbd "M-x") 'helm-M-x)

(set-default-font "Liberation Mono-13") ;; Font

(global-set-key [(control shift k)] 'move-line-up) ;; Move line up
(global-set-key [(control shift j)] 'move-line-down) ;; Move line down

;; Theme
(load-theme 'junio t)

(setq ring-bell-function 'ignore) ;;No bell

;; Disables bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq scroll-step 1) ;; Keyboard scroll

;; Show line and column in the mode line
(line-number-mode 1)
(column-number-mode 1)

(fset 'yes-or-no-p 'y-or-n-p) ;; yes or no message

(setq inhibit-splash-screen t) ;; Disable splash screen

;; Moves up/down a visual line instead of a text line
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Esc quits minibuffer
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; C-movekey increases movement
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                    (interactive)
                    (backward-paragraph nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                        (interactive)
                        (forward-paragraph nil)))
(define-key evil-normal-state-map (kbd "C-h") (lambda ()
                        (interactive)
                        (left-word nil)))
(define-key evil-normal-state-map (kbd "C-l") (lambda ()
                        (interactive)
                        (right-word nil)))

;; Disables cursor moving one position when leaving insert mode
(setq evil-move-cursor-back nil)

;;Go
(add-hook 'go-mode-hook 'go-mode-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "f46ebf04f3877132b28a245b063a51bc8c4c2a68bbf58ef4257fae613a6447c4" "03ea866815fe82c4736611acafef3c90519d15cd3d465d8f146ebfa3a293b663" "f34b107e8c8443fe22f189816c134a2cc3b1452c8874d2a4b2e7bb5fe681a10b" default)))
 '(package-selected-packages (quote (helm helm-config evil-leader evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
