;;; setup-java.el --- Java Setup

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'setup-java)

(eval-when-compile
  (require 'cl))

(require 'eclim)
(require 'company)
(require 'company-emacs-eclim)

(setq eclimd-autostart t)

(defun my-java-mode-hook ()
  (eclim-mode t)
  (company-mode t)
  (company-emacs-eclim-setup))

(add-hook 'java-mode-hook 'my-java-mode-hook)

;; display error message in echo area
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;;configures autocomplete
(require 'auto-complete-config)
(ac-config-default)

;;enables gradle mode
;; (require 'gradle-mode)
;; (gradle-mode 1)

(provide 'setup-java)
;;; setup-java.el ends here
