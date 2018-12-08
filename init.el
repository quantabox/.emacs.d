;; ==================================================
;;  Environment
;; ==================================================

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(server-start) ;; to shut Emacs down completely, call the command `(kill-emacs)’.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "6ebdb33507c7db94b28d7787f802f38ac8d2b8cd08506797b3af6cdfd80632e0" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "045251e7ff119a8b065b4cb0072067eb2f297acc44a9e36407e6ff165e35c528" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" default)))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-scratch-message ";; Sith")
 '(package-selected-packages
   (quote
    (edbi edbi-sqlite emacsql emacsql-psql emacsql-sqlite esqlite doom-modeline doom-themes egg gh-md flymd ess ess-R-data-view el-get anaconda-mode elpy jedi magithub magit-gitflow magit-gh-pulls magit-filenotify ample-zen-theme 0blayout))))


;; ==================================================
;; autloads ;; check utility in 2018!!
;; ==================================================

(if (locate-library "ediff-trees")
    (autoload 'ediff-trees "ediff-trees" "Start an tree ediff" t))
(setq backup-directory-alist '(("*.*" . "~/.Trash")))  ;; send backups to .Trash

;; ==================================================
;; Default directory:  C-x C- f
;; ==================================================

(setq default-directory "~/")

;; ==================================================
;; autcompile init file
;; ==================================================

;; (defun autocompile nil
;;   "compile itself if ~/.emacs.d/init.el"
;;   (interactive)
;;   (require 'bytecomp)
;;   (let ((dotemacs (expand-file-name "~/.emacs.d/init.el")))
;;     (if (string= (buffer-file-name) (file-chase-links dotemacs))
;;       (byte-compile-file dotemacs))))

;; (add-hook 'after-save-hook 'autocompile)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; ==================================================
;;  paren mode
;; ==================================================

(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'


;; ==================================================
;;  buffer frame 
;; ==================================================
;;Toolbar and menu bar distract you from learning the key
;;bindings (i.e. becoming efficient).
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(toggle-frame-maximized)

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

;;(require 'ido)
;;    (ido-mode t)
;;    (setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; ==================================================
;;  Ivy - Swiper - Counsel
;; ==================================================

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; ==================================================
;;  EMACS Speaks Statistics
;; ==================================================

 (setq use-file-dialog nil)
 (setq ess-eval-visibly-p nil) ;otherwise C-c C-r (eval region) takes forever
 (setq ess-ask-for-ess-directory nil) ;otherwise you are prompted each time you start an interactive R session

;;; C
;(add-hook 'c-mode-hook
          ;;(lambda () (c-set-style "bsd")))
          ;;(lambda () (c-set-style "user"))) ; edd or maybe c++ ?
;          (lambda () (c-set-style "c++"))) ; edd or maybe c++ ?
;;;; ESS
(add-hook 'ess-mode-hook
         (lambda ()
           (ess-set-style 'C++)
        Because
                                            DEF GNU BSD K&R C++
            ess-indent-level                  2   2   8   5   4
            ess-continued-statement-offset    2   2   8   5   4
            ess-brace-offset                  0   0  -8  -5  -4
            ess-arg-function-offset           2   4   0   0   0
            ess-expression-offset             4   2   8   5   4
            ess-else-offset                   0   0   0   0   0
            ess-close-brace-offset            0   0   0   0   0
           (add-hook 'local-write-file-hooks
                     (lambda ()
                       (ess-nuke-trailing-whitespace)))))
(setq ess-nuke-trailing-whitespace-p t)

;; ==================================================
;;  ELPA
;; ==================================================
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; ==================================================
;;  python
;; ==================================================
(require 'python)
'(python-shell-interpreter "python3")

;; elpy
(elpy-enable)


;; ==================================================
;;  projectile mode 
;; ==================================================

(setq projectile-mode-line " Projectile")`
(projectile-mode +1)


;; ==================================================
;;  emacs theme
;; ==================================================
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; ==================================================
;;  doom-modeline
;; ==================================================

(require 'doom-modeline)
(doom-modeline-init)

;; How tall the mode-line should be (only respected in GUI Emacs).
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be (only respected in GUI Emacs).
(setq doom-modeline-bar-width 3)

;; Determines the style used by `doom-modeline-buffer-file-name'.
;; If you are expereicing the laggy issue, especially while editing remote files
;; with tramp, please use `file-name', `truncate-all' or `truncate-upto-root'
;; style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

;; What executable of Python will be used (if nil nothing will be showed).
(setq doom-modeline-python-executable "python")

;; Whether show `all-the-icons' or not (if nil nothing will be showed).
;; The icons may not be showed correctly on Windows. Disable to make it work.
(setq doom-modeline-icon t)
(set-fontset-font "fontset-default" '(#xf000 . #xf23a) "FontAwesome")

;; Don’t compact font caches during GC.
;; If you are expereicing the laggy issue especially on Windows, please set to
;; non-nil.
(setq inhibit-compacting-font-caches t)

;; -----------------------------------------------------------------------------
;; magit support (not for windows)
;; -----------------------------------------------------------------------------

(global-set-key (kbd "C-x g") 'magit-status) ;; binding C-x g key


;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 115 :width normal :family "mplus-1m-light")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
