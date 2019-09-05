;; Author: Chinni Sarat Bhargava
;; Date: 11th July 2019

;; load the init.el
(load "~/.emacs.d/init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (spacemacs-light)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(ein:polymode t)
 '(elpy-get-info-from-shell t)
 '(elpy-project-ignored-directories
   (quote
    (".tox" "build" "dist" ".cask" ".ipynb_checkpoints" ".mypy_cache" ".pytest_cache")))
 '(elpy-shell-display-buffer-after-send t)
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (ein . t))))
 '(package-selected-packages
   (quote
    (emojify python-cell htmlize org-download poly-markdown magithub live-py-mode switch-window origami persp-mode golden-ratio shx csv-mode linum-relative rainbow-mode expand-region mark-multiple swiper emacs-lisp ido-vertical-mode smex pomidor org-pomodoro symon dmenu diminish spaceline flycheck-mypy multi-term ivy use-package)))
 '(pipenv-executable "/usr/local/bin/pipenv")
 '(powerline-default-separator nil)
 '(python-pytest-arguments (quote ("--color" "--failed-first" "-sv" "--maxfail=5")))
 '(symon-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (put 'downcase-region 'disabled nil)
