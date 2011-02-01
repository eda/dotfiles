;; scala mode
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

(require 'scala-mode-feature-electric)
(add-hook 'scala-mode-hook
	  (lambda ()
	    (scala-electric-mode)))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;(define-key scala-mode-map (kbd "C-cC-b") 'scala-eval-buffer)

