;;; appearance.el --- appearance

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'appearance)

;;; Code:

(eval-when-compile
  (require 'cl))

(when window-system
  (set-frame-font "Fira Code" nil t)
  (set-face-attribute 'default nil :height 250)
  (custom-set-variables
   '(initial-frame-alist (quote ((fullscreen . maximized))))))

(provide 'appearance)
;;; appearance.el ends here
