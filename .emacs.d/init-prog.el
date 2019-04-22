;; Go
(use-package go-mode
  :hook (go-mode . go-mode-setup)
  :config
  (use-package go-eldoc)
  )
(use-package yaml-mode)
(use-package rjsx-mode)
(use-package nginx-mode)
(use-package docker-compose-mode)
(use-package dockerfile-mode)
(use-package web-mode)
