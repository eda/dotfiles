;; html-helper-mode
;; http://d.hatena.ne.jp/n246/20070408/1176016376
(add-to-list 'load-path "~/.emacs.d/elisp/html-mode/")
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist 
      (append '(("\\.html$" . html-helper-mode)
		("\\.shtml$" . html-helper-mode)
		("\\.html$" . html-helper-mode)
		("\\.shtml$" . html-helper-mode)
		) auto-mode-alist))



