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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ))

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

;; Load File List

;; hide keys
(add-hook 'comint-output-filter-functions
      'comint-watch-for-password-prompt)

;;elpa
(add-to-list 'load-path (file-name-as-directory
                         (expand-file-name "~/.emacs.d/elpa/")))

;; ESS
(load "~/.emacs.d/ESS/lisp/ess-site")

;;ipython
;;(add-to-list 'load-path "c:/Users/mohammed.akbar/Document/python--3.3.3")

;;Toolbar and menu bar distract you from learning the key
;;bindings (i.e. becoming efficient).
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;Font pickup
(set-face-attribute 'default nil
                    :family "Consolas" :height 100)

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
;;  AutoComplete
;; ==================================================

;(require 'auto-complete-config)

;add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4.0/ac-dict")
;(ac-config-default)

;(setq ess-use-auto-complete 'script-only)
;(define-key ac-completing-map (kbd "M-h") 'ac-quick-help)


;; ==================================================
;;  EMACS Speaks Statistics
;; ==================================================

;;; ESS setup for version 12.09-2
 
 (setq use-file-dialog nil)
 (setq ess-eval-visibly-p nil) ;otherwise C-c C-r (eval region) takes forever
 (setq ess-ask-for-ess-directory nil) ;otherwise you are prompted each time you start an interactive R session
 ;;(setq inferior-R-program-name "C:/Users/mohammed.akbar/Document/R/R-3.0.2/bin/x64/Rterm.exe")

;;; C
(add-hook 'c-mode-hook
          ;;(lambda () (c-set-style "bsd")))
          ;;(lambda () (c-set-style "user"))) ; edd or maybe c++ ?
          (lambda () (c-set-style "c++"))) ; edd or maybe c++ ?
;;;; ESS
(add-hook 'ess-mode-hook
          (lambda ()
            (ess-set-style 'C++)
        ;; Because
            ;;                                 DEF GNU BSD K&R C++
            ;; ess-indent-level                  2   2   8   5   4
            ;; ess-continued-statement-offset    2   2   8   5   4
            ;; ess-brace-offset                  0   0  -8  -5  -4
            ;; ess-arg-function-offset           2   4   0   0   0
            ;; ess-expression-offset             4   2   8   5   4
            ;; ess-else-offset                   0   0   0   0   0
            ;; ess-close-brace-offset            0   0   0   0   0
            (add-hook 'local-write-file-hooks
                      (lambda ()
                        (ess-nuke-trailing-whitespace)))))
(setq ess-nuke-trailing-whitespace-p t)


 (require 'ess-site)
 ;(require 'ess-R-object-tooltip)
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

;; setup ipython for default interpreter
;;(setq
;; python-shell-interpreter "C:\\Users\\mohammed.akbar\\Document\\Python--3.3.3\\python.exe"
;; python-shell-interpreter-args
;; "-i C:\\Users\\mohammed.akbar\\Document\\Python--3.3.3\\Scripts\\ipython3-script.py")

;; ipy notebook
;(require 'ein)

;; ==================================================
;;  el-get
;; ==================================================

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync) 

;; ==================================================
;;  Scala Hooks
;; ==================================================

;;(add-hook 'scala-mode-hook '(lambda ()
 ;; (require 'whitespace)

  ;; clean-up whitespace at save
  ;;(make-local-variable 'before-save-hook)
 ;; (add-hook 'before-save-hook 'whitespace-cleanup)

  ;; turn on highlight. To configure what is highlighted, customize
  ;; the *whitespace-style* variable. A sane set of things to
  ;; highlight is: face, tabs, trailing
;  (whitespace-mode)
;))

(require 'scala-mode2)
(require 'ensime)
(require 'sbt-mode)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
