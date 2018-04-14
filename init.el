;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Turn off mouse interface early in starup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(package-initialize)

;; No splash screen please...jeez!
(setq inhibit-startup-message t)

;; Sets some relevant path directories
(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))
(setq settings-dir (expand-file-name "settings" user-emacs-directory))

;; Set up the load path
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path settings-dir)

;; Keep emacs custom-settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Adds external dependency paths to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Writes backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Defines repositories for dependencies

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq shell-file-name "/bin/bash")


(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(load "pde-load")
(defalias 'perl-mode 'cperl-mode)

;; loads other requirementes here
;; this is work in progress
(require 'better-defaults)
(require 'magit)

(set-frame-font "Fira Code 18" nil t)

;; sane defaults

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Don't break lines for me, please
(setq-default truncate-lines t)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
