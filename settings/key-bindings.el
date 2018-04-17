;;; key-bindings.el --- Key Bindings

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'key-bindings)

;;; Code:

(eval-when-compile
  (require 'cl))

(global-set-key (kbd "<home>") 'beginning-of-line-text)
(global-set-key (kbd "<end>") 'end-of-line)

(global-set-key (kbd "M-<home>") 'beginning-of-buffer)
(global-set-key (kbd "M-<end>") 'end-of-buffer)

(provide 'key-bindings)
;;; key-bindings.el ends here
