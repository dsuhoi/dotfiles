;; System-type definition
(defun system-is-linux()
	(string-equal system-type "gnu/linux"))

;; Start Emacs as a server
(when (system-is-linux)
	(require 'server)
	(unless (server-running-p)
		(server-start))) ;; запустить Emacs как сервер, если ОС - GNU/Linux

;; Unix path-variable
(when (system-is-linux)
	(setq unix-init-path         "~/.emacs.d"))

;; load emacs 24's package system. Add MELPA repository.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'all-the-icons)
(load-theme 'tron-legacy t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; My name and e-mail adress
(setq user-full-name   "DSuhoi")
(setq user-mail-adress "dsuh0i.h8@gmail.com")

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")


;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a


;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
;; Delete selection
(delete-selection-mode t)

;; Electric-modes settings
(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
;;(electric-indent-mode -1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

;; set default tab char's display width to 4 spaces
(setq-default tab-width 4) ; emacs 23.1 to 26 default to 8
(setq-default tab-always-indent t)
;; make indent commands use space only (never tab character)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 8 200 8))
(setq indent-line-function 'insert-tab)
;;(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Scrolling settings
(setq scroll-step              1) ;; вверх-вниз по 1 строке
(setq scroll-margin            5) ;; сдвигать буфер верх/вниз когда курсор в 5 шагах от верхней/нижней границы
(setq scroll-conservatively 10000)

;; Disable GUI components
(tooltip-mode      -1)
(menu-bar-mode     -1) ;; отключаем графическое меню
(tool-bar-mode     -1) ;; отключаем tool-bar
(scroll-bar-mode   -1) ;; отключаем полосу прокрутки
(blink-cursor-mode -1) ;; курсор не мигает
(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

;; Disable backup/autosave files
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name t)


;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах


(setq c-default-style "stroustrup")

;; HOTKEYS

(global-set-key [(f9)] 'compile)
(global-set-key [(f5)] 'gdb)


;; PLAGINS
;; EVIL MODE
(require 'evil)
(evil-mode 1)

;; HELM
(require 'helm)
(setq-default helm-M-x-fuzzy-match t)
;;;; define shortcuts for powerful commands
;;;; these can be invoked vim-style
;;;; Esc-:<single_key_from_below>
(define-key evil-ex-map "b " 'helm-mini)
(define-key evil-ex-map "e" 'helm-find-files)
(define-key evil-ex-map "g" 'helm-projectile-grep)
(define-key evil-ex-map "f" 'helm-projectile-find-file)


;; Linum plugin
(require 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк

;; EMACS CODE BROWSER
(global-set-key [f7] 'ecb-activate)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-compile-window-height 10)
 '(ecb-compile-window-temporally-enlarge 'after-selection)
 '(ecb-compile-window-width 'edit-window)
 '(ecb-layout-name "left1")
 '(ecb-options-version "2.50")
 '(ecb-tip-of-the-day nil)
 '(package-selected-packages
   '(evil cmake-mode tron-legacy-theme all-the-icons yasnippet-snippets yasnippet neotree helm ecb auto-complete-c-headers)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(defun my-ac-c-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c-mode-common-hook 'my-ac-c-init)

(require 'yasnippet)
(yas/initialize)
(yas-global-mode 1)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)

;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; Activate semantic
(semantic-mode 1)

(setq-mode-local c-mode-common-hook semanticdb-find-default-throttle '(project unloaded system recursive))

;; EDE
;(global-ede-mode 1)
;(ede-enable-generic-projects)


(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system))


(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(setq-mode-local c-mode-common-hook semanticdb-find-default-throttle
                 '(project unloaded recursive))

(defun my-add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic))

(add-hook 'c-mode-common-hook 'my-add-semantic-to-autocomplete)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
