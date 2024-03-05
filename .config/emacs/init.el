;; Line number mode
(setq line-number-mode t)
(setq column-number-mode t)

;; Disable menu bar
(menu-bar-mode -1)

;; Stop throwing me to EOF
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

(setq-default indent-tabs-mode nil)

;; Don't make backup files
(setq make-backup-files nil)

;; Package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use-package
(straight-use-package 'use-package)

;; Themes
(straight-use-package 'autothemer)
(load-file (expand-file-name "themes/rose-pine-theme.el" user-emacs-directory))
(load-theme 'rose-pine t)

;; flymake
(require 'flymake)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

;; Google C++ Style (with namespace fix)
(load-file (expand-file-name "google-c-style.el" user-emacs-directory))
(add-hook 'c-mode-common-hook 'google-set-c-style)
;; C++ style comments
(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))

;; YAML Mode
(load-file (expand-file-name "yaml-mode.el" user-emacs-directory))

;; File extensions
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; Tell emacs to alias us-ascii to ascii
(define-coding-system-alias 'ascii 'us-ascii)

;; Fill Paragraph options
(setq-default fill-column 80)
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; Lua Mode
(straight-use-package 'lua-mode)
(setq lua-indent-level 2)

;; Rust Mode
(straight-use-package 'rust-mode)
(setq rust-indent-offset 2)

;; Go Mode
(straight-use-package 'go-mode)

;; Markdown Mode
(straight-use-package 'markdown-mode)

;; Typescript Mode
(straight-use-package 'typescript-mode)

;; CMake Mode
(straight-use-package 'cmake-mode)

;; Dockerfile Mode
(straight-use-package 'dockerfile-mode)

;; JS Mode
(setq js-indent-level 2)
