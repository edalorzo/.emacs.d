;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Turn off mouse interface early in starup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;; Defines repositories for dependencies
  (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))

;; makes sure user-emacs-directory is defined
(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory
    (let ((home (getenv "HOME")))
      (if home (concat home "/.emacs.d") "."))))

;; ;; makes sure environment is properly setup for mac users
(setenv "SHELL" "/bin/bash")
(when (memq window-system '(mac ns x))
  (defvar exec-path-from-shell-variables
    '("LANG" "LC_CTYPE" "LC_ALL" "PERL5LIB" "PERL_LOCAL_LIB_ROOT" "NVM_DIR"))
  (exec-path-from-shell-initialize))

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

(setq shell-file-name "/bin/bash")

;; loads other requirements here
;; this is work in progress
(require 'better-defaults)
(require 'appearance)
(require 'sane-defaults)
(require 'key-bindings)

(require 'setup-tramp)
(when (>= emacs-major-version 24)
  (require 'magit)
  (require 'setup-perl)
  (require 'setup-java)
  (require 'setup-js))

;; I may need to deal with the case when
;; a library is not installed e.g.
;; (when (require 'some-library nil 'noerror)
;;   do-things)

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; starts the emacs server
(when (>= emacs-major-version 24)
  (unless (server-running-p)
    (server-start)))
