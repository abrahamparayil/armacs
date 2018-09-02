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

(use-package try
:ensure t)

(use-package which-key
:ensure t 
:config
(which-key-mode))

(use-package counsel
:ensure t
)

(use-package swiper
:ensure try
:config
(progn
 (ivy-mode 1)
 (setq ivy-use-virtual-buffers t)
 (global-set-key "\C-s" 'swiper)
 (global-set-key (kbd "C-c C-r") 'ivy-resume)
 (global-set-key (kbd "<f6>") 'ivy-resume)
 (global-set-key (kbd "M-x") 'counsel-M-x)
 (global-set-key (kbd "C-x C-f") 'counsel-find-file)
 (global-set-key (kbd "<f1> f") 'counsel-describe-function)
 (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
 (global-set-key (kbd "<f1> l") 'counsel-load-library)
 (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
 (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
 (global-set-key (kbd "C-c g") 'counsel-git)
 (global-set-key (kbd "C-c j") 'counsel-git-grep)
 (global-set-key (kbd "C-c k") 'counsel-ag)
 (global-set-key (kbd "C-x l") 'counsel-locate)
 (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
 (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
 ))

(use-package auto-complete
:ensure t
:init
(progn
 (ac-config-default)
 (global-auto-complete-mode t)
 ))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
