;; ==================================================
;;  Environment
;; ==================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes (quote ("2017cd12f97df7bd0662499236051c476a3abdafe74162d6673b47d42c20b351" "c73c384550e8204077d230edf564b57d77bb0f80803781ca7ba3832aac9a84d8" "9cb4e4dbe7a1c493e2e4e6ea89061108a22e51379a2ec54eac0d728cd0707393" "b6ce34357c18254d3b6e4ce0016a82354b5b05c33512e0824f0e97cae683b517" "e1d44a4d59d71d7255a2a1faff0fc14e70aa4fb32ba60f2847d15c64f89ea361" "be0b542b157adf7ceec6be2309850cc1aaeba2adc7df9b14c4b4d0a472db786d" "62942153554b69395a80cb1053636d23bbb735da5d426f55d1de22cf0be7c8b0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "ec50b1595ed26441febf50077bb0d1385848e4264001b4f387ea078409a4bac4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-scratch-message ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.
;; Monomaniac at w0rk")
 '(virtualenv-root "~/.emacs.d/elpa/jedi-0.1.2/"))

'(initial-buffer-choice scratch)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

;; Load File List

;;elpa
(add-to-list 'load-path (file-name-as-directory
                         (expand-file-name "~/.emacs.d/elpa/")))

;; ESS
(load "c:/Users/mohammed.akbar/Document/emacs-24.3/site-lisp/ess-12.09-2/lisp/ess-site")

;;ipython
(add-to-list 'load-path "c:/Users/mohammed.akbar/Document/python--3.3.3")

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
 (setq inferior-R-program-name "C:/Users/mohammed.akbar/Document/R/R-3.0.2/bin/x64/Rterm.exe")

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
(setq
 python-shell-interpreter "C:\\Users\\mohammed.akbar\\Document\\Python--3.3.3\\python.exe"
 python-shell-interpreter-args
 "-i C:\\Users\\mohammed.akbar\\Document\\Python--3.3.3\\Scripts\\ipython3-script.py")

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
;;  virtualenv
;; ==================================================

	 
