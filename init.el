;; melpa settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; close emacs
;; (defun ask-before-closing ()
;;   "Close only if y was pressed."
;;   (interactive)
;;   (if (y-or-n-p (format "Are you sure you want to close this frame? "))
;;       (save-buffers-kill-emacs)
;;     (message "Canceled frame close")))

;; (global-set-key (kbd "C-x C-c") 'ask-before-closing)

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

;; material-theme
(use-package material-theme
  :ensure t)

;; open emacs in full screen mode
;; (add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; remove highlighting the text b/w point and mark
(transient-mark-mode -1)

;; inhibit splash screen 
(setq inhibit-startup-screen t)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; solarized theme
;; (load-theme 'solarized-light t)
;;; M-x disable-theme
;;; enter the theme name you want to disable
;; (load-theme 'solarized-dark t)
;; (load-theme 'spacemacs-light t)
(load-theme 'spacemacs-dark t)

;; global line number mode
(global-linum-mode t)

;; column number mode
(column-number-mode t)

;; better defaults
(use-package better-defaults
  :ensure t)

;; python settings

(use-package elpy
  :ensure t)

(use-package projectile
  :delight '(:eval (concat " " (projectile-project-name)))
  :ensure t)

(use-package magit
  :ensure t)

(use-package py-autopep8
  :ensure t
  :hook python-mode)

(use-package blacken
  :ensure t
  :hook python-mode)

;; (use-package blacken
;;   :after (python)
;;   :init
;;   (add-hook 'python-mode-hook #'blacken-mode))

;; emacs display settings
(set-face-attribute 'default nil :height 150)

;; set default directory
(setq default-directory "C:\\Users\\sarat.chinni\\Codes_sequencing\\")

;; elpy enable
(elpy-enable)

;; ipython repl
;; (setq python-shell-interpreter "ipython"
;;      python-shell-interpreter-args "console --simple-prompt"
;;      python-shell-prompt-detect-failure-warning nil)
;;(add-to-list 'python-shell-completion-native-disabled-interpreters
;;             "ipython")

;; pipenv
;; (use-package pipenv
;;   :ensure t
;;   :hook (python-mode . pipenv-mode))

;; conda
(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home "C:\\Users\\sarat.chinni\\Anaconda3\\")
  (setq conda-env-home-directory "C:\\Users\\sarat.chinni\\Anaconda3\\"))

;; bash
(defun run-bash ()
  (interactive)
  (let ((shell-file-name "C:\\Program Files\\Git\\bin\\bash.exe"))
    (shell "*bash*")))

;; elpy ipython 
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; (setq python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display_page=True")

;; emacs-jupyter
(use-package jupyter
  :ensure t)

;; sphinx-doc
(use-package sphinx-doc
  :ensure t
  :delight
  :diminish sphinx-mode
  :after (python)
  :init (add-hook 'python-mode-hook #'sphinx-doc-mode))

;; realgud
(use-package realgud
  :ensure t)

;; projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  ;; (setq projectile-indexing-method 'alien)  
  (projectile-mode +1))

;; install server 
(require 'server)
(if (not (server-running-p)) (server-start))

(defun my-done ()
  "Exit server buffers and hide the main Emacs window"
  (interactive)
  (server-edit)
  (make-frame-invisible nil t))

(global-set-key (kbd "C-x C-c") 'my-done)
(global-set-key (kbd "C-M-c") 'save-buffers-kill-emacs)

;; Windows path
(when (eq system-type 'windows-nt)

  ;; Make sure Unix tools are in front of `exec-path'
  (let ((bash (executable-find "ls")))
    (when bash
      (push (file-name-directory bash) exec-path)))

  ;; Update PATH from exec-path
  (let ((path (mapcar 'file-truename
                      (append exec-path
                              (split-string (getenv "PATH") path-separator t)))))
    (setenv "PATH" (mapconcat 'identity (delete-dups path) path-separator))))

;; helm
(use-package helm
  :ensure t
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files)
         ("C-x r b" . helm-bookmarks)
         )
  )

;; (global-set-key (kbd "M-x") 'helm-M-x)

(helm-mode 1)

;; helm projectile
(use-package helm-projectile
  :ensure t
  :config
  (require 'helm-projectile)
  (helm-projectile-on))

;; helm ag
(use-package helm-ag
  :ensure t)

;; helm config
(require 'helm-config)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

;; (global-set-key (kbd "C-x b") 'helm-buffers-list)
;; (global-set-key (kbd "C-x r b") 'helm-bookmarks)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring) 
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

;; evil mode
(use-package evil
  :ensure t
  :config
  (require 'evil)
  (evil-mode 1))

;; scratch mode
(use-package scratch
  :ensure t
  :config
  (define-key (current-global-map) "\C-cs" #'scratch))

;; macrostep
(use-package macrostep
  :ensure t
  :bind ("C-c e m" . macrostep-expand))

;; elpy rpc python command
(setq elpy-rpc-python-command
   "c:/Users/sarat.chinni/.virtualenvs/biobench-thMxqAli/Scripts/pythonw.exe")

;; command log
(use-package command-log-mode
  :ensure t
  :diminish command-log-mode
  :commands (command-log-mode)
  :bind ("C-c o" . clm/toogle-command-log-buffer)
  )

;; shx
(use-package shx
  :ensure t
  :disabled t)

;; python-info
(use-package python-info
  :ensure t
  :disabled t)

;; treemacs
(use-package treemacs
  :ensure t
  :disabled t)

;; spaceemacs mode line
(use-package spaceline
  :ensure t)

;; mic-paren

;; multi-cursers

;; diminish
(use-package diminish
  :ensure t)

;; delight
(use-package delight
  :ensure t)

;; auto revert mode
(use-package autorevert
   :delight auto-revert-mode)

;; python
(use-package python
  :delight )

(use-package rainbow-mode
  :ensure t
  :delight)

;; undo tree
(use-package undo-tree
  :ensure t)

;; yasnippets
(use-package yasnippet-snippets
  :ensure t)

;; python docstring
(use-package python-docstring
  :ensure t)

;; org mode python babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; helm-slack
(use-package helm-slack
  :ensure t)

;; magit-ls
(defun magit-ls-files ()
  "List tracked files of current repository."
  (interactive)
  (if (derived-mode-p 'magit-mode)
      (magit-git-command "ls-files" default-directory)
    (message "Not in a Magit buffer.")))

