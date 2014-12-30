; Package --- Summary
;;; Emacs configuration file.

;;; Commentary:
;;; ~/.emacs.d/init.el
;;; Author:  nickleeh@hotmail.com

;;; Code:

;;; Package Management
;;; Built-in package tool (add melpa-stable):


;; package.el
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
;;		 (el-get-list-package-names-with-status "installed")))

;; List of package installed by el-get:
 (setq my-packages
       '(ace-jump-mode ace-window auto-complete cider cl-lib clojure-mode clojure-snippets dash el-get epl f flycheck flyspell fuzzy git-auto-commit-mode git-commit-mode git-modes helm ispell-multi json let-alist magit monokai-theme package paradox paredit pkg-info popup projectile queue s yasnippet))

 ;; Auto install these packages on a new Emacs setup:
(el-get 'sync my-packages)



;;; Load separate config files:
(load "~/.emacs.d/config/ace-jump-mode.el")
(load "~/.emacs.d/config/eshell.el")
(load "~/.emacs.d/config/clojure.el")
(load "~/.emacs.d/config/org-mode-c.el")
(load "~/.emacs.d/config/helm-c.el")
(load "~/.emacs.d/config/projectile-c.el")



(pdf-tools-install)


;;; Set default open program:
;; Openwith
(require 'openwith)
(openwith-mode t)
(setq openwith-associations
      (list (list (openwith-make-extension-regexp '("pdf"))
                  "zathura" '(file))
            (list (openwith-make-extension-regexp '("flac" "mp3" "wav"))
                  "vlc" '(file))
            (list (openwith-make-extension-regexp '("avi" "flv" "mov" "mp4"
                                                    "mpeg" "mpg" "ogg" "rmvb" "wmv"))
                  "smplayer" '(file))
            (list (openwith-make-extension-regexp '("bmp" "jpeg" "jpg" "png"))
                  "ristretto" '(file))
            (list (openwith-make-extension-regexp '("doc" "docx" "odt"))
                  "libreoffice" '("--writer" file))
            (list (openwith-make-extension-regexp '("ods" "xls" "xlsx"))
                  "libreoffice" '("--calc" file))
            (list (openwith-make-extension-regexp '("odp" "pps" "ppt" "pptx"))
                  "libreoffice" '("--impress" file))
            ))

(setq large-file-warning-threshold 500000000) ; set the value that will trigger the warning. Here, 500MB

;; Helm
(setq helm-external-programs-associations (quote (("rmvb" . "smplayer") ("mp4" . "smplayer"))))



;;; key-bindings
(global-set-key [?\S- ] 'set-mark-command)	 ; Shift-Space to set mark
(global-set-key (kbd "C-x g") 'magit-status)	 ; C-x g to launch Magit

;; Remap M-z to zap-up-to-char:
(require 'misc)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key "\M-Z" 'zap-to-char) ; Map M-Z (uppercase) to zap-to-char


;; keyfreq:
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

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

;; Dired 
(setq dired-listing-switches "-laGh1v --group-directories-first") ; display settings

;; Dired+
(require 'dired+)
(setq  global-dired-hide-details-mode 0) ; show details


;;; Miscellaneous:
;; Sentence (single space)
(setq sentence-end-double-space nil)

;; ispell:
;; use apsell as ispell backend  
;;(setq-default ispell-program-name "aspell")  
;; use American English as ispell default dictionary  
(ispell-change-dictionary "american" t) 


;;; Ace-Window:
(global-set-key (kbd "C-x o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide '.emacs)
;;; .emacs ends here
