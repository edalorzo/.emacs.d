;;; setup-tramp.el --- 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'setup-tramp)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(provide 'setup-tramp)
;;; setup-tramp.el ends here
