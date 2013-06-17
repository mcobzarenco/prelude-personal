;; C-h c  to find out about what a key combination does (also C-h k and C-h K)

(add-to-list 'load-path "~/.emacs.d/personal/modules/")

;; enable arrow keys
;; (setq prelude-guru nil)


;; disable whitespace
(setq prelude-whitespace nil)

;; setup jedi (auto-completion in python)
(add-hook 'prelude-python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:setup-keys t)

(require 'thrift-mode)

(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 40)
(setq sr-speedbar-console 40)
(setq sr-speedbar-auto-refresh nil)
(setq speedbar-show-unknown-files t)


;; Hidding Hidden Files in Emacs dired (M-o to toggle)
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))


;; markdown mode
;;(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; Goto-line short-cut key
;; (global-set-key "\C-l" 'goto-line)


;; Common clipboard with X applications
(setq x-select-enable-clipboard t)


;; hide menu-bar, tool-bar, and scroll-bar forever
;; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)


(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; Default font
;; (set-default-font "Inconsolata 12")


;; make kill-line include the ending newline char
(setq kill-whole-line t)
(global-set-key (kbd "C-k") 'kill-whole-line)



;; (custom-set-variables
;;  '(case-fold-search t)
;;  '(column-number-mode t)
;;  '(scroll-bar-mode (quote right))
;;  '(show-paren-mode t nil (paren))
;;  '(use-dialog-box nil)
;;  '(delete-selection-mode t) ;; Delete selected text
;; )


(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; disable startup message
;; (setq inhibit-startup-message t)


;; fix prompt in shell
;; (setenv "PROMPT_COMMAND" "")

;; alias y to yes and n to no
;; (defalias 'yes-or-no-p 'y-or-n-p)


;; Auto-indentation:
;; (define-key global-map (kbd "RET") 'newline-and-indent)


(global-set-key (kbd "C-x 4") 'make-frame-command)
(global-set-key (kbd "C-x O") 'other-frame)

;; (global-set-key [(super left)] (lambda () (interactive) (other-frame -1)))
;; (global-set-key [(super right)] 'other-frame)
;; (global-set-key [(super up)] (lambda () (interactive) (other-window -1)))
;; (global-set-key [(super down)] 'other-window)

(global-unset-key (kbd "M-<left>"))

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


;; To have also a "Windows CUT" alternative to C-k (kill-line) this can be done:
(defun delete-line () "delete line, take it out of kill ring. bind this func to C-z"
 (interactive)
 (setq last-command 'delete-line)
 (kill-line)
 (setq kill-ring (cdr kill-ring))
 (setq kill-ring-yank-pointer kill-ring)
 (setq last-command 'delete-line)
)
(global-set-key (kbd "C-k") 'delete-line)
;; without setting of last-command 2+ C-zs mess up kill-ring


(provide 'personal)