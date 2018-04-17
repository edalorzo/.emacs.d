;;; sane-defaults.el --- Sane Default Settings

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'sane-defaults)

;;; Code:

(eval-when-compile
  (require 'cl))

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; Lines should be 120 characters wide, not 70
(setq fill-column 120)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000)

(provide 'sane-defaults)
;;; sane-defaults.el ends here
