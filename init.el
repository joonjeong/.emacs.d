(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'use-package)

(use-package auto-complete
  :defer t
  :init (progn
	  (use-package auto-complete-config)
	  (use-package auto-complete-c-headers)

	  (dolist (mode '(emacs-lisp-mode
			  java-mode
			  org-mode
			  python-mode))
	    (add-to-list 'ac-modes mode)))
  :config (progn
	    (ac-config-default)
	    (setq ac-auto-show-menu t)
	    (add-to-list 'completion-styles 'initials t)

	    (add-to-list 'ac-sources 'ac-source-abbrev)
	    (add-to-list 'ac-sources 'ac-source-dictionary)
	    (add-to-list 'ac-sources 'ac-source-features)
	    (add-to-list 'ac-sources 'ac-source-functions)
	    (add-to-list 'ac-sources 'ac-source-symbols)
	    (add-to-list 'ac-sources 'ac-source-variables)
	    (add-to-list 'ac-sources 'ac-source-yasnippet)

 	    (add-hook 'c-mode-hook
		      (lambda ()
			(add-to-list 'ac-sources 'ac-source-c-headers)))

	    (add-hook 'c++-mode-hook
		      (lambda ()
			(add-to-list 'ac-sources 'ac-source-c-headers)
			(add-to-list 'achead:include-directories '"/usr/include/c++/4.8.2")))

	    (setq ac-auto-start 2
		  ac-delay 0.
		  ac-quick-help-delay 1.
		  ac-use-fuzzy t
		  ac-fuzzy-enable t
		  tab-always-indent 'complete
		  ac-dwim t)))

(use-package cedet
  :init (progn
	  (add-to-list 'ac-sources 'ac-source-semantic)
	  (add-to-list 'ac-sources 'ac-source-semantic-raw)
	  (semantic-mode 1)
	  (global-semantic-idle-scheduler-mode 1)
	  
	  (global-ede-mode 1)))

(use-package flymake-google-cpplint
  :init (progn
	  (defun lint-initialize ()
	    (custom-set-variables '(flymake-google-cpplint-command "/usr/bin/cpplint"))
	    (flymake-google-cpplint-load))
	  (flymake-checkers-mode)
	  (add-hook 'c-mode-hook 'lint-initialize)
	  (add-hook 'c++-mode-hook 'lint-initialize)))

(use-package google-c-style
  :init (progn
	  (add-hook 'c-mode-common-hook 'google-set-c-style)
	  (add-hook 'c-mode-common-hook 'google-make-newline-indent)))


(use-package helm :init (helm-mode 1))
(use-package helm-c-yasnippet
  :commands helm-c-yas-complete
  :config (progn
	    (setq helm-c-yas-space-match-any-greedy t)
	    (use-package yasnippet
	      :config (progn
			(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
			(yas-global-mode 1)))))


(define-key global-map (kbd "C-c ;") 'iedit-mode)
      
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(setq indent-tab-mode nil)

(menu-bar-mode -1)
;(tool-bar-mode -1)
;(global-hl-line-mode t)
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
