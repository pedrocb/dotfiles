;; Evil-mode
(use-package evil
  :config
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)

  ;; Moves up/down a visual line instead of a text line
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

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


  (define-key evil-ex-map "e " 'spacemacs/helm-find-files)
  (define-key evil-ex-map "b " 'switch-to-buffer)
  (define-key evil-ex-map "vs" (lambda()
				 (interactive)
				 (split-window-horizontally)
				 (other-window 1)))
  (define-key evil-ex-map "sp" (lambda()
				 (interactive)
				 (split-window-vertically)
				 (other-window 1)))

  (evil-ex-define-cmd "k" 'kill-this-buffer)

  ;; Switch window
  (global-unset-key (kbd "M-l"))
  (global-unset-key (kbd "M-h"))
  (global-unset-key (kbd "M-j"))
  (global-unset-key (kbd "M-k"))

  (global-set-key (kbd "M-l") 'windmove-right)
  (global-set-key (kbd "M-h") 'windmove-left)
  (global-set-key (kbd "M-j") 'windmove-down)
  (global-set-key (kbd "M-k") 'windmove-up)

  (global-set-key [(control shift k)] 'move-line-up) ;; Move line up
  (global-set-key [(control shift j)] 'move-line-down) ;; Move line down

  ;; Disables cursor moving one position when leaving insert mode
  (setq evil-move-cursor-back nil)

  ;; Indents according mode
  (define-key evil-insert-state-map (kbd "TAB") 'indent-according-to-mode)
  (define-key evil-normal-state-map (kbd "TAB") 'indent-according-to-mode)
  (define-key evil-visual-state-map (kbd "TAB") 'indent-according-to-mode)


  (evil-mode t)
  (use-package evil-numbers)
  (use-package evil-nerd-commenter)
  (use-package evil-leader
    :config
    (setq evil-leader/in-all-states t)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "b" 'helm-buffers-list
      "f" 'spacemacs/helm-find-files

      "hk" 'helm-show-kill-ring
      "ho" 'helm-occur
      "hh" 'helm-descbinds
      "s" 'helm-swoop
      "hf" 'helm-mini

      "u" 'undo-tree-visualize

      "t" 'open-terminal

      "oa" 'org-agenda-list
      "od" 'my-org-deadline
      "os" 'my-org-schedule
      "oc" 'org-capture

      "+" 'evil-numbers/inc-at-pt
      "-" 'evil-numbers/dec-at-pt

      "m" 'pop-to-mark-command
      "ci" 'evilnc-comment-or-uncomment-lines
      "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
      "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
      "cc" 'evilnc-copy-and-comment-lines
      "cp" 'evilnc-comment-or-uncomment-paragraphs
      "cr" 'comment-or-uncomment-region
      "cv" 'evilnc-toggle-invert-comment-line-by-line
      "."  'evilnc-copy-and-comment-operator
      "\\" 'evilnc-comment-operator ; if you prefer backslash key
      )
    (global-evil-leader-mode 1)
    )

  ;; Evil keybinds to surround text
  (use-package evil-surround
    :config
    (global-evil-surround-mode 1))
  )
