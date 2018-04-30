;;; setup-perl.el --- Set up Perl

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'setup-perl)

;;; Code:

(eval-when-compile
  (require 'cl))

(load "pde-load")

;; M-SPC not available, window manager take it away
;; nearest key to dabbrev-expand
(global-set-key (kbd "M-;") 'hippie-expand)

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
