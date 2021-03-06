;; MATERIAL THEME
;; package-install RET material-theme
(load-theme 'material t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (egg gited all-the-icons-dired all-the-icons company-terraform company terraform-mode hcl-mode puppet-mode docker-compose-mode material-theme)))
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "simp" :slant normal :weight normal :height 98 :width normal)))))

;; ENABLE MELPA REPOSITORY
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   ;;'("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; ADD DIRECTORY .emacs.d/lisp/
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; EGG (EMACS GOT GIT
;; package-install RET egg
(require 'egg)

;; DOCKER-COMPOSE MODE
;; package-install RET docker-compose-mode
(require 'docker-compose-mode)

;; PUPPET MODE
;; package-install RET puppet-mode
(require 'puppet-mode)
(defun puppet-auto-align ()
  (unless (puppet-in-string-or-comment-p)
    (puppet-align-block)))

(define-minor-mode puppet-auto-align-mode
  :init-value nil
  :keymap nil
  :lighter "PAl"
  :group 'puppet-lint
  (if puppet-auto-align-mode
      (add-hook 'post-command-hook #'puppet-auto-align nil 'local)
    (remove-hook 'post-command-hook #'puppet-auto-align 'local)))

(add-hook 'puppet-mode-hook #'puppet-auto-align-mode)

;; TERRAFORM MODE
;; package-install RET hcl-mode
;; package-install RET terraform-mode
(require 'hcl-mode)
(require 'terraform-mode)
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)


;; COMPANY MODE
;; package-install RET company
;; package-install RET company-terraform
(require 'company)
(require 'company-terraform)
(add-hook 'after-init-hook 'global-company-mode)

;; ORG MODE
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "STOPPED" "DONE")))
(setq org-agenda-files (list "~/.emacs.d/org/todo.org"))

;; MPG123 MODE
;; sudo apt install mpg123 -y
;; wget -c http://www.gentei.org/~yuuji/software/mpg123el/mpg123.el
(require 'mpg123)

;; DISABLE BACKUP FILES AND ALIAS FOR YES OR NO
(setq make-backup-files nil)
(setq auto-save-default nil)
(fset 'yes-or-no-p 'y-or-n-p)

;; ESHELL CONFIG
;; (eshell-command "touch ~/.emacs.d/custom.el")
(remove-hook 'comint-output-filter-functions
             'comint-postoutput-scroll-to-bottom)

;; ALIAS ENVIRONMENT
(defalias 'tf 'terraform-mode)
(defalias 'pp 'puppet-mode)
(defalias 'search 'search-forward)
(defalias 'txt 'text-mode)
(defalias 'shell 'open-shell)
(defalias 'terminal 'open-shell)
(defalias 'erc 'irc)
(defalias 'git 'egg-status)
(defalias 'eshell 'open-shell)

;; KEYBOARD SHOTCUTS
(global-set-key [(control tab)] 'switch-to-next-buffer)
(global-set-key [(C-iso-lefttab)] 'switch-to-prev-buffer)
(global-set-key [(f10)] 'egg-status)
(global-set-key [(f11)] 'open-shell)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key [(control z)] 'undo)
(global-set-key (kbd "C-c C-c") 'other-window)

;; PAIR () {} []
(electric-pair-mode 1)

;; ALL-THE-ICONS
;; package-install RET all-the-icons
;; package-install RET all-the-icons-dired
;; M-x all-the-icons-install-fonts
(require 'all-the-icons)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; DIRED MODE
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(setq dired-dwim-target t)
(setq dired-listing-switches "-lah")
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; CHANGE EMACS INTERFACE
(tool-bar-mode 0)
(menu-bar-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(scroll-bar-mode 0)
(setq-default ring-bell-function 'ignore)
(display-battery-mode 1)
(set-frame-font "Hack 10" nil t)

;; ENVIRONMENT VARIABLES FOR ORACLE CLOUD
(setenv "TF_VAR_tenancy_ocid" "ocid1.tenancy.oc1..aaaaaaaam4zvb7w5yl5yyebcfn6524bdriiz7tcc4zqqesoci3zo65dtqe3a")
(setenv "TF_VAR_compartment_ocid" "ocid1.compartment.oc1..aaaaaaaahuf2n3n5o35l2db4nxgq2uxhk4erud2g6432d37un47ol7jhyqoq")
(setenv "TF_VAR_user_ocid" "ocid1.user.oc1..aaaaaaaa7xjz5tjbvin3ck6ldaihqz46clod6ybj5gvnmg65typxxmbjlavq")
(setenv "TF_VAR_fingerprint" "18:92:a3:fb:e4:51:a1:ee:02:8e:a6:3c:4c:11:a2:4c")
(setenv "TF_VAR_private_key_path" "/home/denisrfe/.ssh/mgeweb.pem")

;; FUNCTION TO OPEN SHELL 
(defun open-shell ()
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (switch-to-buffer (eshell)))
(add-hook 'my-eshell #'open-shell)


(require 'eshell)
(defun close-shell () 
  (when (not (one-window-p))
    (delete-window)))
(advice-add 'eshell-life-is-too-much :after 'close-shell)
