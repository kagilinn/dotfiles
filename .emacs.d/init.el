;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (use-package leaf :ensure t)

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

;; (setq-default indent-tabs-mode nil)
(leaf cus-start
  :setq-default `((tab-width        . 4)
                  (indent-tabs-mode . nil))
  :config
  (when window-system
    (set-frame-size (selected-frame) 165 37))
  (global-auto-revert-mode t)
  (global-display-line-numbers-mode t))

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
