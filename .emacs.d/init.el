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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; PACKAGE INSTALLATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;; list the packages you want to install - will be preserved in src control
(defvar my-packages '(magit
                      evil
                      elixir-mode
                      go-mode))

;; alchemist only supported on emacs 24.4 and later
(when (and (>= emacs-major-version 24)
           (>= emacs-minor-version 4))
  (add-to-list 'my-packages 'alchemist))

;; install the packages  if not installed
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; CUSTOM TABS IN GO MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 2)))

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
