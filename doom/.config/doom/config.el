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

(setq doom-font (font-spec :family "JetBrains Mono" :size 12 :weight 'semi-light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

;; ----------------------------------------------------------------------------------------------

;; general configuration
(setq default-directory (concat (getenv "HOME") "/"))

;; make popup windows split vertically if there is enough room
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 80)
;; credit: https://stackoverflow.com/questions/2081577/setting-emacs-to-split-buffers-side-by-side
;; (defun display-new-buffer (buffer force-other-window)
;;   "If BUFFER is visible, select it.
;;   If it's not visible and there's only one window, split the
;;   current window and select BUFFER in the new window. If the
;;   current window (before the split) is more than 100 columns wide,
;;   split horizontally(left/right), else split vertically(up/down).
;;   If the current buffer contains more than one window, select
;;   BUFFER in the least recently used window.
;;   This function returns the window which holds BUFFER.
;;   FORCE-OTHER-WINDOW is ignored."
;;   (or (get-buffer-window buffer)
;;     (if (one-window-p)
;;         (let ((new-win
;;                (if (> (window-width) 100)
;;                    (split-window-horizontally)
;;                  (split-window-vertically))))
;;           (set-window-buffer new-win buffer)
;;           new-win)
;;       (let ((new-win (get-lru-window)))
;;         (set-window-buffer new-win buffer)
;;         new-win))))
;; ;; use display-buffer-alist instead of display-buffer-function if the following line won't work
;; (setq display-buffer-function 'display-new-buffer)

(if (window-system)
  (set-frame-height (selected-frame) 60))

(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode) ;; enable 80 char indicator line


;; org-mode
(setq org-directory "~/org")

(when (eq system-type 'gnu/linux)
  (setq org-directory "~/usr/org/"))

(when (eq system-type 'windows-nt)
  (setq org-directory "c:/Users/narme/Dropbox/org/"))

;; (defun transform-square-brackets-to-round-ones(string-to-transform)
;;   "Transforms [ into ( and ] into ), other chars left unchanged."
;;   (concat
;;   (mapcar #'(lambda (c) (if (equal c ?[) ?\( (if (equal c ?]) ?\) c))) string-to-transform))
;;   )

;; (after! org
;;   (setq org-capture-templates `(
;; 	("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
;;         "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
;; 	("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
;;         "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n")
;;         )))

;; org-roam configuration
(when (eq system-type 'windows-nt)
  (setq org-roam-directory (file-truename "c:/Users/narme/Dropbox/nts")))

(when (eq system-type 'gnu/linux)
  (setq org-roam-directory "~/usr/nts"))

(when (eq system-type 'darwin)
  (setq org-roam-directory "/Users/nbazile/usr/Dropbox/nts"))

(use-package! org-roam
  :config
  (setq org-roam-db-sync 't))
;; make emacs behave with yabai
;; (menu-bar-mode t)

;; (when (memq window-system '(mac ns))
;;   (add-to-list 'default-frame-alist '(ns-appearance . dark)) ; nil for dark text
;;   (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

;; org-roam ui configuration
(use-package! org-roam-ui
  :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(use-package! nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\'" . nov-mode))
  (map! (:localleader
         :map nov-mode-map
         :desc "Next page" "j" 'nov-next-document
         :desc "Previous page" "k" 'nov-previous-document)))

(add-to-list 'default-frame-alist '(undecorated-round . t))
;;use latex-preview-pane
;; (after! latex
;;   (setq +latex-viewers '(pdf-tools)))

;; (after! tex
  ;; (setq TeX-view-program-selection nil)
  ;; (setq +latex-viewers '(pdf-tools)))
  ;; (load! "../.emacs.d/modules/lang/latex/+viewers"))


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

<<<<<<< HEAD
(after! org-roam
  (setq org-roam-directory "~/usr/nts"))
=======
(use-package! mu4e
  ;; :ensure nil
  :load-path "/opt/homebrew/Cellar/mu/1.10.5/share/emacs/site-lisp/mu/mu4e"
  ;; :defer 20 ; Wait until 20 seconds after startup
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/mail/")
  (setq message-send-mail-function 'smtpmail-send-it)

  ;; Make sure plain text mails flow correctly for recipients
  (setq mu4e-compose-format-flowed t)

  (setq mu4e-html2text-command 'mu4e-shr2text)

  ;; (setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
  ;; (setq mu4e-drafts-folder "/[Gmail]/Drafts")
  ;; (setq mu4e-refile-folder "/[Gmail]/All Mail")
  ;; (setq mu4e-trash-folder  "/[Gmail]/Trash")
  ;; (setq mu4e-compose-signature "Best,\nNarmer")

  (setq mu4e-contexts
        (list
        (make-mu4e-context
        :name "gmail"
        :match-func
        (lambda (msg)
        (when msg
                (string-prefix-p "/gmail" (mu4e-message-field msg :maildir))))
        :vars '((user-mail-address      . "narmernbazile@gmail.com")
                (user-full-name         . "Narmer Noir Bazile")
                (smtpmail-smtp-server   . "smtp.gmail.com")
                (smtpmail-smtp-service  . 465)
                (smtpmail-stream-type   . ssl)
                (mu4e-drafts-folder     . "/gmail/[Gmail]/Drafts")
                (mu4e-sent-folder       . "/gmail/[Gmail]/Sent Mail")
                (mu4e-refile-folder     . "/gmail/[Gmail]/All Mail")
                (mu4e-trash-folder      . "/gmail/[Gmail]/Trash")
                (mu4e-compose-signature . "Best,\nNarmer")
                (mu4e-maildir-shortcuts . (("/gmail/INBOX"             . ?i)
                                            ("/gmail/[Gmail]/Sent Mail" . ?s)
                                            ("/gmail/[Gmail]/Trash"     . ?t)
                                            ("/gmail/[Gmail]/Drafts"    . ?d)
                                            ("/gmail/[Gmail]/All Mail"  . ?a)))))

       (make-mu4e-context
        :name "bowdoin"
        :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/bowdoin" (mu4e-message-field msg :maildir))))
        :vars '((user-mail-address      . "nbazile@bowdoin.edu")
                (user-full-name         . "Narmer Bazile")
                (smtpmail-smtp-server   . "localhost")
                (smtpmail-smtp-service  . 1025)
                (smtpmail-stream-type   . plain)
                (mu4e-drafts-folder     . "/bowdoin/Drafts")
                (mu4e-sent-folder       . "/bowdoin/Sent")
                (mu4e-refile-folder     . "/bowdoin/Archive")
                (mu4e-trash-folder      . "/bowdoin/Trash")
                (mu4e-compose-signature . "Best,\nNarmer")
                (mu4e-maildir-shortcuts . (("/bowdoin/INBOX"   . ?i)
                                            ("/bowdoin/Sent"    . ?s)
                                            ("/bowdoin/Trash"   . ?t)
                                            ("/bowdoin/Drafts"  . ?d)
                                            ("/bowdoin/Archive" . ?a)))))))

  (set-popup-rule! "mu4e-article" :side 'right :size '0.5))

   ;; (setq mu4e-maildir-shortcuts
   ;;    '(("/gmail/INBOX"             . ?i)
   ;;      ("/gmail/[Gmail]/Sent Mail" . ?s)
   ;;      ("/gmail/[Gmail]/Trash"     . ?t)
   ;;      ("/gmail/[Gmail]/Drafts"    . ?d)
   ;;      ("/gmail/[Gmail]/All Mail"  . ?a))))

(use-package! citar
  :custom
  (citar-bibliography '("~/biblio/library.bib"))
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup))

;; (use-package! citar-embark
;;   :after citar embark
;;   :no-require
;;   :config (citar-embark-mode))
>>>>>>> refs/remotes/origin/master
