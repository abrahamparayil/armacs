(setq user-full-name "Abraham Raji")
  (setq user-mail-address "abrahamraji99@gmail.com")
  (setq inhibit-startup-message t)
  ;; ido mode
  (setq indo-enable-flex-matching t)
  (setq ido-eveywhere t)
  (ido-mode 1);;ido end
  (defalias 'list-buffers 'ibuffer);;ibuffer
  (tool-bar-mode -1)
  (windmove-default-keybindings)
  (global-linum-mode t)
  ;;matlab
  (add-to-list 'load-path "/home/guyfawkes/.emacs.d/matlab-emacs-master")
  (load-library "matlab-load")
  ;;Menubar
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

(unless (file-expand-wildcards (concat package-user-dir "/org-[0-9]*"))
(package-install (elt (cdr (assoc 'org package-archive-contents)) 0)))
(require 'org)

(use-package try
:ensure t)

(use-package which-key
:ensure t 
:config
(which-key-mode))

(add-to-list 'load-path "/home/guyfawkes/.emacs.d/org-reveal")
(require 'ox-reveal)
;;(use-package ox-reveal
;;:ensure ox-reveal)

;(setq org-reveal-root "/home/guyfawkes/.emacs.d/org-reveal/reveal.js")
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
:ensure t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)  ;load and activate packages, including auto-complete
(ac-config-default)
(global-auto-complete-mode t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package liso-theme
:ensure t
:config (load-theme 'liso t))
