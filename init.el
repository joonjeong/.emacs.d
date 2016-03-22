(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(prefer-coding-system 'utf-8-unix)

;(normal-erase-is-backspace-mode 1)

(column-number-mode t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode)
(setq linum-format "%4d ")

(package-initialize)
(dolist (i '(("elpa" . "http://elpa.gnu.org/packages/")
             ("melpa" . "http://melpa.milkbox.net/packages/")
             ("marmalade" . "http://marmalade-repo.org/packages/")))
  (add-to-list 'package-archives i))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/use-package"))
(load-library "use-package")

(use-package company :ensure t :pin melpa
  :config
  (global-company-mode)
  (setq compan-backends (delete 'company-semantic company-backends))
  (global-set-key "\t" 'company-complete-common)
  (define-key company-active-map [tab] 'company-complete-selection)
  (define-key company-active-map (kbd "TAB") 'company-complete-selection))
(use-package company-c-headers :ensure t :pin melpa
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-to-list 'company-c-headers-path-system "/usr/include/c++/v1/")
  (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
  (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9/"))
(use-package flycheck :ensure t :pin melpa :config (global-flycheck-mode))
(use-package flycheck-google-cpplint :ensure t :pin melpa
  :config (flycheck-add-next-checker 'c/c++-clang 'c/c++-googlelint 'append))
(use-package flycheck-irony :ensure t :pin melpa
  :config (add-hook 'flycheck-mode-hook 'flycheck-irony-setup))
(use-package ggtags :ensure t :pin melpa)
(use-package google-c-style :ensure t :pin melpa :config (add-hook 'c-mode-common-hook 'google-set-c-style))
(use-package magit :ensure t :pin melpa)
(use-package markdown-mode :ensure t :pin melpa)
(use-package minimap :ensure t :pin elpa)
(use-package neotree :ensure t :pin melpa :bind ([f8] . neotree-toggle))
(use-package helm :ensure t :pin melpa
  :config (require 'helm-config) (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)))
(use-package helm-projectile :ensure t :pin melpa
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (helm-projectile-on))
(use-package helm-ag :ensure t :pin melpa)
;(use-package solarized-theme :ensure t :pin melpa :config (load-theme 'solarized-dark t))
(use-package undo-tree :ensure t :pin melpa
  :config (global-undo-tree-mode))

(semantic-mode 1)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(server-mode 1)
(setenv "EDITOR" "emacsclient")

(defun custom-native-mode-hook ()
  (setq c-echo-semantic-information-p t)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-cont-nonempty 'c-lineup-arglist)
  (c-set-offset 'arglist-close 0))

(add-hook 'c-mode-hook 'custom-native-mode-hook)
(add-hook 'c++-mode-hook 'custom-native-mode-hook)
