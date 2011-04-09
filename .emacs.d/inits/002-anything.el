;;
;; anything
;;
;; (require 'anything-startup)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
;;(require 'anything-c-moccur)
;;(setq moccur-split-word t)
;;(global-set-key (kbd "M-s") 'anything-c-moccur-occur-by-moccur)
;;(global-set-key (kbd "C-;") 'anything-for-files)
;(global-set-key [(control meta o)] 'anything)
(global-set-key (kbd "M-;") 'anything)
(global-set-key (kbd "C-x C-f") 'anything-for-files)
(global-set-key (kbd "C-c f") 'anything-recentf)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x b") 'anything-for-files)
;;(define-key isearch-mode-map (kbd "C-o") 'anything-c-moccur-from-isearch)
;;(define-key isearch-mode-map (kbd "C-M-o") 'isearch-occur)
;;(anything-complete-shell-history-setup-key (kbd "C-o"))
