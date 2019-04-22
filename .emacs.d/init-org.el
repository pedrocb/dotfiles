(use-package org
  :mode
  ("\\.cal\\'" . org-mode)
  :hook
  (after-init . (lambda ()
		  (org-agenda-list)
		  (delete-other-windows)
		  (split-window-below)
		  (find-file "~/org/Organizer.org")
		  ))
  (org-mode . org-indent-mode)
  :config
  (setq org-todo-keywords
	'((sequence "TODO" "IN-PROGRESS" "NEXT" "WAITING" "|" "DONE" "CANCELED")))
  (setq org-agenda-files '("~/org"))
  (setq org-agenda-include-diary t)
  (setq org-refile-targets (quote (("Projects.org" :maxlevel . 1))))

  (setq org-capture-templates
	'(("a" "Appointment" entry (file
				    "~/org/appointments.org")
	   "* %?\n\n%^T")
	  ("s" "Shopping Item")
	  ("sg" "Groceries" item (file+headline "~/org/shopping-list.org" "Groceries"))
	  ("so" "Other" item (file+headline "~/org/shopping-list.org" "Other"))
	  ("t" "TODO" entry (file "~/org/Organizer.org")
	   "* TODO %?")
	  ))

  ;; Google calendar integration
  (use-package org-gcal
    :ensure t
    :hook
    (org-agenda-mode . (lambda () (org-gcal-sync)))
    :config
    (setq org-gcal-client-id secret-gcal-client-id
	  org-gcal-client-secret secret-gcal-client-secret
	  org-gcal-file-alist '(("pbelem1995@gmail.com" . "~/org/appointments.org")
				("er4ni8d45776mr3j5c28hpj0cg@group.calendar.google.com" . "~/org/deadlines.cal")
				("dkgb0rkfkph7iu3p31qijgf74k@group.calendar.google.com" . "~/org/todos_scheduled.cal")))
    )

  ;; Visual calendar
  (use-package calfw
    :config
    (use-package calfw-org)
    (use-package calfw-ical)
    (setq cfw:org-overwrite-default-keybinding t)
    )
  )

(defun air-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(defun my-org-deadline()
  (interactive)
  (let ((date (org-read-date nil nil nil "Date: ")))
    (org-deadline nil date)
    (write-region (concat "* " (org-entry-get nil "ITEM") "\n<" date ">") nil "~/org/deadlines.cal" 'append))
  (org-gcal-sync)
  )

(defun my-org-schedule()
  (interactive)
  (let ((date (org-read-date nil nil nil "Date: ")))
    (org-schedule nil date)
    (write-region (concat "* " (org-entry-get nil "ITEM") "\n<" date ">") nil "~/org/todos_scheduled.cal" 'append))
  (org-gcal-sync)
  )

(provide 'org-config)
