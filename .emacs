
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

;; Clang Format
;; To make .clang-format file for a project:
;; $ clang-format -style=llvm -dump-config > .clang-format
(load "/home/aczaja/llvm/llvm/tools/clang/tools/clang-format/clang-format.el")
(global-set-key (kbd "C-M-`") 'clang-format-region)



;; Managed by Emacs customize system
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (matlab-mode helm-describe-modes helm-descbinds helm rust-mode vimrc-mode avy paredit markdown-mode smartparens autopair use-package)))
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
 '(default ((t (:inherit nil :stipple nil :background "#0f0f0f" :foreground "white smoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "PfEd" :family "Droid Sans Mono Slashed for Powerline")))))



;;;; Packages managed by use-package
(use-package autopair
  :ensure t
  :config (autopair-global-mode 1))
(use-package paredit
  :ensure t
  :init (progn
	  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
	  (add-hook 'common-lisp-mode-hook #'enable-paredit-mode)))
(use-package avy
  :ensure t
  :bind ("C-:" . avy-goto-char-timer))
(use-package rainbow-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode))
(use-package vimrc-mode
  :ensure t
  :defer t)
(use-package rust-mode
  :ensure t
  :defer t
  :init
  (require 'rust-mode)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))
(use-package matlab-mode
  :ensure t
  :defer t)

(use-package helm
  :ensure t
  :bind ("M-x" . helm-M-x)
  :config (helm-autoresize-mode 1))
(use-package helm-descbinds
  :ensure t
  :after helm
  :bind ("C-h b" . helm-descbinds)
  :init
  (fset 'describe-bindings 'helm-desdbinds))
(use-package helm-describe-modes
  :ensure t
  :after helm
  :bind ("C-h m" . helm-describe-modes))



;; Theme
(add-to-list 'load-path "~/emacs/nyx-theme/")
(add-to-list 'custom-theme-load-path "~/emacs/nyx-theme")
(require 'nyx-theme)
(load-theme 'nyx t)
