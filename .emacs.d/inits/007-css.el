;; css-mode.el
;; http://d.hatena.ne.jp/n246/20070408/1176016376
(add-to-list 'load-path "~/.emacs.d/elisp/css-mode/")
(autoload 'css-mode "css-mode" nil t)
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))
(setq css-indent-level 2)

