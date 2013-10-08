(global-set-key "\C-ci" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cd" 'delete-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;cedet;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
(require 'cedet)
;; semantic setup
;; (semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-gaudy-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
(global-semantic-stickyfunc-mode 1)

;;; gcc setup
(require 'semantic-gcc)

;;; smart complitions setup
(require 'semantic-ia)

;;; 快捷键
(defun my-cedet-hook()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)

  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "M-n") 'semantic-ia-complete-symbol-menu)

  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key (kbd "M-/") 'semantic-complete-analyze-inline)

  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cr" 'semantic-symref-symbol)
  (local-set-key "\C-cR" 'semantic-symref)

  ;;; c/c++ setting
  ;;(local-set-key "." 'semantic-complete-self-insert)
  ;;(local-set-key ">" 'semantic-complete-self-insert)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(load-file "~/.emacs.d/cedet-1.1/contrib/semantic-tag-folding.el")
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
(add-to-list 'load-path "~/.emacs.d/auto-complete-clang/")
(require 'auto-complete-clang)  
(setq ac-clang-auto-save t)  
(setq ac-auto-start t)  
(setq ac-quick-help-delay 0) 
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
;; (ac-set-trigger-key "TAB")  
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)  
;;(define-key ac-mode-map  [(control return)] 'auto-complete)  
(defun my-ac-config ()  
  (setq ac-clang-flags  
        (mapcar(lambda (item)(concat "-I" item))  
               (split-string  
                "
/usr/lib/gcc/x86_64-redhat-linux/4.8.1/../../../../include/c++/4.8.1
/usr/lib/gcc/x86_64-redhat-linux/4.8.1/../../../../include/c++/4.8.1/x86_64-redhat-linux
/usr/lib/gcc/x86_64-redhat-linux/4.8.1/../../../../include/c++/4.8.1/backward
/usr/lib/gcc/x86_64-redhat-linux/4.8.1/include
/usr/local/include
/usr/include

")))  
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
  (add-hook 'css-mode-hook 'ac-css-mode-setup)  
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)  
  (global-auto-complete-mode t))  
(defun my-ac-cc-mode-setup ()  
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))  
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ac-source-gtags  
(my-ac-config) 
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )














