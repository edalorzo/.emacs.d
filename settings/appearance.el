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

;; makes sure compilation buffer shows ansi colors
(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))


(provide 'appearance)
;;; appearance.el ends here
