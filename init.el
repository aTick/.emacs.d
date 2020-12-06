;;Colors
(set-background-color "black")
(set-foreground-color "white")

;; Ensure emacsclient/new frames use the same colors as above
(setq default-frame-alist `((background-color . "black")
			    (foreground-color . "white")))

(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'cl)
(let ((default-directory (concat user-emacs-directory "lisp")))
  ;; Add everything under .emacs.d/lisp
  (add-to-list 'load-path default-directory)
  (setq normal-top-level-add-subdirs-inode-list nil)
  (normal-top-level-add-subdirs-to-load-path)
  (setq load-path (remove-duplicates load-path :test 'string=)))
(package-initialize)
(add-to-list 'package-directory-list "~/.nix-profile/share/emacs/site-lisp/elpa")
(package-initialize)

(require 'lsp)
(require 'lsp-haskell)
(require 'lsp-ui)
(require 'shm)
(mapcar (lambda (hook)
	  (add-hook 'haskell-mode-hook hook))
	'(lsp
	  lsp-ui-mode
	  structured-haskell-mode))

(require 'ace-jump-mode)
(global-set-key (kbd "M-o") 'ace-jump-mode)
(setq ace-jump-mode-move-keys (loop for c from ?a to ?z collect c))
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(require 'paredit)
(require 'magit)
(require 'aggressive-indent)
(require 'nix-mode)

(add-to-list 'auto-mode-alist `("\\.ly\\'" . LilyPond-mode))

(require 'slime)
(slime-setup '(slime-fancy))
(slime-require 'swank-listener-hooks)
(let ((hooks-for-paredit '(emacs-lisp-mode-hook
			   lisp-mode-hook
			   scheme-mode-hook
			   lisp-inetraction-mode-hook
			   clojure-mode-hook)))
  (mapcar (lambda (hook)
	    (add-hook hook 'paredit-mode)
	    (add-hook hook 'aggressive-indent-mode))
	  hooks-for-paredit))

;;Parenthesis matching
(show-paren-mode 1) ;;Highlight pairs of matching parens
(setq show-paren-delay 0) ;;Highlight immediately
(setq show-paren-style 'mixed) ;;Highlight parens if both visible, otherwise highlight expression

(ido-mode 1)
(ido-everywhere 1)

;;Highlight region when selecting a region
(transient-mark-mode 1)

;;elisp options
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)

;;Turn off the error bell
(setq visible-bell t)

;;Commands disabled by default that we wish to enable
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq inferior-lisp-program "sbcl")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-haskell-process-path-hie "haskell-language-server-wrapper"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
