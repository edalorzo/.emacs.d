;;; setup-perl.el --- Set up Perl

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'setup-perl)

;;; Code:

(eval-when-compile
  (require 'cl))

;; (setenv "LANG" "en_US.UTF-8")
;; (setenv "LC_CTYPE" "en_US.UTF-8")
;; (setenv "LC_ALL" "en_US.UTF-8")

;; (setq perl5-home-dir (substitute-in-file-name "$HOME/perl5"))

;; (setenv "PERL5LIB" (concat perl5-home-dir "/lib/perl5"))
;; (setenv "PERL_LOCAL_LIB_ROOT" perl5-home-dir)
;; (setenv "PATH" (concat  perl5-home-dir "/bin:" (getenv "PATH")))

;; (add-to-list 'exec-path (concat perl5-home-dir "/bin"))
;; (add-to-list 'exec-path "/usr/local/bin")

(load "pde-load")
(defalias 'perl-mode 'cperl-mode)

;; M-SPC not available, window manager take it away
(global-set-key (kbd "M-'") 'just-one-space)
(global-set-key (kbd "C-M-=") 'pde-indent-dwim)
;; nearest key to dabbrev-expand
(global-set-key (kbd "M-;") 'hippie-expand)
(global-set-key (kbd "C-;") 'comment-dwim)
(global-set-key (kbd "C-c f") 'comint-dynamic-complete)

(setq hippie-expand-try-functions-list
          '(try-expand-line
            try-expand-dabbrev
            try-expand-line-all-buffers
            try-expand-list
            try-expand-list-all-buffers
            try-expand-dabbrev-visible
            try-expand-dabbrev-all-buffers
            try-expand-dabbrev-from-kill
            try-complete-file-name
            try-complete-file-name-partially
            try-complete-lisp-symbol
            try-complete-lisp-symbol-partially
            try-expand-whole-kill))

(autoload 'comint-dynamic-complete "comint" "Complete for file name" t)
(setq comint-completion-addsuffix '("/" . ""))

(defun pde-perl-mode-hook ()
  (abbrev-mode t)
  (add-to-list 'cperl-style-alist
               '("PDE"
                 (cperl-auto-newline                         . t)
                 (cperl-brace-offset                         . 0)
                 (cperl-close-paren-offset                   . -4)
                 (cperl-continued-brace-offset               . 0)
                 (cperl-continued-statement-offset           . 4)
                 (cperl-extra-newline-before-brace           . nil)
                 (cperl-extra-newline-before-brace-multiline . nil)
                 (cperl-indent-level                         . 4)
                 (cperl-indent-parens-as-block               . t)
                 (cperl-label-offset                         . -4)
                 (cperl-merge-trailing-else                  . t)
                 (cperl-tab-always-indent                    . t)))
  (cperl-set-style "PDE"))

(provide 'setup-perl)
;;; setup-perl.el ends here
