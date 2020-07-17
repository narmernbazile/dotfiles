
;; Package management settings
;; -----------------------------------------------------------------------------

;; Add MELPA repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; UI settings
;; -----------------------------------------------------------------------------
(setq inhibit-startup-message t             ;; Disable default startup screen
    inhibit-startup-echo-area-message t)    ;;
(menu-bar-mode -1)                          ;; Disable menu bar
(tool-bar-mode -1)                          ;; Disable tool bar
(scroll-bar-mode -1)                        ;; Disable scroll bar
(global-display-line-numbers-mode)          ;; Enable line numbers

;; Other settings
;; -----------------------------------------------------------------------------
(setq epa-pinentry-mode 'loopback)                       ;; Enter gpg passphrases into minibuffer

(put 'upcase-region 'disabled nil)                       ;; Enable upcase command
(put 'downcase-region 'disabled nil)                     ;; Enable downcase command


;;(define-key global-map (kbd "RET") 'newline-and-indent)  ;; Enable auto indent

;; Tabs are evil
;; -----------------------------------------------------------------------------
(setq-default indent-tabs-mode nil)                      ;; Use spaces only
(setq-default tab-width 4)                                       ;; One indent level == 4 columns
(setq tab-width 4)


;; -----------------------------------------------------------------------------
  
;; Enable Ido
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(custom-set-variables
    ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.

    ;; Base16-theme related stuff; DO NOT EDIT BY HAND
    '(ansi-color-names-vector
        ["#181818" "#ab4642" "#a1b56c" "#f7ca88" "#7cafc2" "#ba8baf" "#7cafc2" "#d8d8d8"])
    '(ansi-term-color-vector
        [unspecified "#181818" "#ab4642" "#a1b56c" "#f7ca88" "#7cafc2" "#ba8baf" "#7cafc2" "#d8d8d8"])
    '(custom-safe-themes
        (quote
            ("2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" default)))
    '(package-selected-packages (quote (base16-theme)))
 
 )

(custom-set-faces
    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
 
)


