;;
;; rvm.el
;; http://github.com/senny/rvm.el
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

; Ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files")
(setq auto-mode-alist
      (append '(("¥¥.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" .ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
            (inf-ruby-keys)
          ))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

;; ruby-electric.el --- electric editing commands for ruby files
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; ruby-mode でのインデントの設定。スペース 2 個の場合（これがデフォルト）。その他、設定は M-x customize-group RET ruby で。
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)


;;
;;rcodetools
;;
(add-to-list 'load-path (expand-file-name "~/.rvm/gems/ruby-1.9.2-p0/gems/rcodetools-0.8.5.0/"))
(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun make-ruby-scratch-buffer ()
  (with-current-buffer (get-buffer-create "*ruby scratch*")
    (ruby-mode)
    (current-buffer)))
(defun ruby-scratch ()
  (interactive)
  (pop-to-buffer (make-ruby-scratch-buffer)))
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
  (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
  (define-key ruby-mode-map "\C-c\C-d" 'xmp)
  (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

;;
;; rspec-mode
;;
;; (install-elisp "http://perso.tls.cena.fr/boubaker/distrib/mode-compile.el")
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
;; (global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
;; (global-set-key "\C-ck" 'mode-compile-kill)

;;
;; ruby db
;;
(autoload 'rubydb "rubydb3x" "Run rubydb on program FILE in buffer *gud-FILE*.
The directory containing FILE becomes the initial working directory
and source-file directory for your debugger.")

;; ;;
;; ;; ruby block
;; ;;
;(require 'ruby-block)
;(setq ruby-block-highlight-toggle t)
;(defun ruby-mode-hook-ruby-block()
;  (ruby-block-mode t))
;(add-hook 'ruby-mode-hook 'ruby-mode-hook-ruby-block)

(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/elisp/from_git/yasnippets-rails/rails-snippets/")