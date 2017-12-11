(load "~/.emacs.d/lisp/PG/generic/proof-site")
(require 'package)

;; Add melpa package source when using package list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq make-backup-files nil)
(setq auto-save-default nil) ; stop creating #autosave# files

(define-key global-map [(meta up)] '(lambda() (interactive) (scroll-other-window -1)))
(define-key global-map [(meta down)] '(lambda() (interactive) (scroll-other-window 1)))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (markdown-mode rjsx-mode neotree auto-complete solarized-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'tango-dark t)

;; this is for customizing proof general key bindings
(eval-after-load "proof-script"
  '(progn
     (define-key proof-mode-map (kbd "C-c RET")
       'proof-goto-point)
     ))

;; default splitting vertically
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; disable auto indentation
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; enable auto bracket
(electric-pair-mode 1)
(auto-complete-mode 1)

;; always use space indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default js-indent-level 2)
(setq neo-window-width 30) 
(setq neo-persist-show nil)
;; (add-hook 'after-init-hook #'neotree-toggle)
;; (autoload 'neotree "neotree" "" t) 
(neotree-toggle)
(switch-to-buffer-other-window "*scratch*")
;; (xterm-mouse-mode 1)
;; (windmove-default-keybindings)

(global-unset-key (kbd "M-j"))
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-j") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "M-k") (lambda () (interactive) (other-window 1)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
