
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(package-selected-packages
   (quote
    (tramp company-terraform company terraform-mode hcl-mode puppet-mode material-theme)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "simp" :slant normal :weight normal :height 98 :width normal)))))

;; ADD DIRECTORY .emacs.d/lisp/
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; ENABLE MELPA REPOSITORY
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))


;; MATERIAL THEME
;; package-install RET material-theme
(load-theme 'material t)


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


;; ALIAS ENVIRONMENT
(defalias 'tf 'terraform-mode)
(defalias 'pp 'puppet-mode)
(defalias 'search 'search-forward)
(defalias 'txt 'text-mode)
(defalias 'shell 'eshell)
(defalias 'terminal 'eshell)
(defalias 'erc 'irc)

;; KEYBOARD SHOTCUTS
(global-set-key [(control tab)] 'switch-to-next-buffer)
(global-set-key [(C-iso-lefttab)] 'switch-to-prev-buffer)
(global-set-key [(f12)] 'eshell)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key [(control z)] 'undo)

;; PAIR () {} []
(electric-pair-mode 1)


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


;; SHOW FILENAME IN TITLE
(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))


;; ENVIRONMENT VARIABLES FOR ORACLE CLOUD
(setenv "TF_VAR_tenancy_ocid" "ocid1.tenancy.oc1..aaaaaaaam4zvb7w5yl5yyebcfn6524bdriiz7tcc4zqqesoci3zo65dtqe3a")
(setenv "TF_VAR_compartment_ocid" "ocid1.compartment.oc1..aaaaaaaahuf2n3n5o35l2db4nxgq2uxhk4erud2g6432d37un47ol7jhyqoq")
(setenv "TF_VAR_user_ocid" "ocid1.user.oc1..aaaaaaaa7xjz5tjbvin3ck6ldaihqz46clod6ybj5gvnmg65typxxmbjlavq")
(setenv "TF_VAR_fingerprint" "18:92:a3:fb:e4:51:a1:ee:02:8e:a6:3c:4c:11:a2:4c")
(setenv "TF_VAR_private_key_path" "/home/denisrfe/Public/sankhyalabs/terraform-architecture-aws/terraform/jiva-ocloud/keys/mgeweb.pem")

(setq transient-history nil)

