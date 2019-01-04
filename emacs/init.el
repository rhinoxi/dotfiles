;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://elpa.emacs-china.org/melpa/")) t)
  ;;(add-to-emacs-major-versionlist 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#515151" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#cccccc"))
 '(beacon-color "#f2777a")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-day)))
 '(custom-safe-themes
   (quote
	("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(markdown-mode fireplace pyenv-mode flycheck-rust racer rust-mode flycheck magit nyan-mode use-package evil go-guru color-theme-sanityinc-tomorrow company-go elpy company rainbow-delimiters counsel swiper ivy projectile dumb-jump neotree undo-tree go-mode alchemist gruvbox-theme gruvbox-themev org)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#f2777a")
	 (40 . "#f99157")
	 (60 . "#ffcc66")
	 (80 . "#99cc99")
	 (100 . "#66cccc")
	 (120 . "#6699cc")
	 (140 . "#cc99cc")
	 (160 . "#f2777a")
	 (180 . "#f99157")
	 (200 . "#ffcc66")
	 (220 . "#99cc99")
	 (240 . "#66cccc")
	 (260 . "#6699cc")
	 (280 . "#cc99cc")
	 (300 . "#f2777a")
	 (320 . "#f99157")
	 (340 . "#ffcc66")
	 (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-linum-mode t)
(setq make-backup-files nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

(winner-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sanityinc-tomorrow-eighties t)

(evil-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))

;; The following lines are always needed.  Choose your own keys.
(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"
							 "~/org/home.org"))

(setq-default tab-width 4)
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("C-c C-b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
          (setq dumb-jump-force-searcher 'ag)
  :ensure)

(setq projectile-keymap-prefix (kbd "C-c p"))
(require 'projectile)
(projectile-mode)
(setq projectile-completion-system 'ivy)

(show-paren-mode 1)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-wrap t)
(global-set-key (kbd "C-s") 'swiper)
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

(require 'company)
(require 'company-go)
(require 'go-mode)

(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
(setq company-selection-wrap-around 1)

(elpy-enable)

(defun my-go-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-go))
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ;; guru settings
  (go-guru-hl-identifier-mode)                    ; highlight identifiers
  
  ;; Key bindings specific to go-mode
  ;; (local-set-key (kbd "M-.") 'godef-jump)         ; go to definition
  ;; (local-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
  ;; (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
  ;; (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
  ;; (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)

  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay .1)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg
  )

;; Connect go-mode-hook with the function we just defined
(add-hook 'go-mode-hook 'my-go-mode-hook)
(put 'erase-buffer 'disabled nil)

(defun my-elpy-mode-hook ()
  (define-key elpy-mode-map (kbd "C-c C-j") 'elpy-goto-definition)
  (define-key elpy-mode-map (kbd "C-c C-b") nil)
  ;; (define-key elpy-mode-map (kbd "C-c C-k") 'elpy-flymake-previous-error)
  ;; (define-key elpy-mode-map (kbd "C-c C-n") nil)
  ;; (define-key elpy-mode-map (kbd "C-c C-p") nil)
  )

(add-hook 'elpy-mode-hook 'my-elpy-mode-hook)
(remove-hook 'elpy-modules 'elpy-module-flymake)

(defun my-elixir-mode-hook ()
  (define-key elixir-mode-map (kbd "C-c C-j") 'alchemist-goto-definition-at-point))

(add-hook 'elixir-mode-hook 'my-elixir-mode-hook)

(setq mode-line-system-identification
  (substring (system-name) 0
             (string-match "\\..+" (system-name))))

(nyan-mode 1)
(setq-default mode-line-format
      (list ""
            'mode-line-modified
            "%14b"
            " "
            ;; 'default-directory
            '(:eval (list (nyan-create)))
            "%[("
            'mode-name
            'minor-mode-alist
            "%n"
            'mode-line-process
            ")%]--"
            ;; "Line %l--"
            ;; '(-3 . "%P")
            "-%-"))

;; (setq mode-line-format default-mode-line-format)

;; alchemist
(require 'elixir-mode)
(require 'alchemist)
(setq alchemist-key-command-prefix (kbd "C-c ,")) ;; default: (kbd "C-c a")
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config (setq flycheck-highlighting-mode nil))

(setq rust-format-on-save t)

(defun my-racer-mode-hook ()
  (define-key racer-mode-map (kbd "C-c C-j") #'racer-find-definition))

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook 'my-racer-mode-hook)
