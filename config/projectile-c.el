;;; Projectile:
;; (add-to-list 'load-path "~/.emacs.d/el-get/projectile")
;; (add-to-list 'load-path "~/.emacs.d/el-get/s")
;; (add-to-list 'load-path "~/.emacs.d/el-get/f")
;; (add-to-list 'load-path "~/.emacs.d/el-get/dash")
;; (add-to-list 'load-path "~/.emacs.d/el-get/pkg-info")
;; (add-to-list 'load-path "~/.emacs.d/el-get/epl")

; (package-initialize) 
(require 'projectile)
(require 'helm-projectile)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; Caching

;; Usage: In large projects, caching can significantly speedup file and directory listings, making it display instantly. Caching is enabled by:

(setq projectile-enable-caching t)
;; C-c p i to refresh the whole cache.
