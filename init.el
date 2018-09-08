;;Package Management
(load "package")
(package-initialize)
;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/") t)

(setq package-archive-enable-alist '(("melpa" magit f)))

;;use-package command
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
(package-install 'use-package))

(org-babel-load-file (expand-file-name"~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "red3" "green3" "yellow3" "#FFE203" "magenta3" "cyan3" "gray90"])
 '(custom-enabled-themes (quote (liso)))
 '(custom-safe-themes
   (quote
    ("13a654e817774e669cc17ee0705a3e1dfc62aedb01005a8abe2f8930a1d16d2e" "f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" default)))
 '(ibuffer-deletion-face (quote diredp-deletion-file-name))
 '(ibuffer-marked-face (quote diredp-flag-mark))
 '(package-selected-packages
   (quote
    (elpy jedi flycheck which-key use-package try solarized-theme org-bullets org liso-theme htmlize gruvbox-theme auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
