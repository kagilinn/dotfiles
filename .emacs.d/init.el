;; -*- tab-width: 8; indent-tabs-mode: t; lexical-binding: t -*-
;; vim: set tabstop=8 shiftwidth=2 noexpandtab :

;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
		       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>

(leaf leaf-tree
  :ensure t
  :custom ((imenu-list-size . 30)
	   (imenu-list-position . 'left)))

(leaf leaf-convert :ensure t)

(leaf leaf-manager :ensure t)

(leaf eglot
  :hook ((c-mode-hook . eglot-ensure)
	 (c++-mode-hook . eglot-ensure)))

(leaf company
  :ensure t
  :blackout t
  :leaf-defer nil
  :hook ((    c-mode-hook . company-mode)
	 (  c++-mode-hook . company-mode)
	 ( perl-mode-hook . company-mode)
	 (cperl-mode-hook . company-mode)))

(leaf cus-start
  :setq-default `((tab-bar-show                  . t)
		  (tab-bar-new-tab-choice        . "*scratch*")
		  (tab-bar-close-last-tab-choice . 'delete-frame)

		  (tab-width        . 4)
                  (indent-tabs-mode . nil))
  ;; :custom `((VARIABLE-NAME . VALUE)
  ;;           (VARIABLE-NAME . VALUE))
  :config
  (when window-system
    (tab-bar-mode 1)
    (set-frame-size (selected-frame) 165 37))
  (global-display-line-numbers-mode t))

(leaf autorevert
  :custom ((auto-revert-interval . 0.5))
  :global-minor-mode global-auto-revert-mode)

(leaf recentf
  :pre-setq `((byte-compile-warnings . '(cl-functions)))
  :init
  (leaf recentf-ext :ensure t)
  :custom
  `((recentf-save-file       . "~/.emacs.d/.recentf")
    (recentf-max-saved-items . 64)
    (recentf-auto-cleanup    . 'never)
    (recentf-exclude         . '(".recentf")))
  :config
  (global-set-key (kbd "C-x C-g") 'recentf-open-files)
  (recentf-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(deeper-blue))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
