;; don't make emacs backup files when the file is saved
(setq make-backup-files nil)

;; changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; use spaces for tabs
(setq-default indent-tabs-mode nil)

;; load up local conf if it exists
(if (file-exists-p (expand-file-name "~/.emacs.d.local"))
    (load-file (expand-file-name "~/.emacs.d.local")))

;; set default font size based on operating system
;; height is in 1/10 pt
(cond
 ((eq system-type 'darwin)
  (set-face-attribute 'default nil :height 160)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; PACKAGE INSTALLATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add melpa stable to package repos
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


;; list the packages you want to install - will be preserved in src control
(defvar my-packages '(magit
                      evil))

;; install the packages  if not installed
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; CUSTOM KEYBINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bind F12 to toggle evil mode
(global-set-key [f12] 'evil-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq dotfile-dir (file-name-directory
                   (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/key-chord"))
(require 'key-chord)
(key-chord-mode 1)
(evil-mode 0)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(define-key evil-motion-state-map ";" 'evil-ex)
