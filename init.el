
;; -----------------------------------------------------------------------------
;; Define package source.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(message "package archives used %s" package-archives)

;; set package-user-dir to be relative to init.el path
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

;; -----------------------------------------------------------------------------

;; This is the list of packages to install. Remember, installing packages from
;; melpa does not mean loading the into  Emacs.


;; -----------------------------------------------------------------------------
(defvar org-config (expand-file-name "literal-config.org" user-emacs-directory)
  "Path to the literal configuration..")

(org-babel-load-file org-config)

;;; end of init
;; -----------------------------------------------------------------------------
