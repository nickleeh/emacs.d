;; 5.2 Clojure


;; Clojure:
;; Cider:

;; Append result of evaluating previous expression (Clojure):
(defun cider-eval-last-sexp-and-append ()
  "Evaluate the expression preceding point and append result."
  (interactive)
  (let ((last-sexp (cider-last-sexp)))
    ;; we have to be sure the evaluation won't result in an error
    (cider-eval-and-get-value last-sexp)
    (with-current-buffer (current-buffer)
      (insert ";;=>"))
    (cider-interactive-eval-print last-sexp)))

;; reformat before save:
;; (add-hook 'before-save-hook '(indent-region (point-min) (point-max)))


;; Paredit
(add-to-list 'load-path "~/.emacs.d/paredit")

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; enable font locking for Clojure
(eval-after-load 'clojure-mode '(require 'clojure-mode-extra-font-locking))


;; enable font locking for Clojure
(eval-after-load 'clojure-mode '(require 'clojure-mode-extra-font-locking))
