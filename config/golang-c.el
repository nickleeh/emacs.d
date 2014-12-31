;;; Package --- Summary
;;; Emacs Golang configuration file.

;;; Commentary:
;;; ~/.emacs.d/golang.el
;;; Author:  nickleeh@hotmail.com

;;; Code:


;; Emacs flymake-mode for the Go programming language
(setenv "GOPATH" "/home/nick/projects/go_project")
(setenv "PATH" (concat (getenv "PATH") ":" "/home/nick/projects/go_project/bin"))
(setq exec-path (append exec-path (list (expand-file-name "/home/nick/projects/go_project/bin"))))


(add-to-list 'load-path "~/.emacs.d/golang")

(require 'go-autocomplete)
;; (require 'auto-complete-config)
(require 'go-mode-load)

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd \"M-.\") 'godef-jump)))

 
;;    flymake
(add-to-list 'load-path "~/projects/go_project/src/github.com/dougm/goflymake")

(require 'go-flymake)

;;    flycheck
(add-to-list 'load-path "/home/nick/.emacs.d/elpa/flycheck-20140728.56")
(add-to-list 'load-path "/home/nick/.emacs.d/elpa/dash-20140717.547")

(require 'go-flycheck)


(add-hook 'after-init-hook #'global-flycheck-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'golang.el)
;;; golang.el ends here
