
;; Melpa
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; Settings
;; Line Numbers
(global-linum-mode t)
;; Windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; Language formatting
(setq c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)


;; Clang Format
(load "/home/aczaja/llvm/llvm/tools/clang/tools/clang-format/clang-format.el")
(global-set-key (kbd "C-M-`") 'clang-format-region)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("4b207752aa69c0b182c6c3b8e810bbf3afa429ff06f274c8ca52f8df7623eb60" "53a9ec5700cf2bb2f7059a584c12a5fdc89f7811530294f9eaf92db526a9fb5f" "e051e6443d10449b337d509da3c1e7c94d5950aad765a328fdde8b277cfe531a" "35e8498da0b3d64e982aea19c66fd862ac776f7c4af9008e3409fe4f84fa43e2" "5467ea02f4ba217ebd1fd32c6e967fec829421489f3bf485c44c42d3d7cbd622" "76245a1e9416670117619db8277584a6df7b660f7fbdd4c3c81069d83863333e" "adadd38fbeedf2c5f0f0782f92bed855c85e73dbc7fe7f857aab9131184646c4" "7d805afe673b88473d0d4d16796f00a9ba4e482d16a5778883a62ef0b27c8e9a" "1029f0e0739cdbb11861e6f5dc39468c529e0c241579d3ac5ecf16c7927b9fbc" "e443a6a73353b9db904330770472840f603fb7df42b7b2ba91672bd107f5c7fb" "72d739de11fab77e048bbf85172c75399bb64b44205afc951908c646278b6cef" "62f24c85a2e9c055df8f4f2ca5d01f954b7b0ca5c5a613b9b9e5d308703db360" default)))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
	(rainbow-mode darktooth-theme jbeans-theme badwolf-theme doom-themes avy ace-jump-mode base16-theme matlab-mode ujelly-theme rust-mode helm-R color-theme-sanityinc-tomorrow badger-theme autopair atom-dark-theme)))
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1b1818" :foreground "white smoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "1ASC" :family "Droid Sans Mono Slashed for Powerline")))))


;; Theme
;;(add-to-list 'load-path "~/emacs/atelier/")
;;(add-to-list 'custom-theme-load-path "~/emacs/atelier/")

;;(add-to-list 'load-path "~/emacs/pastel-tron-theme/")
;;(add-to-list 'custom-theme-load-path "~/emacs/pastel-tron-theme/")
;;(require 'pastel-tron-theme)
;;(load-theme 'pastel-tron t)

(add-to-list 'load-path "~/emacs/nyx-theme/")
(add-to-list 'custom-theme-load-path "~/emacs/nyx-theme")
(require 'nyx-theme)
(load-theme 'nyx t)

;;(require 'base16-atelierplateau-dark-theme)
;;(require 'base16-atelierforest-dark-theme)
;;(load-theme 'base16-atelierforest-dark t)
;;(load-theme 'base16-atelierplateau-dark)
;;(load-theme 'base16-atelier-forest t)

;;(require 'doom-themes)
;;(setq doom-themes-enable-bold t
;;	  doom-themes-enable-italic t)
;;(load-theme 'doom-tomorrow-night t)

;;(setq badwolf-keywords-nobold t)
;;(load-theme 'badwolf t)

;;(load-theme 'jbeans t)

;;(require 'darktooth-theme)
;;(load-theme 'darktooth t)

;; Packages
(require 'autopair)
(autopair-global-mode)
;; Avy
(require 'avy)
(global-set-key (kbd "C-:") 'avy-goto-char-timer)
;; Rainbow mode for showing color of hex code
(require 'rainbow-mode)
