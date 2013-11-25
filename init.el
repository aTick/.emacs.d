;;Colors
(set-background-color "black")
(set-foreground-color "white")

(let ((default-directory (concat user-emacs-directory "lisp")))
  ;; Add everything under .emacs.d/lisp
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))
(require 'icicles)
(icy-mode)
(require 'haskell-mode)
(require 'my-command-remap)

;;Parenthesis matching
(show-paren-mode 1) ;;Highlight pairs of matching parens
(setq show-paren-delay 0) ;;Highlight immediately
(setq show-paren-style 'mixed) ;;Highlight parens if both visible, otherwise highlight expression

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

;;Set scheme program name under linux-like environments, and start an emacs server on windows.
(cond
 ((and (or (string-equal system-type "gnu/linux")
	   (string-equal system-type "cygwin"))
       (or (file-exists-p "/usr/local/bin/guile")
	   (file-exists-p "/usr/bin/guile")))
  (setq scheme-program-name "guile"))
 ((string-equal system-type "windows-nt")
    (progn
     (setq explicit-bash-args (list "--noediting" "-i"))
     (setq shell-file-name "D:/Utilities/cygwin/bin/bash")
     (server-start))))
