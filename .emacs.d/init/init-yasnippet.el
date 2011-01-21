;; load-pathにyasnippetのパスを通す
(setq load-path (cons (expand-file-name "~/.emacs.d/elisp/yasnippet/") load-path))

;; yasnippetのロード
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elisp/yasnippets-rails/rails-snippets")

;; http://d.hatena.ne.jp/IMAKADO/20080401/1206715770
(add-to-list 'load-path "~/.emacs.d/elisp/anything-c-yasnippet/")
(require 'anything-c-yasnippet)
(setq anything-c-yas-space-match-any-greedy t) ;スペース区切りで絞り込めるようにする デフォルトは nil
(global-set-key (kbd "C-c y") 'anything-c-yas-complete) ;C-c yで起動 (同時にお使いのマイナーモードとキーバインドがかぶるかもしれません)
(yas/initialize)
;(add-to-list 'yas/extra-mode-hooks 'ruby-mode-hook)
;(add-to-list 'yas/extra-mode-hooks 'cperl-mode-hook)
