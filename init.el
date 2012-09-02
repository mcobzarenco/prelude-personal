
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/magit-1.1.1/")

;; Hidding Hidden Files in Emacs dired (M-o to toggle)
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))


;; Common clipboard with X applications
(setq x-select-enable-clipboard t)


;; Default font
;; (set-default-font "Monaco 10")


;; make kill-line include the ending newline char
(setq kill-whole-line t)


(custom-set-variables
 '(case-fold-search t)
 '(column-number-mode t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(use-dialog-box nil)
 '(delete-selection-mode t) ;; Delete selected text
)


(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; disable startup message
(setq inhibit-startup-message t)


;; alias y to yes and n to no
(defalias 'yes-or-no-p 'y-or-n-p)


;; show a menu only when running within X (save real estate when in console)
(menu-bar-mode (if window-system 1 -1))
(if window-system (tool-bar-mode -1))


;; Git support via magit:
(require 'magit)


;; Auto-indentation:
(define-key global-map (kbd "RET") 'newline-and-indent)


(global-set-key (kbd "C-x 4") 'make-frame-command)
(global-set-key (kbd "C-x O") 'other-frame)

(global-set-key [(super left)] (lambda () (interactive) (other-frame -1)))
(global-set-key [(super right)] 'other-frame)
(global-set-key [(super up)] (lambda () (interactive) (other-window -1)))
(global-set-key [(super down)] 'other-window)
(global-set-key [f5] 'ibuffer)

;; quick bookmark keys
(global-set-key [f10] 'bookmark-set)
(global-set-key [f9] 'bookmark-jump)



(require 'highline)
(global-highline-mode 1)

;; To customize the background color
(set-face-background 'highline-face "light goldenrod yellow")


(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
