(setq user-full-name "Abraham Raji")
(setq user-mail-address "abrahamraji99@gmail.com")

(setq inhibit-startup-message t)
(defalias 'list-buffers 'ibuffer)
(tool-bar-mode -1)
(windmove-default-keybindings)
(global-linum-mode t)
(allout-mode) ;;outlining
(global-font-lock-mode 1) ;;syntax highlighting

(setq indo-enable-flex-matching t)
(setq ido-eveywhere t)
(ido-mode 1)

(menu-bar-mode -1)
(defun my-menu-bar-open-after ()
(remove-hook 'pre-command-hook 'my-menu-bar-open-after)
(when (eq menu-bar-mode 42)
(menu-bar-mode -1)))
(defun my-menu-bar-open (&rest args)
(interactive)
(let ((open menu-bar-mode))
(unless open
(menu-bar-mode 1))
(funcall 'menu-bar-open args)
(unless open
(setq menu-bar-mode 42)
(add-hook 'pre-command-hook 'my-menu-bar-open-after))))
(global-set-key [f10] 'my-menu-bar-open)

(add-to-list 'default-frame-alist
'(font . "DejaVu Sans Mono-10"))

(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'org-mode)

(use-package flycheck
:ensure t
:init
(global-flycheck-mode t))

(use-package htmlize
:ensure t)

(use-package liso-theme
:ensure t
:config (load-theme 'liso t))

(add-to-list 'load-path "/home/guyfawkes/.emacs.d/matlab-emacs-master")
(load-library "matlab-load")

(unless (file-expand-wildcards (concat package-user-dir "/org-[0-9]*"))
(package-install (elt (cdr (assoc 'org package-archive-contents)) 0)))
(require 'org)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(add-to-list 'load-path "~/.emacs.d/org-reveal")
(require 'ox-reveal)
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package try
:ensure t)

(use-package which-key
:ensure t 
:config
(which-key-mode))

(use-package elpy
:ensure t
:config 
(elpy-enable))
