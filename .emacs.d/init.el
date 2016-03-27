(setq tab-width 4)
;;Theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
    ("3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(initial-buffer-choice "~/org/LEI.org")
 '(linum-format " %7i ")
 '(org-agenda-files
   (quote
    ("~/org/compras.org" "~/org/personal.org" "~/keys.org" "~/org/LEI.org")))
 '(org-catch-invisible-edits (quote smart))
 '(org-startup-indented t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;Double bracket
(electric-pair-mode 1)
;;Replace active region by typing
(delete-selection-mode 1)

(show-paren-mode 1)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'package) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(ac-config-default)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)


(set-default-font "Inconsolata-14")
(setq default-frame-alist '((font . "Inconsolata-14")))
(require 'auto-complete-love)
(add-hook 'lua-mode-hook '(lambda ()
							(setq ac-sources '(ac-source-love))
										; Uncomment only if you're using
										; `auto-complete-lua' (see below)
										;(push ac-source-lua ac-sources)
                            (auto-complete-mode)))


(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)


(setq-default c-basic-offset 4)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'wilson t)

(setq ring-bell-function 'ignore)

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq scroll-step 1)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)


(global-unset-key (kbd "C-h"))
(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "C-k"))
(global-unset-key (kbd "C-l"))


(global-set-key (kbd "C-h") 'backward-char)
(global-set-key (kbd "C-j") 'next-line)
(global-set-key (kbd "C-k") 'previous-line)
(global-set-key (kbd "C-l") 'forward-char)

(fset 'yes-or-no-p 'y-or-n-p)

;;
;;org-mode stuff
;;
(require 'org)
(global-set-key "\C-cl" 'org-store-link) 
(global-set-key "\C-ca" 'org-agenda)    ;;Keybinds
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-adapt-indentation nil) ;;Not sure
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode)) ;;turns org-mode as default mode for .org, .org_archive, .txt

(setq org-todo-keywords
	  '((sequence "SOON" "TODO" "DOING" "DONE")))



;;Disable splash screen
(setq inhibit-splash-screen t)


(global-set-key "\C-ch" help-map)

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.x?html?\\'" . "google-chrome-stable %s")
		))

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


(global-set-key (kbd "C-c s")         (quote thing-copy-string-to-mark))
(global-set-key (kbd "C-c w")         (quote copy-word))

;Function to kill all buffers besides current one
(defun only-current-buffer () 
  (interactive)                                                                   
    (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))
