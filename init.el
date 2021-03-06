;; from https://github.com/daedreth/UncleDavesEmacs/blob/master/init.el ;;;
;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)
(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

;;; remove SC if you are not using sunrise commander and org if you like outdated packages
(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("MELPA stable" . "https://stable.melpa.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)


;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/emacs.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/emacs.org")))
;; This file replaces itself with the actual configuration at first run.
;; until here from uncle dave



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e4af99977fc5c572c8b82c19fce7afc622c6e8343bbb75230563c12dac7de4a8" default))
 '(emojify-emoji-styles '(github unicode))
 '(gdb-many-windows t)
 '(inhibit-startup-screen t)
 '(lsp-clients-clangd-args '("--clang-tidy"))
 '(lsp-prefer-flymake nil t)
 '(lsp-ui-doc-alignment 'window)
 '(lsp-ui-doc-position 'bottom)
 '(org-agenda-files '("~/todo.org" "~/school/planning.org"))
 '(org-babel-tangle-comment-format-beg "[[%link][%source-name]]")
 '(org-link-file-path-type 'adaptive)
 '(package-selected-packages
   '(evil-surround delight diminish projectile fireplace dockerfile-mode dockerfile org-bibtex vterm olivetti-mode plantuml-mode go-mode org-ref elisp-format htmlize diminisht yasnippet-classic-snippets yasnippet-snippets yasnippet lsp-clients helm-lsp lsp-ui lsp-mode flycheck-clang-tidy flycheck rg clang-format helm-rg emojify cargo zig-mode rust-mode ob-rust rainbow-delimiters rjsx-mode pdf-tools highlight-indent-guides rainbow-mode evil company auto-complete auto-compile))
 '(projectile-mode t nil (projectile))
 '(send-mail-function 'mailclient-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
