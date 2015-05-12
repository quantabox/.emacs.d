;; ==================================================
;;  Environment
;; ==================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-scratch-message ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.
;; Monomaniac at w0rk")


'(initial-buffer-choice scratch)


'(python-shell-interpreter "python3")


;; autloads
(if (locate-library "ediff-trees")
    (autoload 'ediff-trees "ediff-trees" "Start an tree ediff" t))

;; autcompile
(defun autocompile nil
  "compile itself if ~/.emacs.d/init.el"
  (interactive)
  (require 'bytecomp)
  (let ((dotemacs (expand-file-name "~/.emacs.d/init.el")))
    (if (string= (buffer-file-name) (file-chase-links dotemacs))
      (byte-compile-file dotemacs))))

(add-hook 'after-save-hook 'autocompile)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

;; Load File List
(add-to-list 'custom-theme-load-path "~/.emacs.d/monokai-emacs")

;; paren mode

(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'


;; hide keys
(add-hook 'comint-output-filter-functions
      'comint-watch-for-password-prompt)

;;elpa
(add-to-list 'load-path (file-name-as-directory
                         (expand-file-name "~/.emacs.d/elpa/")))

;; ESS
(load "~/.emacs.d/ESS/lisp/ess-site")


;;Toolbar and menu bar distract you from learning the key
;;bindings (i.e. becoming efficient).
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)


;; ==================================================
;;  org mode
;; ==================================================

(add-hook 'org-mode-hookslime
          '(lambda ()
          (auto-fill-mode 1) Wrap long lines
          ))

;;Show empty line between subtrees even if there is only one
(setq org-cycle-separator-lines 1)

;; ==================================================
;;  InteractivelyDoThings
;; ==================================================

(require 'ido)
    (ido-mode t)
    (setq ido-enable-flex-matching t) ;; enable fuzzy matching



;; ==================================================
;;  EMACS Speaks Statistics
;; ==================================================

;;; ESS setup for version 12.09-2
 
 (setq use-file-dialog nil)
 (setq ess-eval-visibly-p nil) ;otherwise C-c C-r (eval region) takes forever
 (setq ess-ask-for-ess-directory nil) ;otherwise you are prompted each time you start an interactive R session

;;; C
;(add-hook 'c-mode-hook
          ;;(lambda () (c-set-style "bsd")))
          ;;(lambda () (c-set-style "user"))) ; edd or maybe c++ ?
;          (lambda () (c-set-style "c++"))) ; edd or maybe c++ ?
;;;; ESS
;(add-hook 'ess-mode-hook
;          (lambda ()
;            (ess-set-style 'C++)
        ;; Because
            ;;                                 DEF GNU BSD K&R C++
            ;; ess-indent-level                  2   2   8   5   4
            ;; ess-continued-statement-offset    2   2   8   5   4
            ;; ess-brace-offset                  0   0  -8  -5  -4
            ;; ess-arg-function-offset           2   4   0   0   0
            ;; ess-expression-offset             4   2   8   5   4
            ;; ess-else-offset                   0   0   0   0   0
            ;; ess-close-brace-offset            0   0   0   0   0
;            (add-hook 'local-write-file-hooks
;                      (lambda ()
;                        (ess-nuke-trailing-whitespace)))))
(setq ess-nuke-trailing-whitespace-p t)

(require 'ess-site)
(require 'ess-eldoc)


;; ==================================================
;;  Marmalade
;; ==================================================
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)


;; ==================================================
;;  python
;; ==================================================


(require 'python)


;; ==================================================
;;  el-get
;; ==================================================

;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))

;; (el-get 'sync)

;; load theme
(load-theme 'monokai t)

;; ==================================================
;;  graphene
;; ==================================================

(require 'graphene)

;; -----------------------------------------------------------------------------
;; Git support
;; -----------------------------------------------------------------------------

(add-to-list 'load-path "/usr/share/doc/git/contrib/emacs")
(require 'git)
(require 'git-blame)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :background "#272822" :foreground "#F8F8F2" :weight light :height 113 :foundry "unknown" :family "M+ 1mn"))))))
