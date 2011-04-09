(require 'server)
(unless (server-running-p) (server-start))

;;; 現在行に色を付ける
(require 'hl-line)
(defface my-hl-line-face
  '((((class color)
      (background dark))    ;; 背景色が暗い色のとき
     (:background "#222244"))
    (((class color)
      (background light))    ;; 背景色が明るい色のとき
     (:background "LightSteelBlue1"))
;     (:background "#222244"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode)
;;;(global-hl-line-mode 1)
;;;(setq hl-line-face 'underline)
;;; 履歴を次回Emacs起動時にも保存する
(savehist-mode 1)

(defun x->bool (elt) (not (not elt)))

;; emacs-version predicates
(setq emacs22-p (string-match "^22" emacs-version)
        emacs23-p (string-match "^23" emacs-version)
	  emacs23.0-p (string-match "^23\.0" emacs-version)
	    emacs23.1-p (string-match "^23\.1" emacs-version)
	      emacs23.2-p (string-match "^23\.2" emacs-version))

;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

(when darwin-p
  ;;; mac用フォント設定
  (set-face-attribute 'default nil
                      :family "monaco"
                      :height 140)
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0208
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0212
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))
  (set-fontset-font
    (frame-parameter nil 'font)
    'mule-unicode-0100-24ff
   '("monaco" . "iso10646-1"))
   ;; 半角カナのために↓を追加
   (set-fontset-font
    (frame-parameter nil 'font)
    'katakana-jisx0201
    '("Hiragino Maru Gothic Pro" . "iso10646-1"))
   (setq face-font-rescale-alist
        '(("^-apple-hiragino.*" . 1.0)
          (".*osaka-bold.*" . 1.0)
          (".*osaka-medium.*" . 1.0)
          (".*courier-bold-.*-mac-roman" . 0.8)
          (".*monaco cy-bold-.*-mac-cyrillic" . 0.8)
          (".*monaco-bold-.*-mac-roman" . 0.8)
          ("-cdac$" . 0.9)))
)
;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)
;; エンコーディングは基本的にUTF-8
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;; ヴィジブルベルを抑制
(setq visible-bell nil)
;; バックアップしない
(setq make-backup-files nil)
;; 自動保存したファイルを削除する。
(setq delete-auto-save-files t)
;; 自動セーブしない。
(setq auto-save-default nil)
;; kill-lineで行末の改行文字も削除
(setq kill-whole-line t)
;; リージョンをC-hで削除
(delete-selection-mode 1)
;; インデントはスペースで
(setq-default indent-tabs-mode nil)
;; C-x C-iでリージョンをインデント
(global-set-key "\C-x\C-i" 'indent-region)
(global-set-key "\C-m" 'newline-and-indent)
;; ファイル内のカーソル位置を記憶する
(setq-default save-place t)
(require 'saveplace)
;; 対応する括弧を表示させる
(show-paren-mode 1)
;; C-hは後退に割り当てる
(global-set-key (kbd "C-h") 'delete-backward-char)
;; モードラインに時刻を表示する
(display-time)
;; 行数、列数を表示
(line-number-mode t)
(column-number-mode t)
;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))
;; ログの記録行数を増やす
(setq message-log-max 10000)
;; ミニバッファを再帰的に呼び出せるようにする
(setq enable-recursive-minibuffers t)
;; ダイアログブックスを使わないようにする
(setq use-dialog-box nil)
(defalias 'message-box 'message)
;; 履歴をたくさん保存する
(setq history-length 1000)
;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)
;; 大きいファイルを開こうとしたときに警告を発生させる
(setq large-file-warining-threshold (* 25 1024 1040))
;; ミニバッファで入力を取り消しても履歴に残す
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))
;; yes/noを、y/nで選択できるようにする。
(fset 'yes-or-no-p 'y-or-n-p)
;; メニューバー、ツールバー非表示
(menu-bar-mode nil)
(tool-bar-mode nil)
;; ファイル名がかぶったときにバッファ名をわかりやすくする
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
;; バッファ切り替えに中間一致を
(iswitchb-mode 1)
(setq read-buffer-function 'iswitchb-read-buffer)
(setq iswitchb-regexp nil)
(setq iswitchb-prompt-newbuffer nil)

;;
;; recentf.el
;; (autoinstall)
;(setq recentf-max-saved-items 500)
;(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
;(require 'recentf-ext)

;;
;; 
;;
;(require 'migemo)
;; (setq migemo-command "/usr/local/bin/cmigemo")
;; (setq migemo-options '("-q" "--emacs"))
;; (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)




