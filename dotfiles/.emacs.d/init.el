;; スタートアップメッセージを抑制する
(setq inhibit-startup-message t)

;; バックアップファイルを作成しない
(setq make-backup-files nil)

;; 行番号を表示する
(require 'linum)
(global-linum-mode t)

;; 空白文字を可視化する
;; https://www.emacswiki.org/emacs/WhiteSpace
(require 'whitespace)
(setq whitespace-style '(face spaces tabs))
(global-whitespace-mode t)

;; 対応する括弧を強調表示する
(show-paren-mode t)

;; マウスによる操作を可能にする
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 3)))
(global-set-key [mouse-5] '(lambda () (interactive) (scroll-up   3)))

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (undo-tree emmet-mode git-gutter neotree zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)
(global-set-key [f8] 'neotree-toggle)
(global-undo-tree-mode t)
(global-git-gutter-mode t)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
