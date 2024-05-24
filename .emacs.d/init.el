
(load-theme 'tokyo t)
(find-file ".emacs.d/init.el")
(load-file "defaults.el")
(load-file "plugins.el")
(load-file "bindings.el")
(load-file "functions.el")
(load-file "quicklisp.el")

; show tabs with different icon
; lsp
; better theme
; fix indentation to be 2

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4dcf06273c9f5f0e01cea95e5f71c3b6ee506f192d75ffda639d737964e2e14e"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
