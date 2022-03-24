;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the
;; right under X, instead of the default, backspace behavior.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Fix the stupid 4 indents in ESS
;; (defun myindent-ess-hook()
;;   (setq ess-indent-level 2))
;; (add-hook 'ess-mode-hook 'myindent-ess-hook)

;; Set text modes
(setq auto-mode-alist
      (append
       '(("\\.m$" . matlab-mode)
	 ("\\.h$" . c++-mode)
	 ("\\.tcc$" . c++-mode)
	 ("\\.scala$" . java-mode)
	 ("\\.jl$" . julia-mode))
       auto-mode-alist))

;; For Markdown modes
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'load-path "/Users/jduchi/opt/ess-18.10.2/lisp/")
(require 'ess-r-mode)

;; Turn off super indenting in comments
(setq ess-fancy-comments nil)

(autoload 'gfm-mode "gfm-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;; For R markdown
;; (setq load-path (append
;; 		 '("/Users/jduchi/.emacs.d/polymode/"
;; 		   "/Users/jduchi/.emacs.d/polymode/modes")
;; 		 load-path))

;; (require 'poly-R)
;; (require 'poly-markdown)

;; (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; turn on font-lock mode
(global-font-lock-mode t)
(set-face-foreground 'font-lock-comment-face "Red")

;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; Keys set for use from Mac terminal

(global-set-key "\033[5D" 'backward-word)
(global-set-key "\033[5C" 'forward-word)
(global-set-key "\033[5A" 'forward-paragraph)
(global-set-key "\033[5B" 'backward-paragraph)

;; Key bindings for aquamacs
(global-set-key (kbd "<C-right>") 'forward-word)
(global-set-key (kbd "<C-left>") 'backward-word)


;; Key bindings I like to use

(global-set-key "\C-x\C-i" 'goto-line)
(global-set-key "\C-x\C-[tab]" 'goto-line)
(global-set-key "\C-q" 'query-replace-regexp)

;; MATLAB Loading

(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)

(autoload 'matlab-mode "~/.emacs.d/matlab-emacs/matlab.el" "Enter Matlab mode." t)
;; (setq matlab-shell-command "matlab")

(defun my-matlab-hook ()
  (setq matlab-function-indent t) ;; Indent function bodies
  (setq fill-column 79)           ;; Auto-fill should wrap
  (font-lock-mode 1))

(setq matlab-mode-hook 'my-matlab-hook)

(add-to-list 'load-path "~/.emacs.d/julia")
(require 'julia-mode)
;; (autoload 'julia-mode "~/.emacs.d/julia-mode.el" "Enter Julia mode." t)

;; Latex column filling

(defun my-latex-hook ()
  (setq fill-column 76)
  (font-lock-mode 1))

(setq latex-mode-hook 'my-latex-hook)

(defun my-text-hook ()
  (setq fill-column 78)
  (font-lock-mode 1))

(setq text-mode-hook 'my-text-hook)

;; C++ style from Google

(defconst google-c-style
  `((c-recognize-knr-p . nil)
    (c-enable-xemacs-performance-kludge-p . t) ; speed up indentation in XEmacs
    (c-basic-offset . 2)
    (indent-tabs-mode . nil)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist . ((defun-open after)
                               (defun-close before after)
                               (class-open after)
                               (class-close before after)
                               (namespace-open after)
                               (inline-open after)
                               (inline-close before after)
                               (block-open after)
                               (block-close . c-snug-do-while)
                               (extern-lang-open after)
                               (extern-lang-close after)
                               (statement-case-open after)
                               (substatement-open after)))
    (c-hanging-colons-alist . ((case-label)
                               (label after)
                               (access-label after)
                               (member-init-intro before)
                               (inher-intro)))
    (c-hanging-semi&comma-criteria
     . (c-semi&comma-no-newlines-for-oneline-inliners
        c-semi&comma-inside-parenlist
        c-semi&comma-no-newlines-before-nonblanks))
    (c-indent-comments-syntactically-p . nil)
    (comment-column . 40)
    (c-cleanup-list . (brace-else-brace
                       brace-elseif-brace
                       brace-catch-brace
                       empty-defun-braces
                       defun-close-semi
                       list-close-comma
                       scope-operator))
    (c-offsets-alist . ((arglist-intro . ++)
                        (func-decl-cont . ++)
                        (member-init-intro . ++)
                        (inher-intro . ++)
                        (comment-intro . 0)
                        (arglist-close . c-lineup-arglist)
                        (topmost-intro . 0)
                        (block-open . 0)
                        (inline-open . 0)
                        (substatement-open . 0)
                        (statement-cont
                         .
                         (,(when (fboundp 'c-no-indent-after-java-annotations)
                             'c-no-indent-after-java-annotations)
                          ,(when (fboundp 'c-lineup-assignments)
                             'c-lineup-assignments)
                          ++))
                        (label . /)
                        (case-label . +)
                        (statement-case-open . +)
                        (statement-case-intro . +) ; case w/o {
                        (access-label . /)
                        (innamespace . 0))))
  "Google C/C++ Programming Style")

(defun google-set-c-style ()
  "Set the current buffer's c-style to Google C/C++ Programming
  Style. Meant to be added to `c-mode-common-hook'."
  (interactive)
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent t)
  (c-add-style "Google" google-c-style t))

(add-hook 'c-mode-common-hook 'google-set-c-style)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((bug-reference-bug-regexp . "#\\(?2:[0-9]+\\)")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
