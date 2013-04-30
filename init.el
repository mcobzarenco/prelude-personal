
;; C-h c  to find out about what a key combination does (also C-h k and C-h K)

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/magit-1.1.1/")

(require 'thrift-mode)

(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 30)
(setq sr-speedbar-console 30)
(setq sr-speedbar-auto-refresh nil)
(setq speedbar-show-unknown-files t)


;; Hidding Hidden Files in Emacs dired (M-o to toggle)
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))


;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)


;; Common clipboard with X applications
(setq x-select-enable-clipboard t)


;; Default font
;; (set-default-font "Inconsolata 12")


;; make kill-line include the ending newline char
(setq kill-whole-line t)
(global-set-key (kbd "C-k") 'kill-whole-line)


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


;; fix prompt in shell
(setenv "PROMPT_COMMAND" "")


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

;; (global-set-key [(super left)] (lambda () (interactive) (other-frame -1)))
;; (global-set-key [(super right)] 'other-frame)
;; (global-set-key [(super up)] (lambda () (interactive) (other-window -1)))
;; (global-set-key [(super down)] 'other-window)

(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<down>")  'windmove-down)

(global-set-key [f5] 'ibuffer)

;; quick bookmark keys
(global-set-key [f10] 'bookmark-set)
(global-set-key [f9] 'bookmark-jump)

(global-set-key (kbd "C-<prior>") 'previous-buffer)
(global-set-key (kbd "C-<next>") 'next-buffer)

(global-linum-mode 1) ; display line numbers in margin. Emacs 23 only.


(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
