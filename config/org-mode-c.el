;;; Org-mode Settings

(setq org-src-fontify-natively t)

;; Select some code and "C-c c" to mark it in orgmode's syntax.
(defun org-wrap-source ()
  (interactive)
  (let ((start (min (point) (mark)))
        (end (max (point) (mark))))
    (goto-char end)
    (unless (bolp)
      (newline))
    (insert "#+END_SRC\n")
    (goto-char start)
    (unless (bolp)
      (newline))
    (insert "#+BEGIN_SRC\n")
    (backward-char)
    (insert " ")))

(global-set-key (kbd "C-c c") 'org-wrap-source)
