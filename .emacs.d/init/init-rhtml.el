;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/elisp/rhtml-mode/rhtml/")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))
