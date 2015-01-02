;; (when (executable-find "ipython")
;;   (setq
;;    python-shell-interpreter "ipython"
;;    python-shell-interpreter-args ""
;;    python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;    python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;    python-shell-completion-setup-code
;;    "from IPython.core.completerlib import module_completion"
;;    python-shell-completion-module-string-code
;;    "';'.join(module_completion('''%s'''))\n"
;;    python-shell-completion-string-code
;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))



(load "~/.emacs.d/emacs-for-python/epy-init.el")

(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(require 'epy-nose)       ;; For nose integration

;; Flymaek checker
(epy-setup-checker "pyflakes %f")

;; django snippets
;; (epy-django-snippets)

;; ipython integration
(epy-setup-ipython)

;; line highlighting

;; You may want to enable this feature with the color you prefer, to
;; do so, drop one of the following lines in your .emacs

(global-hl-line-mode t)		       ;; To enable
(set-face-background 'hl-line "black") ;; change with the color that you like
;; for a list of colors: http://raebear.net/comp/emacscolors.html

;; Highlight Indentation

;; Interesting way to have a visual clue on how the code is indented:

;; https://github.com/gabrielelanaro/emacs-for-python/raw/master/doc/highlight_line_ind.png

(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)

;; disabling the auto-pairing of parenthesis

;; To disable the auto-pairing, drop the following line:

;; (setq skeleton-pair nil) 

;; Nosetests keybindings

;; First of all, install nosetests. Then open a python file in your
;; project and: “C-c a“: run all test “C-c m“: run tests in the
;; module “C-c .“: run test under cursor

;; “C-c p a“, “C-c p m“, “C-c p .“: same as above but drop in
;; pdb when there’s an error (Very useful!)

;; Disabling ropemacs

;; Just add the line to your .emacs

;; (setq epy-enable-ropemacs nil)


;; ;; jedi
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)                 ; optional

;; ;; elpy
;; (package-initialize)
;; (elpy-enable)
