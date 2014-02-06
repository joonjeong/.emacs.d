(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-hl-line-mode t)
(which-function-mode 1) 
(ido-mode t)

(when (require 'package nil 'noerror)
  (setq package-archives 
	'(("gnu" . "http://elpa.gnu.org/packages/")
	  ("marmalade" . "http://marmalade-repo.org/packages/")
	  ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize))
 
(when (require 'ggtags nil 'noerror)
  (add-hook 'c-mode-hook '(lambda () (gtags-mode t)))
  (when window-system (speedbar t)))

(when (require 'yasnippet nil 'noerror)
  (yas-global-mode 1))

(when (require 'auto-complete nil 'noerror)
  (when (require 'auto-complete-config nil 'noerror)
    (set-default 'ac-sources
		 '(ac-source-abbrev
		   ac-source-dictionary
		   ac-source-yasnippet
		   ac-source-words-in-buffer
		   ac-source-words-in-same-mode-buffers
		   ac-source-semantic))
    (ac-config-default)
    (global-auto-complete-mode t)))

; key mapping
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
 
; key mapping for org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
