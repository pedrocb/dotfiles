;;Tab width
(setq tab-width 4)

;;Undo buffers limit
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

;;Initial buffer
(setq initial-buffer-choice "~/org/LEI.org")

;;Add themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;Double bracket
(electric-pair-mode 1)

;;Replace active region by typing
(delete-selection-mode 1)

;;Highlights matching paren pair
(show-paren-mode 1)

;;El-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;ELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(ac-config-default)

;;Helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)

;;Ido
(require 'ido)
(ido-mode t)

;;Ruby
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;;Font
(set-default-font "-zevv-peep-medium-r-normal--20-175-75-75-c-100-iso8859-15")
(setq default-frame-alist '((font . "-zevv-peep-medium-r-normal--20-175-75-75-c-100-iso8859-15")))

;;Move line up
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))
(global-set-key [(control shift up)]  'move-line-up)
										
;;Move line down
(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key [(control shift down)]  'move-line-down)

;;C
(setq-default c-basic-offset 2)

;;Theme
(load-theme 'junio t)

;;No bell
(setq ring-bell-function 'ignore)

;;Disable bars
(tool-bar-mode -1)
(menu-bar-mode -1)

;;Keyboard scroll
(setq scroll-step 1)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;;Key binds
(global-unset-key (kbd "C-h"))
(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "C-k"))
(global-unset-key (kbd "C-l"))

(global-set-key (kbd "C-h") 'backward-char)
(global-set-key (kbd "C-j") 'next-line)
(global-set-key (kbd "C-k") 'previous-line)
(global-set-key (kbd "C-l") 'forward-char)

;;yes or no message
(fset 'yes-or-no-p 'y-or-n-p)

;;org
(require 'org)
(global-set-key "\C-cl" 'org-store-link) 
(global-set-key "\C-ca" 'org-agenda)    ;;Keybinds
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-adapt-indentation nil) ;;Not sure
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode)) ;;turns org-mode as default mode for .org, .org_archive, .txt
(setq org-todo-keywords
	  '((sequence "SOON" "TODO" "DOING" "DONE")))
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.x?html?\\'" . "google-chrome-stable %s")
		))
;;Agenda files
(org-agenda-files
 (quote
  ("~/org/compras.org" "~/org/personal.org" "~/keys.org" "~/org/LEI.org")))
;;Prevents edits on invisible part
(setq-default org-catch-invisible-edits 'smart)
;;Clean view
(setq-default org-startup-indented t)


;;Disable splash screen
(setq inhibit-splash-screen t)

;; Base functions to copy functions
(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point)
  )
(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
	(let ((beg (get-point begin-of-thing 1))
		  (end (get-point end-of-thing arg)))
	  (copy-region-as-kill beg end)))
  )
(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe 
     	 (lambda()
     	   (if (string= "shell-mode" major-mode)
			   (progn (comint-next-prompt 25535) (yank))
			 (progn (goto-char (mark)) (yank) )))))
	(if arg
		(if (= arg 1)
     		nil
		  (funcall pasteMe))
	  (funcall pasteMe))
	))
(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  ;;(paste-to-mark arg)
  )
(defun beginning-of-string(&optional arg)
  "  "
  (re-search-backward "[ \t]" (line-beginning-position) 3 1)
  (if (looking-at "[\t ]")  (goto-char (+ (point) 1)) )
  )
(defun end-of-string(&optional arg)
  " "
  (re-search-forward "[ \t]" (line-end-position) 3 arg)
  (if (looking-back "[\t ]") (goto-char (- (point) 1)) )
  )
(defun thing-copy-string-to-mark(&optional arg)
  " Try to copy a string and paste it to the mark
     When used in shell-mode, it will paste string on shell prompt by default "
  (interactive "P")
  (copy-thing 'beginning-of-string 'end-of-string arg)
  ;(paste-to-mark arg)
  )

;;Copy string
(global-set-key (kbd "C-c s")         (quote thing-copy-string-to-mark))
;;Copy word
(global-set-key (kbd "C-c w")         (quote copy-word))

;Function to kill all buffers besides current one
(defun only-current-buffer () 
  (interactive)                                                                   
    (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))

;;Defines auto-save files and backup files directory
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))

;;Disables scroll bar
(scroll-bar-mode -1)
