;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/elisp/from_git/rvm.el/")
(add-to-list 'load-path "~/.emacs.d/elisp/from_git/rinari/")
(add-to-list 'load-path "~/.emacs.d/elisp/from_git/zen-and-art/")
(add-to-list 'load-path "~/.emacs.d/elisp/from_git/haml-mode/")
(add-to-list 'load-path "~/.emacs.d/elisp/from_git/sass-mode/")
(add-to-list 'load-path "~/.emacs.d/elisp/from_svn/yasnippet/")
(add-to-list 'load-path "~/.emacs.d/elisp/from_svn/ejacs/")
(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/.emacs.d/elisp/ensime/elisp/")

;(add-to-list 'load-path (cons (concat (getenv "SCALA_HOME") "/misc/scala-tool-support/emacs/") load-path))
(setq load-path (cons (concat (getenv "SCALA_HOME") "/misc/scala-tool-support/emacs/") load-path))

;; install-elisp
;; http://www.emacswiki.org/emacs/download/install-elisp.el
;;(require 'install-elisp)

;; init-loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;; auto-install
;; http://www.emacswiki.org/emacs/auto-install.el
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup) 
