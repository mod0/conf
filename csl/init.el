;; Adding code to load the matlab module into emacs.
(add-to-list 'load-path "~/emacs/matlab-emacs/")
(require 'matlab-load)
(defun my-matlab-mode-hook ()
  (setq fill-column 200)
  (setq matlab-shell-command-switches '("-nodesktop -nosplash")))
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;; ELPA package manager setup
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize)
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" default)))
 '(font-use-system-font t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

;; Load multiple themes and choose one
;; based on whether its terminal app or
;; the GUI
(load-theme 'ample-zen)
(load-theme 'badwolf)
(if (display-graphic-p)
    (enable-theme 'badwolf)
  (enable-theme 'ample-zen))  

;; active Babel languages for org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((matlab . t)
   (python . t)
   ))

;; Add Matlab to exec path
(setq exec-path (append exec-path '("/usr/local/bin/matlab")))

;; No Tab Mode and Tab Space Width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Set Backup Directory for Emacs
(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq backup-by-copying t)

;; Set column number mode on
(setq column-number-mode t)

;; Set linum mode on
(global-linum-mode t)

;; Set linum format
(setq linum-format "%4d \u2502 ")

;; Show matching paranthesis
(show-paren-mode 1)

;; Short cuts to resize windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Turn on auto-complete mode
(global-auto-complete-mode t)

;; Require buffer-move
(require 'buffer-move)

;; Setup key-bindings for swapping buffers 
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; Duplicate line functionality
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-d") 'duplicate-line)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;; Enable IDO Mode
(require 'ido)
(ido-mode t)

;; Adding Latex Preview Pane
(latex-preview-pane-enable)


;; Do nothing on CTRL-Z in GUI mode, instead make it undo
(if (display-graphic-p)
    (progn
     (global-unset-key [(control z)])
     (global-unset-key [(control x)(control z)])
     (global-set-key [(control z)] 'undo)))  


;; Set comment and uncomment commands
(global-set-key (kbd "C-x C-[") 'comment-region)
(global-set-key (kbd "C-x C-]") 'uncomment-region)
