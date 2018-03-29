;;; paredit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "paredit" "../../../../.emacs.d/elpa/paredit-20171126.1805/paredit.el"
;;;;;;  "e13ad61238e16230e59274cdd49fffc1")
;;; Generated autoloads from ../../../../.emacs.d/elpa/paredit-20171126.1805/paredit.el

(autoload 'paredit-mode "paredit" "\
Minor mode for pseudo-structurally editing Lisp code.
With a prefix argument, enable Paredit Mode even if there are
  unbalanced parentheses in the buffer.
Paredit behaves badly if parentheses are unbalanced, so exercise
  caution when forcing Paredit Mode to be enabled, and consider
  fixing unbalanced parentheses instead.
\\<paredit-mode-map>

\(fn &optional ARG)" t nil)

(autoload 'enable-paredit-mode "paredit" "\
Turn on pseudo-structural editing of Lisp code.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/paredit-20171126.1805/paredit-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/paredit-20171126.1805/paredit.el")
;;;;;;  (23229 21038 681724 630000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; paredit-autoloads.el ends here
