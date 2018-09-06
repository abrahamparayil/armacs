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
