;; don't make emacs backup files when the file is saved
(setq make-backup-files nil)

;; changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; use spaces for tabs
(setq-default indent-tabs-mode nil)

;; enable column-mode by default
(setq column-number-mode t)

;; setup ido mode acroos the board
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; load up local conf if it exists
(if (file-exists-p (expand-file-name "~/.emacs.d.local"))
    (load-file (expand-file-name "~/.emacs.d.local")))

;; set default font size based on operating system
;; height is in 1/10 pt
(cond
 ((eq system-type 'darwin)
  (set-face-attribute 'default nil :height 160)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set Package repositories ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; add melpa stable to package repos
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install use-package if it's not already installed.            ;;
;; package-refresh-contents ensure packages loaded in new emacs. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; From use-package README ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load the org config file ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(org-babel-load-file (concat user-emacs-directory "config.org"))
