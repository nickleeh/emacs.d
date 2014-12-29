; Package --- Summary
;;; Emacs configuration file.

;;; Commentary:
;;; ~/.emacs.d/init.el
;;; Author:  nickleeh@hotmail.com

;;; Code:

;;; Package Management
;;; Built-in package tool (add melpa-stable):
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Auto install these packages in new Emacs setup: 
(setq my-package-list '(haskell-mode monokai-theme))
(mapc 'package-install my-package-list)


;;; el-get:
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; M-x ielm to eval this code to get a list of installed packages:
;; `(setq my-packages
;;        ',(mapcar #'el-get-as-symbol
;; 		 (el-get-list-package-names-with-status "installed")))

;; List of package installed by el-get:
(setq my-packages
      '(ace-jump-mode ace-window auto-complete cider cl-lib clojure-mode clojure-snippets dash el-get epl f flycheck flyspell fuzzy git-auto-commit-mode git-commit-mode git-modes helm ispell-multi json let-alist magit monokai-theme openwith package paradox paredit pkg-info popup projectile queue s yasnippet))

;; Auto install these packages on a new Emacs setup:
(el-get 'sync my-packages)


;;; Load separate config files:
(load "~/.emacs.d/config/ace-jump-mode.el")
(load "~/.emacs.d/config/eshell.el")
(load "~/.emacs.d/config/clojure.el")
(load "~/.emacs.d/config/org-mode-c.el")
(load "~/.emacs.d/config/helm-c.el")
(load "~/.emacs.d/config/projectile-c.el")


;;; key-bindings
(global-set-key [?\S- ] 'set-mark-command) ; Use Shift-Space to set mark

;; Remap M-z to zap-up-to-char:
(require 'misc)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key "\M-Z" 'zap-to-char) ; Map M-Z (uppercase) to zap-to-char


;;; Window, theme, and appearance:
;; Monokai-theme
;; https://github.com/oneKelvinSmith/monokai-emacs
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/monokai-theme/")
(load-theme 'monokai t)

;; Font
(setq default-frame-alist '((font . "Menlo-12"))) ; set default font for emacs --daemon / emacsclient





(menu-bar-mode -1)		; turn on/off menu bar
(tool-bar-mode -1)		; turn on/off toolbar
(toggle-scroll-bar nil)		; turn on/off scroll bars
(setq inhibit-startup-screen t) ;  make Emacs switch to a *scratch* buffer right away.

;; Set helm selection color:
(set-face-attribute 'helm-selection nil 
                    :background "dark violet"
                    :foreground "black")


;;; Miscellaneous:
;; Sentence (single space)
(setq sentence-end-double-space nil)


;;; Ace-Window:
(global-set-key (kbd "M-P") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))


;;; Set default open program:
;;(add-to-list 'load-path "/path/to/downloaded/openwith.el")
(require 'openwith)
(setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))
(setq openwith-associations '(("\\.mov\\'" "smplayer" (file))))
(openwith-mode t)
;;It sets file handler that will work from both dired and find-file.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide '.emacs)
;;; .emacs ends here
