;;; setup-clojure.el --- Configures Clojure features

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'setup-clojure)

;;; Code:

(eval-when-compile
  (require 'cl))

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(unless (package-installed-p 'cider)
  (package-install 'cider))

(provide 'setup-clojure)
;;; setup-clojure.el ends here
