;;; setup-java.el --- Java Setup

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'setup-java)

;;; Code:

(eval-when-compile
  (require 'cl))

(setenv "JAVA_HOME" (substitute-in-file-name "$HOME/.sdkman/candidates/java/current"))

(require 'eclim)
(setq eclimd-autostart t)

(defun my-java-mode-hook ()
    (eclim-mode t))

(add-hook 'java-mode-hook 'my-java-mode-hook)

(setq eclim-eclipse-dirs '("/Applications/Eclipse.app/Contents/Eclipse"))
(setq eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
(setq eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/plugins/org.eclim_2.7.2/bin/eclim")

;; display error message in echo area
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;;configures autocomplete
(require 'auto-complete-config)
(ac-config-default)

;;(require 'ac-emacs-eclim-source)
;;(ac-emacs-eclim-config)

;;enables company mode which provies popup dialogs for autocompletion
;(require 'company)
;(require 'company-emacs-eclim)

;(company-emacs-eclim-setup)
;(global-company-mode t)

;;enables gradle mode
;; (require 'gradle-mode)
;; (gradle-mode 1)

(provide 'setup-java)
;;; setup-java.el ends here
