;;; setup-magit.el --- magit setup


;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'setup-magit)

(eval-when-compile
  (require 'cl))

;; (global-set-key (kbd "C-x g") 'magit-status)
;; (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-magit-file-mode 1)

(provide 'setup-magit)
;;; setup-magit.el ends here
