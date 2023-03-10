;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Narmer Bazile"
      user-mail-address "narmernbazile@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;; make emacs behave with yabai
;; (menu-bar-mode t)

;; (when (memq window-system '(mac ns))
;;   (add-to-list 'default-frame-alist '(ns-appearance . dark)) ; nil for dark text
;;   (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(add-to-list 'default-frame-alist '(undecorated-round . t))
;; use latex-preview-pane
;; (after! latex
;;   (setq +latex-viewers '(pdf-tools)))

;; (after! tex
  ;; (setq TeX-view-program-selection nil)
  ;; (setq +latex-viewers '(pdf-tools)))
  ;; (load! "../.emacs.d/modules/lang/latex/+viewers"))

(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; associate the new polymode to Rmd files:
(add-to-list 'auto-mode-alist
             '("\\.[rR]md\\'" . poly-gfm+r-mode))

;; uses braces around code block language strings:
(setq markdown-code-block-braces t)

(use-package! poly-R
:config
(map! (:localleader
      :map polymode-mode-map
      :desc "Export"   "e" 'polymode-export
      :desc "Set exporter"   "E" 'polymode-set-exporter
      :desc "Errors" "$" 'polymode-show-process-buffer
      :desc "Weave" "w" 'polymode-weave
      :desc "Set Weaver" "W" 'polymode-set-weaver
      ;; (:prefix ("n" . "Navigation")
      ;;   :desc "Next" "n" . 'polymode-next-chunk
      ;;   :desc "Previous" "N" . 'polymode-previous-chunk)
      ;; (:prefix ("c" . "Chunks")
      ;;   :desc "Narrow" "n" . 'polymode-toggle-chunk-narrowing
      ;;   :desc "Kill" "k" . 'polymode-kill-chunk
      ;;   :desc "Mark-Extend" "m" . 'polymode-mark-or-extend-chunk)
      ))
  )

(setq markdown-gfm-additional-languages '("r"))
