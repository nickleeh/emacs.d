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

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
;;			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ))
;; elpy
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)

;; Auto install these packages in new Emacs setup: 
(setq my-package-list '( monokai-theme cider ace-jump-mode helm
				     projectile helm-projectile multiple-cursors
				     paredit dired+ magit ace-window))
(mapc 'package-install my-package-list)


;; ;;; el-get:
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)

;; ;; M-x ielm to eval this code to get a list of installed packages:
;; ;; `(setq my-packages
;; ;;        ',(mapcar #'el-get-as-symbol
;; ;;		 (el-get-list-package-names-with-status "installed")))

;; ;; List of package installed by el-get:
;;  (setq my-packages
;;        '(ace-jump-mode ace-window auto-complete cl-lib clojure-mode clojure-snippets dash el-get epl f flycheck flyspell fuzzy git-auto-commit-mode git-commit-mode git-modes helm ispell-multi json let-alist magit package paradox paredit pkg-info popup projectile s yasnippet))

;;  ;; Auto install these packages on a new Emacs setup:
;; (el-get 'sync my-packages)


;;; Load separate config files:
(load "~/.emacs.d/config/ace-jump-mode.el")
(load "~/.emacs.d/config/eshell.el")
(load "~/.emacs.d/config/org-mode-c.el")
(load "~/.emacs.d/config/helm-c.el")
(load "~/.emacs.d/config/projectile-c.el")

;; Programming language specific:
(load "~/.emacs.d/config/clojure.el")
;; (load "~/.emacs.d/config/golang-c.el")
(load "~/.emacs.d/config/python-c.el")

;; (pdf-tools-install)


;;; Set default open program:
;; ;; Openwith
;; (require 'openwith)
;; (openwith-mode t)
;; (setq openwith-associations
;;       (list (list (openwith-make-extension-regexp '("pdf"))
;;                   "zathura" '(file))
;;             (list (openwith-make-extension-regexp '("flac" "mp3" "wav"))
;;                   "vlc" '(file))
;;             (list (openwith-make-extension-regexp '("avi" "flv" "mov" "mp4"
;;                                                     "mpeg" "mpg" "ogg" "rmvb" "wmv"))
;;                   "smplayer" '(file))
;;             (list (openwith-make-extension-regexp '("bmp" "jpeg" "jpg" "png"))
;;                   "ristretto" '(file))
;;             (list (openwith-make-extension-regexp '("doc" "docx" "odt"))
;;                   "libreoffice" '("--writer" file))
;;             (list (openwith-make-extension-regexp '("ods" "xls" "xlsx"))
;;                   "libreoffice" '("--calc" file))
;;             (list (openwith-make-extension-regexp '("odp" "pps" "ppt" "pptx"))
;;                   "libreoffice" '("--impress" file))
;;             ))

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


;; Set the menu/apps key to do emacs's M-x, if on Windows
(cond
 ((string-equal system-type "windows-nt")
  (global-set-key (kbd "<apps>") 'execute-extended-command))
 ((string-equal system-type "darwin")   ; Mac
  t )
 ((string-equal system-type "gnu/linux")
  t))


;; ;; keyfreq:
;; (require 'keyfreq)
;; (keyfreq-mode 1)
;; (keyfreq-autosave-mode 1)


;; multiple-cursors:
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ; When you have an active region that spans multiple lines, the following will add a cursor to each line:

;; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use:
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; First mark the word, then add more cursors.

;; To get out of multiple-cursors-mode, press <return> or C-g. The latter will first disable multiple regions before disabling multiple cursors. If you want to insert a newline in multiple-cursors-mode, use C-j.


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

;; set selection color
(set-face-attribute 'region nil :background "dark orange")

;; Set helm selection color:
(set-face-attribute 'helm-selection nil 
                    :background "dark violet"
                    :foreground "black")


;; Window position and size at start up:
(setq default-frame-alist
      '((top . 0) (left . 200)
        (width . 80) (height . 38)
        (font . "Menlo-12")
        ))

;; Maxmized at start up: (Don't delete)
;; (custom-set-variables
;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))


;; Dired 
(setq dired-listing-switches "-laGh1v --group-directories-first") ; display settings

;; Dired+
(require 'dired+)
(setq  global-dired-hide-details-mode 0) ; show details

;; Default directory:
(setq default-directory (concat (getenv "HOME") "/"))



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

;; yasnippet
;; (setq yas-snippet-dirs "~/.emacs.d/plugins/yasnippet/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide '.emacs)
;;; .emacs ends here
