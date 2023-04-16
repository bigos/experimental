(defvar init-dir (file-name-directory load-file-name)
  "Directory of the Emacs config init.el.")

(defvar org-config (expand-file-name "literal-config.org" init-dir)
  "Path to the literal configuration..")

;; -----------------------------------------------------------------------------

;; Define package source and load some desired packages when neccesary.

(require 'package)

;; accessing a package repo over https on Windows is a no go, so we
;; fallback to http there
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(message "package archives used %s" package-archives)

;; set package-user-dir to be relative to init.el path
(setq package-user-dir (expand-file-name "elpa" init-dir))

(defun melpa-install-packages (packages)
  "Install all packages in packages list."
  (let ((refreshed nil))
    (mapc
     (lambda (pkg)
       (unless (package-installed-p pkg)
         (unless refreshed
           (message "%s" "Emacs is refreshing Melpa packages...")
           (package-refresh-contents)
           (setf refreshed t)
           (message "%s" " done."))
         (package-install pkg)))
     packages)))

;; This is the list of packages to install. Remember, installing packages from
;; melpa does not mean loading the into  Emacs.

(when t
  ;; install packages in the following list
  (melpa-install-packages '(
					;ag
                            ansi-color
                            anzu
                            avy
                            browse-kill-ring
                            color
                            counsel
                            crux
                            diff-hl
                            diminish
                            discover-my-major
                            easy-kill
                            editorconfig
                            ef-themes
                            eldoc
                            elm-mode
                            epl
                            expand-region
                            flx-ido
                            flycheck
                            gist
                            guru-mode
			    helm-core
                            helm-descbinds
                            hl-todo
                            ido-completing-read+
                            imenu-anywhere
                            magit
                            move-text
                            operate-on-number
                            ;; origami can't make it work, amy stick to yafolding 
                            paredit
                            parsec
                            projectile
                            prop-menu
                            rainbow-delimiters
                            ;; slime
                            smartparens
                            smartrep
                            smex
                            super-save
                            swiper
                            undo-tree
                            volatile-highlights
                            vterm-toggle
                            which-key
                            whitespace
                            yafolding
                            zenburn-theme
                            zop-to-char
                            )))

;; -----------------------------------------------------------------------------
(org-babel-load-file
 org-config
 (if (file-newer-than-file-p
      org-config
      (expand-file-name "literal-config.el" init-dir))
     (progn
       (message "YES going to tangle literal config.")
       t)
   (progn
     (message "NOT going to tangle literal config.")
     nil)))




