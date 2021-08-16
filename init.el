(defvar init-dir (file-name-directory load-file-name)
  "The root dir of the Emacs config.")

(defvar org-config (expand-file-name "literal-config.org" init-dir))
(defvar elc-config (expand-file-name "literal-config.elc" init-dir))

(if (> 2 1) ;(file-newer-than-file-p org-config elc-config)
    (progn
      (message "going to tangle literal config.")
      (org-babel-load-file (expand-file-name org-config  user-emacs-directory) 1))
  (load-file elc-config)) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(rainbow-delimiters use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:foreground "#ff0000" :background "#888"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#199975c2ffff"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#28f5cccc0000"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#ffffb1a91999"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#fffe578c4ccc"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#8ccc251ef479"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#0a3dc28eb77f"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#e045e49a0c08"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#f4796353251e"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "white" :background "red"))))
 '(whitespace-line ((t (:background "#ee13ee13ee13")))))
