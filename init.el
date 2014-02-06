(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-hl-line-mode t)
(which-function-mode) 
(ido-mode t)

; key mapping
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
 
; key mapping for org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(when (require 'package nil 'noerror)
  (setq package-archives
	'(("gnu" . "http://elpa.gnu.org/packages/")
	  ("marmalade" . "http://marmalade-repo.org/packages/")
	  ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize))

(when (require 'ecb nil 'noerror)
  (ecb-layout-define
      "development" left nil
      (ecb-set-methods-buffer)
      (ecb-split-ver 0.75 t)
      (other-window 1)
      (ecb-set-history-buffer)
      (select-window (next-window)))

  (custom-set-variables
   '(ecb-layout-name "development")
   '(ecb-options-version "2.40"))
  (custom-set-faces)
  (ecb-activate))
