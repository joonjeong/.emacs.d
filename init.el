(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(prefer-coding-system 'utf-8-unix)

(normal-erase-is-backspace-mode 1)

(column-number-mode t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode)
(setq linum-format "%4d ")

; packages 
(package-initialize)
(dolist (i '(("elpa" . "http://elpa.gnu.org/packages/")
	   ("melpa" . "http://melpa.milkbox.net/packages/")
	   ("marmalade" . "http://marmalade-repo.org/packages/")))
	   (add-to-list 'package-archives i))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/use-package"))
(load-library "use-package")

(use-package magit :ensure t)
(use-package markdown-mode :ensure t :pin melpa)
(use-package helm :ensure t :pin melpa)
(use-package centered-window-mode :ensure t :pin melpa)
(use-package helm-projectile :ensure t :pin melpa)
(use-package helm-ag :ensure t :pin melpa)
(use-package solarized-theme :ensure t :pin melpa)

(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)

(centered-window-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(setenv "EDITOR" "emacsclient")

(load-theme 'solarized-dark t)

(server-mode 1)
