;; スタートアップメッセージを抑制する
(setq inhibit-startup-message t)

;; バックアップファイルを作成しない
(setq make-backup-files nil)

;; 行番号を表示する
(require 'linum)
(global-linum-mode 1)

;; 空白文字を可視化する
;; https://www.emacswiki.org/emacs/WhiteSpace
(require 'whitespace)
(setq whitespace-style '(face spaces tabs))
(global-whitespace-mode 1)

;; 対応する括弧を強調表示する
(show-paren-mode t)
