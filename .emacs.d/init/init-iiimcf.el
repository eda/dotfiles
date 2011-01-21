;AtokX3 IIIMCF
(add-to-list 'load-path "~/.emacs.d/elisp/iiimecf/")
(add-to-list 'load-path "~/.emacs.d/elisp/iiimecf/lisp/")
(setq iiimcf-server-control-hostlist (list (concat "/tmp/.iiim-" (user-login-name) "/:0.0")))
(setq iiimcf-server-control-default-language "ja")
(setq iiimcf-server-control-default-input-method "atokx3")
(require 'iiimcf-sc)
(setq default-input-method 'iiim-server-control)
