(load-file "~/.emacs.d/elisp/from_git/zen-and-art/zen-and-art.el")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;(color-theme-arjen)
     (color-theme-zen-and-art)
     ))
