;; js2-mode
(add-to-list 'load-path "~/.emacs.d/elisp/javascript-mode/")

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
