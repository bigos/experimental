(defvar init-dir (file-name-directory load-file-name)
  "Directory of the Emacs config init.el.")

(defvar org-config (expand-file-name "literal-config.org" init-dir)
  "Path to the literal configuration..")
(defvar elc-config (expand-file-name "literal-config.elc" init-dir)
  "Path to the tangled and compiled configuration.")



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



(put 'upcase-region 'disabled nil)
