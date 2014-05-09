(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'use-package)

(use-package auto-complete
  :defer t
  :init (progn
	  (require 'auto-complete-config)
	  (require 'auto-complete-c-headers)
	  (require 'auto-complete-clang)
	  (require 'auto-complete-clang-async)
	  (require 'auto-complete-exuberant-ctags)
	  (dolist (mode '(emacs-lisp-mode
			  java-mode
			  org-mode
			  python-mode))
	    (add-to-list 'ac-modes mode)))
  :config (progn
	    (ac-config-default)
	    (add-to-list 'completion-styles 'initials t)
	    (add-to-list 'ac-sources '(
				       'ac-source-abbrev
				       'ac-source-dictionary
				       'ac-source-features
				       'ac-source-semantic
				       'ac-source-symbols
				       'ac-source-variables
				       'ac-source-yasnippet
				       'ac-source-functions
				       ))
	    (defun ac-hook-for-c ()
		 (add-to-list 'ac-sources 'ac-source-c-headers))
	    (defun ac-hook-for-c++ ()
	      (ac-hook-for-c)
	      (add-to-list 'achead:include-directories '"/usr/include/c++/4.6"))
	    (add-hook 'c-mode-hook 'ac-hook-for-c)
	    (add-hook 'c++-mode-hook 'ac-hook-for-c++)

	    (semantic-mode t)
	    (setq ac-auto-start 2
		  ac-delay 0.
		  ac-quick-help-delay 1.
		  ac-use-fuzzy t
		  ac-fuzzy-enable t
		  tab-always-indent 'complete
		  ac-dwim t)))

(use-package helm :init (helm-mode 1))
(use-package helm-c-yasnippet
  :commands helm-c-yas-complete
  :config (progn
	    (setq helm-c-yas-space-match-any-greedy t)
	    (use-package yasnippet
	      :config (progn
			(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
			(yas-global-mode 1)))))
      
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
;(tool-bar-mode -1)
;(global-hl-lpine-mode t)
(which-function-mode 1) 
;(ido-mode t)

; key mapping
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "<f12>") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

; key mapping for org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
