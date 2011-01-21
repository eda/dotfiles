(add-to-list 'load-path "~/.emacs.d/elisp/anything/")
(require 'anything-config)
;; (setq anything-sources (list anything-c-source-buffers
;;                              anything-c-source-bookmarks
;;                              anything-c-source-recentf
;;                              anything-c-source-file-name-history
;;                              anything-c-source-locate
;; ;                             anything-c-source-buffer-not-found
;;                              anything-c-source-files-in-current-dir
;; ;                             anything-c-source-man-pages
;; ;                             anything-c-source-info-pages
;;                              anything-c-source-complex-command-history
;;                              anything-c-source-emacs-commands
;; ;                             anything-c-source-emacs-functions
;; ;                             anything-c-source-emacs-functions-with-abbrevs
;;                              anything-c-source-google-suggest
;;                              ))
;; (define-key anything-map (kbd "C-p") 'anything-previous-line)
;; (define-key anything-map (kbd "C-n") 'anything-next-line)
;; (define-key anything-map (kbd "C-v") 'anything-next-source)
;; (define-key anything-map (kbd "M-v") 'anything-previous-source)
;; ;(global-set-key (kbd "C-;") 'anything)
;; (global-set-key (kbd "M-;") 'anything)
;; (global-set-key [(control x) (b)] 'anything-for-files)

(define-key global-map (kbd "M-;") 'anything-my-default)
(defun anything-my-default()
  (interactive)
  (anything-other-buffer '( anything-c-source-buffers
                            anything-c-source-bookmarks
                            anything-c-source-recentf
                            anything-c-source-file-name-history
                            anything-c-source-locate
;                             anything-c-source-buffer-not-found
                            anything-c-source-files-in-current-dir
  ;                             anything-c-source-man-pages
 ;                             anything-c-source-info-pages
                            anything-c-source-complex-command-history
                            anything-c-source-emacs-commands
;                             anything-c-source-emacs-functions
;                             anything-c-source-emacs-functions-with-abbrevs
                            anything-c-source-google-suggest
                            )
                         "*anything default*"))
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)
;(global-set-key (kbd "C-;") 'anything)
;(global-set-key (kbd "M-;") 'anything)
(global-set-key [(control x) (b)] 'anything-for-files) 