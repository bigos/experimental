(defvar init-dir (file-name-directory load-file-name)
  "Directory of the Emacs config init.el.")

(defvar org-config (expand-file-name "literal-config.org" init-dir)
  "Path to the literal configuration..")
(defvar elc-config (expand-file-name "literal-config.elc" init-dir)
  "Path to the tangled and compiled configuration.")

(message "going to tangle literal config.")
(org-babel-load-file org-config )



