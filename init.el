(defvar init-dir (file-name-directory load-file-name)
  "The root dir of the Emacs config.")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar org-config (expand-file-name "literal-config.org" init-dir))
(defvar elc-config (expand-file-name "literal-config.elc" init-dir))

(if (file-newer-than-file-p org-config elc-config)
    (progn
      (message "going to tangle literal config.")
      (org-babel-load-file (expand-file-name org-config  user-emacs-directory) 1))
  (load-file elc-config)) 
