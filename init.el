(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil)
(setq-default
 indent-tabs-mode nil
 tab-width 2
 c-basic-offset 4)

(electric-indent-mode 0)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'package)
(setq
 load-prefer-newer t
 package-enable-at-startup nil
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t
      use-package-always-ensure t)

(eval-when-compile (require 'use-package))

(use-package ensime :pin melpa-stable)
(use-package go-mode :pin melpa-stable)
(use-package magit :pin melpa-stable)

(setq color-themes '())
(use-package color-theme-solarized :config (customize-set-variable 'frame-background-mode 'dark) (load-theme 'solarized t))

(provide 'init)
