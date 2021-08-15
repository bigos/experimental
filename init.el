(defvar init-dir (file-name-directory load-file-name)
  "The root dir of the Emacs config.")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(org-babel-load-file
 (expand-file-name "literal-config.org"  user-emacs-directory) 1)

