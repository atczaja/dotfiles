
;;;; Paackage Config Setup
;; Melpa
;; For new setup, set this file as the .emacs file, then start Emacs.
;; Things won't work properly until you enable Melpa, install use-package, and
;; reload to allow use-package to install all other packages.
;; To accomplish this, place the point on top of the closing parentheses of the
;; sexps in this block, and press C-x C-e to evaluate them. Then go to
;; M-x package-list-packages and install use-package.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
					(not (gnutls-available-p))))
 (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
	(add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages")))))
(package-initialize)

;; Configure use-package
(eval-when-compile
  ;; https://github.com/jwiegley/use-package
  (add-to-list 'load-path "~/.emacs.d/elpa/")
  (require 'use-package))



;;;; Settings
;; Windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; Change yes-or-no-p to y-or-n-p
(fset 'yes-or-no-p 'y-or-n-p)
;; Highlight current line
(global-hl-line-mode t)
;; Modern display line numbers
(global-display-line-numbers-mode)

;; Clang Format
;; To make .clang-format file for a project:
;; $ clang-format -style=llvm -dump-config > .clang-format
(if (string-equal system-type "windows-nt")
    ;; Install Clang through VS
    (load "C:\\Program Files\\LLVM\\share\\clang\\clang-format.el")
  ;; Install LLVM from  git or svn
  (load "/home/aczaja/llvm/llvm/tools/clang/tools/clang-format/clang-format.el"))
(global-set-key (kbd "C-M-`") 'clang-format-region)

;; Remap splitting to automatically switch
(global-set-key (kbd "C-x 2") (lambda ()
		     (interactive)
		     (split-window-vertically)
		     (other-window 1)))
(global-set-key (kbd "C-x 3") (lambda ()
		     (interactive)
		     (split-window-horizontally)
		     (other-window 1)))

;; Managed by Emacs customize system
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (yaml-mode company-racer racer gruvbox-theme creamsody-theme northcode-theme danneskjold-theme badwolf-theme ample-theme zenburn-theme badger-theme noctilux-theme firecode-theme darktooth-theme panda-theme srcery-theme jbeans-theme counsel-tramp flx smart-mode-line ace-window company-irony irony company-jedi company diminish rainbow-mode counsel swiper ivy color-theme try color-theme-sanityinc-tomorrow base16-theme matlab-mode helm-describe-modes helm-descbinds helm rust-mode vimrc-mode avy paredit markdown-mode smartparens autopair use-package)))
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1c1c1c" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "pyrs" :family "Roboto Mono for Powerline")))))



;; Set up tramp for Windows. Requires Putty be installed and plink.exe be in path
(when (eq system-type "windows-nt")
  (setq tramp-default-method "plink"))


;;;; Packages managed by use-package
(use-package diminish
  :ensure t)
(use-package autopair
  :ensure t
  :diminish autopair-mode
  :config (autopair-global-mode 1))
(use-package paredit
  :ensure t
  :init (progn
	  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
	  (add-hook 'common-lisp-mode-hook #'enable-paredit-mode)))
(use-package avy
  :ensure t
  :bind ("C-:" . avy-goto-char-timer))
(use-package ace-window
  :ensure t
  :defer t
  :bind ("M-o" . 'ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-dispatch-always t))
(use-package rainbow-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode))
(use-package vimrc-mode
  :ensure t
  :defer t)
(use-package yaml-mode
  :ensure t
  :defer t
  :mode ("\\.ya?ml\\'" . yaml-mode)
  :config
  (add-hook 'yaml-mode-hook
	    '(lambda ()
	       (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(use-package matlab-mode
  :ensure t
  :defer t
  :config
  (matlab-cedet-setup))

;; (use-package helm
;;   :ensure t
;;   :bind ("M-x" . helm-M-x)
;;   :config (helm-autoresize-mode 1))
;; (use-package helm-descbinds
;;   :ensure t
;;   :after helm
;;   :bind ("C-h b" . helm-descbinds)
;;   :init
;;   (fset 'describe-bindings 'helm-desdbinds))
;;;; (use-package helm-describe-modes
;;   :ensure t
;;   :after helm
;;   :bind ("C-h m" . helm-describe-modes))

;; General Usage
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind ("C-c C-r" . ivy-resume)
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; Uncomment next three lines and uncomment flx package
  ;; to enable fuzzy swiper matching in ivy
  ;; (setq ivy-re-builders-alist
	;; '((ivy-switch-buffer . ivy--regex-plus)
	  ;; (t . ivy--regex-fuzzy)))
  ;; (setq ivy-count-format "(%d/%d) ")
  )
;; (use-package flx
  ;; :ensure t)
(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)))
(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
	 ("M-y" . counsel-yank-pop)
	 ("C-x C-f" . counsel-find-file)
	 ("C-h f" . counsel-describe-function)
	 ("C-h v" . counsel-describe-variable)))
(use-package counsel-tramp
  :ensure t
  :defer t)

;; Company Setup
(use-package company
  ;; https://github.com/kirang89/.emacs.d/blob/master/kiran/init-company.el
  :ensure t
  :init
  (global-company-mode)
  :bind ("C-." . company-complete)
  :config
  (setq company-tooltip-limit 10)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t))

;; Python Setup
(use-package company-jedi
  ;; https://github.com/syohex/emacs-company-jedi/wiki
  ;; :config
  ;; (setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.python-environments")))
  ;; (add-hook 'python-mode-hook 'jedi:setup)
  ;; (setq jedi:complete-on-dot t)
  ;; (setq jedi:use-shortcuts t)
  ;; (defun config/enable-company-jedi ()
  ;;   (add-to-list 'company-backends 'company-jedi))
  ;; (add-hook 'python-mode-hook 'config/enable-company-jedi)
  :ensure t
  :defer t
  :after company
  :init
  (if (string-equal system-type "windows-nt")
      (setq company-jedi-python-bin "python")
    (setq company-jedi-python-bin "python3"))
  (setq jedi:environment-virtualenv
  	(list (expand-file-name
  	       "~/.emacs.d/.python-environments/" )))  ;; C:\Users\atcza\%.emacs.d\%.python-environments
  (add-hook 'python-mode-hook 'jedi:setup)
  ;; (defun config/enable-company-jedi ()
    ;; (add-to-list 'company-backends 'company-jedi))
  ;; (add-hook 'python-mode-hook 'config/enable-company-jedi)
  (add-hook 'python-mode-hook
  	    (lambda ()
  	      (add-to-list 'company-backends 'company-jedi)))
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  :config
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  )
(setq python-shell-enable-font-lock nil)

;; Rust Setup
;; https://github.com/nlopes/dotfiles/blob/master/.emacs.d/rust.el
(use-package rust-mode
  :ensure t
  :defer t
  :init
  (require 'rust-mode)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  :config
  (use-package company-racer
    :ensure t
    :defer t)
  (use-package racer
    :ensure t
    :defer t
    :init
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    (setq company-tooltip-align-annotations t))
  (add-hook 'rust-mode-hook #'racer-mode))

;; C/C++ Setup
(use-package irony
  ;; https://github.com/mswift42/.emacs.d/blob/master/init.el
  :ensure t
  :defer t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
(use-package company-irony
  :ensure t
  :defer t
  :after irony
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package magit
    :ensure t
    :defer t)
(use-package try
  :ensure t)

;; Set up slime with sbcl
(defun load-slime ()
  (interactive)
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "C:\\SBCL\\1.4.2\\sbcl.exe"))

;; Theme
;; (add-to-list 'load-path "~/emacs/nyx-theme/")
;; (add-to-list 'custom-theme-load-path "~/emacs/nyx-theme")
;; (require 'nyx-theme)
;; (load-theme 'nyx t)
;; (use-package jbeans-theme
;; :ensure t)
;; (use-package badger-theme
;;   :ensure t
;;   :config (load-theme 'badger t))
;; (use-package darktooth-theme
;;   :ensure t
;;   :config (load-theme 'darktooth t))
;; (use-package gruvbox-theme
;;   :ensure t
;;   :config (load-theme 'gruvbox-dark-medium t))
;; (use-package danneskjold-theme
;; :ensure t)
;; (use-package ample-theme
;;   :init (progn (load-theme 'ample t t)
;; 	       (load-theme 'ample-flat t t)
;; 	       (load-theme 'ample-light t t)
;; 	       (enable-theme 'ample-flat))
;;   :defer t
;;   :ensure t)
(use-package gruvbox-theme
  :ensure t
  :config (load-theme 'gruvbox-dark-soft t))
;; (use-package base16-theme
;;   :ensure t
;;   :demand
;;   :config
;;   (progn
;;     (set 'base16-distinct-fringe-background nil)
;;     (set 'base16-highlight-mode-line nil)
;;     ;; (load-theme 'base16-default-dark t)
;;     ;; (load-theme 'base16-material t)
;;     ;; (load-theme 'base16-ia-dark t)
;;     ;; (load-theme 'base16-ocean t)
;;     (load-theme 'base16-zenburn t)))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (sml/setup))
