;;(require 'use-package)


;; (use-packge ace-jump-mode
;; 	    :ensure t
;; 	    :disabled t
;; 	    :load-path "~/.emacs.d/el-get/ace-jump-mode/"
;; 	    :bind ("C-c SPC" . ace-jump-mode)
;; 	    :command ace-jump-mode
;; 	    :init
;; 	    (progn
;; 	      (require 'ace-jump-mode)
;; 	      (autoload
;; 		'ace-jump-mode
;; 		"ace-jump-mode"
;; 		"Emacs quick move minor mode"
;; 		t)    
;; 	      (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; 	      (autoload
;; 		'ace-jump-mode-pop-mark
;; 		"ace-jump-mode"
;; 		"Ace jump back:-)"
;; 		t)
;; 	      (eval-after-load "ace-jump-mode"
;; 		'(ace-jump-mode-enable-mark-sync))
;; 	      (define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)))




;;; Ace-Jump-Mode 
;; ace jump mode major function
(add-to-list 'load-path "~/.emacs.d/el-get/ace-jump-mode/")
(require 'ace-jump-mode)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; enable a more powerful jump back function from ace jump mode

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;If you use viper mode :
;; (define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;; (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
