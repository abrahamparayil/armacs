(setq user-full-name "Abraham Raji"
      user-mail-address "abrahamraji99@gmail.com") 
     ; calendar-latitude 9.738909
     ; calendar-longitude 76.719904
     ; calendar-location-name "Pravithanam, Pala KTM "
;; Sets the frame title as by http://www.emacswiki.org/emacs/FrameTitle
(setq frame-title-format (list "%b   %[- GNU %F " emacs-version) 
icon-title-format (list "%b- GNU %F " emacs-version))

(setq inhibit-startup-message t)
(defalias 'list-buffers 'ibuffer)
(tool-bar-mode -1)
(windmove-default-keybindings)
(global-linum-mode t)
(allout-mode) ;;outlining
(global-font-lock-mode 1) ;;syntax highlighting
(global-visual-line-mode t)

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

(defun 4br/visit-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))

(global-set-key (kbd "C-c e") '4br/visit-emacs-config)

(use-package elpy
:ensure t
:config 
(elpy-enable))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
;This creates a flycheck checker that runs proselint in texty buffers and displays my errors. 
 (flycheck-define-checker proselint
  "A linter for prose."
  :command ("proselint" source-inplace)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ": "
  (id (one-or-more (not (any " "))))
  (message (one-or-more not-newline)
  (zero-or-more "\n" (any " ") (one-or-more not-newline)))
  line-end))
  :modes (text-mode markdown-mode gfm-mode org-mode))
 ; flycheck in the appropriate buffers
(add-to-list 'flycheck-checkers 'proselint)
(add-hook 'markdown-mode-hook #'flycheck-mode)
(add-hook 'gfm-mode-hook #'flycheck-mode)
(add-hook 'text-mode-hook #'flycheck-mode)
(add-hook 'org-mode-hook #'flycheck-mode)

(use-package htmlize
:ensure t)
(setq org-html-postamble nil)

(use-package liso-theme
:ensure t
:config (load-theme 'liso t))
(defun transparency (value)
"Sets the transparency of the frame window. 0=transparent/100=opaque."
(interactive "nTransparency Value 0 - 100 opaque:")
(set-frame-parameter (selected-frame) 'alpha value)
(transparency 90))

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

(require 'ox-md)

(setq-default dired-listing-switches "-lhvA")
