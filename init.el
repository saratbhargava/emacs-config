;; init.el --- Emacs configuration

;; Melpa settings
(require 'package)
;(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; spacemacs theme
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

;; solarized-theme
(unless (package-installed-p 'solarized-theme)
  (package-refresh-contents)
  (package-install 'solarized-theme))

;; load config from org mode file
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; open emacs in full screen mode
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; remove highlighting the text b/w point and mark
(transient-mark-mode -1)

;; inhibit splash screen 
(setq inhibit-startup-screen t)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; ispell config
(setq ispell-program-name "/usr/local/bin/ispell")


;; solarized theme
;; (load-theme 'solarized-light t)
;;; M-x disable-theme
;;; enter the theme name you want to disable
;; (load-theme 'solarized-dark t)
;; (load-theme 'spacemacs-light t)
(load-theme 'spacemacs-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (multi-term ivy use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

