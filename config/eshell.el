;; 6. Configuratin for Eshell:

;; C-c C-u kill input:
;;; For Emacs versions before 24.4
(defadvice eshell-kill-input (before go-to-eol ())
  "Go to end of line before killing input"
  (end-of-line))

;; (require 'em-alias)
;; (add-to-list 'eshell-command-aliases-list (list "ll" "ls -l"))
;; (add-to-list 'eshell-command-aliases-list (list "sau" "sudo aptitude update"))
;; (add-to-list 'eshell-command-aliases-list (list "sas" "sudo aptitude search"))
;; (add-to-list 'eshell-command-aliases-list (list "sai" "sudo aptitude install"))

;; Enable smart display (like plan9)
(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
