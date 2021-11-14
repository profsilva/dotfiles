;;; config.el -*- lexical-binding: t; -*
;;
;; Copyright (C) 2021 André dos Santos Silva
;;
;; Author: André dos Santos Silva <https://github.com/ciberaprendiz>
;; Maintainer: André dos Santos Silva <santosandsilva@gmail.com>
;; Created: outubro 25, 2021
;; Modified: outubro 25, 2021
;; Version: 0.0.2
;; Keywords: Elisp Config Emacs 
;; Homepage: 
;; Package-Requires: ((emacs "27.1"))
;;
;; This file is not part of GNU Emacs.
;;
;; Commentary:
;;
;;
;;
;;; Code:

;; Adicionando variáveis de nome e e-mail
(setq user-full-name "André S. Silva"
      user-mail-address "santosandsilva@gmail.com")

;; Adicionando variáveis para chaver gpg
;; Fonte: https://tecosaur.github.io/emacs-config/config.html
(setq auth-sources '("~/.authinfo.gpg")
      auth-source-cache-expiry nil) ; default is 7200 (2h)

;; Aumentando o limite do coletor de lixo para inicializar mais rápido
(setq gc-cons-threshold 100000000)

;; Restaurando o coletor de lixo a velocidade normal após iniciar o Emacs
(add-hook 'after-init-hook
	  (lambda ()
	    (setq gc-cons-threshold 1000000)
	    (message "gc-cons-threshold restored to %S"
		     gc-cons-threshold)))

(setq inhibit-compacting-font-caches t)

;; Aumentando a quantidade de dados que o Emacs lê em processamento
(defvar read-process-output-max (* 1024 2048)) ; 1 megabyte

;; Mensagem com tempo de inicialização
(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;;; Removendo elementos desnecessárioa da interface de usuário
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar
(display-time-mode 1)       ; Enable time in the mode-line

;; Set up the visible bell
(setq visible-bell t)

;; Configurando a numeração de linhas no arquivo.
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		nov-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Criando alias para y or n em propts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Permite colagem de fora do Emacs
(setq x-select-enable-clipboard t)

;; Configurações customizadas do Emacs em arquivo separado
;; Chega de sujar sua configuração init.el
(setq custom-file (make-temp-file "emacs-custom"))


(setq-default delete-by-moving-to-trash t ; Delete files to trash
              ; Take new window space from all other windows (not just current)
              window-combination-resize t 
              x-stretch-cursor t)

(setq undo-limit 80000000                      ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                    ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                      ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"             ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                ; I can trust my computers ... can't I?
      scroll-preserve-screen-position 'always  ; Don't have `point' jump around
      scroll-margin 0)                         ; It's nice to maintain a little margin

(global-subword-mode 1)                        ; Iterate through CamelCase words

(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

;; Package Manager Configuration -----------------------------------------------

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;; Command-log abre uma janela mostrando os comandos utilizados
;(use-package command-log-mode)

;; Função para editar facilmente o arquivo init.el
;; Fonte: https://jamiecollinson.com/blog/my-emacs-config/
(defun find-config ()
    "Edit config.org"
    (interactive)
    (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c C-i") 'find-config)

;; Ivy Configuration -----------------------------------------------------------

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 ("C-x b" . ivy-switch-buffer)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-n" . ivy-next-line)
         ("C-p" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-p" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-p" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy)
  )

;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-dracula t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("M-y" . counsel-yank-pop)
         ("C-x C-b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))
 

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Magit Configuration ---------------------------------------------------------

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
(use-package forge)

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

 ;; Configuração de atalhos ----------------------------------------------------

(use-package key-chord
  :config
  (key-chord-mode 1)
  (setq key-chord-one-key-delay 0.02
	key-chord-two-keys-delay 0.08))

(key-chord-define-global "fj" 'evil-switch-to-windows-last-buffer)
(key-chord-define-global "dk" 'keyboard-escape-quit)
(key-chord-define-global "wo" 'other-window)
(key-chord-define-global "gh" 'counsel-M-x)
;(key-chord-define-global "" ')

(use-package god-mode)

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  :config
  (setq evil-want-minibuffer t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  (evil-mode 1)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-global-set-key 'normal " wh" 'evil-window-split)
  (evil-global-set-key 'normal " wv" 'evil-window-vsplit)
  (evil-global-set-key 'normal " wh" 'evil-window-left)
  (evil-global-set-key 'normal " wj" 'evil-window-down)
  (evil-global-set-key 'normal " wk" 'evil-window-up)
  (evil-global-set-key 'normal " wl" 'evil-window-right)
  (evil-global-set-key 'normal " wq" 'evil-delete-buffer)

  (key-chord-define evil-insert-state-map "jk" 'evil-force-normal-state)
  (key-chord-define evil-insert-state-map "kj" 'evil-force-normal-state)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))


(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-god-state
  :after (god-mode evil)
  :config
  (progn
    (evil-define-key 'normal global-map (kbd "ç") 'evil-execute-in-god-state)
    (evil-define-key 'visual global-map (kbd "ç") 'evil-execute-in-god-state)
    (evil-define-key 'god global-map "ç" 'evil-god-state-bail)

    (with-eval-after-load 'diminis
      (add-hook 'evil-god-state-entry-hook (lambda () (dminish 'god-local-mode)))
      (add-hook 'evil-god-state-exit-hook (lambda () (diminish-undo 'god-local-mode)))
      )

    (with-eval-after-load 'which-key
      (which-key-enable-god-mode-support)
      )
    ))

;; Org Mode Configuration ------------------------------------------------------

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 0.8)
                  (org-level-6 . 0.8)
                  (org-level-7 . 0.8)
                  (org-level-8 . 0.8)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  ;(setq org-ellipsis " ▾")
  (setq org-directory "~/Dropbox/org/")
  (setq org-superstar-headline-bullets-list '("∵"))
  (efs/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;;; Configurações para leitura e anotações

;;; Configuração Nov.el
(use-package nov
  :hook (nov-mode . variable-pitch-mode)
  :mode ("\\.epub\\'" . nov-mode))


(use-package org-noter
  :after org
  :config
  (setq org-noter-notes-search-path '("~/Dropbox/org")
	org-noter-pdftools-markup-pointer-color "yellow"
	org-noter-pdftools-free-pointer-icon "Note"
	org-noter-pdftools-free-pointer-color "red"
	org-noter-notes-window-location 'horizontal-split
	org-noter-auto-save-last-location t
	org-noter-doc-split-fraction '(0.55 . 0.45)
	org-noter-always-create-frame nil
	org-noter-hide-other t
	org-noter-separate-notes-from-heading nil
	org-noter--inhibit-location-change-handler t
	org-noter-kill-frame-at-session-end t
	org-noter-separate-notes-from-heading t))

;; Configuração do Org-pdftools
(use-package org-pdftools
  :after org
  :hook (org-mode . org-pdftools-setup-link))

(use-package org-noter-pdftools
  :after org-noter
  :config
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

;; Configuração de leitor de pdf e ferramentas
(use-package pdf-tools
   :config
   (pdf-tools-install)
   (setq-default pdf-view-display-size 'fit-width)
   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
   :custom
   (pdf-annot-activate-created-annotations t "automatically annotate highlights"))

;; Emacs como visualizador padrão de pdfs.
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

;; Por problemas de incompatibilidade desativamos o linum-mode em pdfs
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

;; Lidando com arquivos muito grandes
(use-package vlf
  :defer t)

;; Configurando e manuseando janelas
(defun split-and-follow-horizontally ()
    (interactive)
    (split-window-below)
    (balance-windows)
    (other-window 1))
  (global-set-key (kbd "C-c C-w C-h") 'split-and-follow-horizontally)

  (defun split-and-follow-vertically ()
    (interactive)
    (split-window-right)
    (balance-windows)
    (other-window 1))
  (global-set-key (kbd "C-c C-w C-v") 'split-and-follow-vertically)

;; Adicionando auto-complete
(use-package auto-complete
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; avy allows us to effectively navigate to visible things
(use-package avy
  :config
  (setq avy-background t
	avy-style 'at-full))
(evil-global-set-key 'normal "f" 'avy-goto-char)

;; Configuração do Deft
(use-package deft
  :config
  (setq deft-directory "~/Dropbox/")
  (setq deft-extensions '("org" "txt" "md"))
  (setq deft-recursive t))


;; Configuração do Google tradutor
(use-package google-translate
  :custom
  (google-translate-backend-method 'curl)
  :config
  (require 'google-translate-smooth-ui)
  (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
  (setq google-translate-output-destination nil)
  (setq google-translate-pop-up-buffer-set-focus t)
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "pt")
  (global-set-key "\C-ct" 'google-translate-at-point)
  )

;; google-translator operator
;; fonte: https://www.reddit.com/r/emacs/comments/3bvhxa/evil_operator_for_googletranslateel/
  (defvar text-to-translate ""
    "Holds the text to be translated.")

  (defun evil-google-translate--block-line(beg end)
    "Get current line from the block and append it to the translaton text."
    (setq text-to-translate
          (concat text-to-translate
                  " " (buffer-substring-no-properties beg end))))

  (evil-define-operator evil-google-translate (beg end type)
    "Evil operator: translate using *google-translator* package"
    :move-point nil
    (interactive "<R>")
    (setq text-to-translate "")
    (if (eq type 'block)
        (evil-apply-on-block 'evil-google-translate--block-line beg end nil)
      (setq text-to-translate (buffer-substring-no-properties beg end)))
    (let* ((source-language (google-translate-language-abbreviation "English"))     ;;(google-translate-read-source-language))   ;;Subst. por essas funções para definir
           (target-language (google-translate-language-abbreviation "Portuguese"))) ;;(google-translate-read-target-language)))  ;; o idioma na exe. da função.
      (google-translate-translate source-language target-language text-to-translate)))


;; use 'gt' as operator key-combo:
(define-key evil-normal-state-map "gt" 'evil-google-translate)
(define-key evil-motion-state-map "gt" 'evil-google-translate)
(define-key evil-visual-state-map "gt" 'evil-google-translate)

(use-package anki-editor
  :after org
  :bind (:map org-mode-map
         ("<f8>" . anki-editor-cloze-region-auto-incr)
         ("<f7>" . anki-editor-cloze-region-dont-incr)
         ("<f6>" . anki-editor-reset-cloze-number)
         ("<f5>" . anki-editor-push-tree))
  :hook (org-capture-after-finalize . anki-editor-reset-cloze-number) ; Reset cloze-number after each capture.
  :config
  (setq anki-editor-create-decks t ;; Allow anki-editor to create a new deck if it doesn't exist
        anki-editor-org-tags-as-anki-tags t)

  (defun anki-editor-cloze-region-auto-incr (&optional arg)
    "Cloze region without hint and increase card number."
    (interactive)
    (anki-editor-cloze-region my-anki-editor-cloze-number "")
    (setq my-anki-editor-cloze-number (1+ my-anki-editor-cloze-number))
    (forward-sexp))

  (defun anki-editor-cloze-region-dont-incr (&optional arg)
    "Cloze region without hint using the previous card number."
    (interactive)
    (anki-editor-cloze-region (1- my-anki-editor-cloze-number) "")
    (forward-sexp))

  (defun anki-editor-reset-cloze-number (&optional arg)
    "Reset cloze number to ARG or 1"
    (interactive)
    (setq my-anki-editor-cloze-number (or arg 1)))

  (defun anki-editor-push-tree ()
    "Push all notes under a tree."
    (interactive)
    (anki-editor-push-notes '(4))
    (anki-editor-reset-cloze-number))
  ;; Initialize
  (anki-editor-reset-cloze-number)
)


;; Definindo diretórios para captura rápida de notas
(setq org-my-todo-file (expand-file-name "todo.org" "~/Dropbox/org"))
(setq org-my-anki-file (expand-file-name "anki.org" "~/Dropbox/org"))
;(setq org-board-capture-file (expand-file-name "inbox.org" org-roam-directory))

;; Captura rápida
(setq org-capture-templates
      '(

        ("a" "Anki Aprendi"
         entry
         (file+headline org-my-anki-file "Anki")
         "* %<%Y/%m/%d %H:%M>\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Cloze\n:ANKI_DECK: Rizoma\n:END:\n** Text\nAprendi com \{\{c0::%^{Nome}\}\} %^{lição} %?\n** Extra\n\n%i")

        ("b" "Anki basic"
         entry
         (file+headline org-my-anki-file "Anki")
         "* %<%Y/%m/%d %H:%M>\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: Rizoma\n:END:\n** Front\n%^{Pergunta}?\n** Back\n%^{Resposta} %?")

        ("c" "Anki cloze"
         entry
         (file+headline org-my-anki-file "Anki")
         "* %<%Y/%m/%d %H:%M>\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Cloze\n:ANKI_DECK: Rizoma\n:END:\n** Text\n%i %?\n** Extra\n %a")

        ("j" "Journal"
         entry
         (file+olp+datetree "~/Dropbox/org/journal.org")
         "** %<%Y/%m/%d %H:%M> %i"
         :empty-lines 1)

        ("m" "Capture selected text from web"
         entry
         (file org-board-capture-file)
         "* %?%:description \n:PROPERTIES:\n:URL: %:link\n:END:\n\n%i%:body"
         :prepend t)

        ("p" "Read later: Within Emacs"
         entry
         (file+olp org-my-todo-file "Reading" "Later")
         "* TODO %a"
         :prepend t
         :immediate-finish t)

        ("t" "Add tasks" ;; Capture first, refile daily
         entry
         (file+headline org-my-todo-file "Tarefas")
         "* TODO %?\n" :prepend t)

        ("w" "Archive Web Content to Roam"
         entry
         (file org-board-capture-file)
         "* %?%:description :board:\n:PROPERTIES:\n:URL: %:link\n:END:\n%i"
         :prepend t
         :immediate-finish t)

        ))

;; Roam para Zettelkasten
(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Dropbox/org")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("s" "síntese" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c C-n C-l" . org-roam-buffer-toggle)
         ("C-c C-n C-f" . org-roam-node-find)
         ("C-c C-n C-i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i"    . completion-at-point))
  :config
  (org-roam-setup))

;;; Enable vertico
;(use-package vertico
;  :bind (:map vertico-map
;	      ("C-j" . vertico-next)
;	      ("C-k" . vertico-previous)
;	      :map minibuffer-local-map
;	      ("M-h" . backward-kill-word))
;  :custom
;  ;; Grow and shrink the Vertico minibuffer
;  (setq vertico-resize t)
;  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
;  (setq vertico-cycle t)
;  :init
;  (vertico-mode)
;  )
;
;;; Optionally use the `orderless' completion style. See
;;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;;; dispatcher. Additionally enable `partial-completion' for file path
;;; expansion. `partial-completion' is important for wildcard support.
;;; Multiple files can be opened at once with `find-file' if you enter a
;;; wildcard. You may also give the `initials' completion style a try.
;(use-package orderless
;  :init
;  ;; Configure a custom style dispatcher (see the Consult wiki)
;  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
;  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
;  (setq completion-styles '(orderless)
;        completion-category-defaults nil
;        completion-category-overrides '((file (styles partial-completion)))))
;
;;; Persist history over Emacs restarts. Vertico sorts by history position.
;(use-package savehist
;  :init
;  (savehist-mode))
;
;(use-package marginalia
;  :after vertico
;  :ensure t
;  :custom
;  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
;  :init
;  (marginalia-mode))
;
;(define-key vertico-map "?" #'minibuffer-completion-help)
;(define-key vertico-map (kbd "M-RET") #'minibuffer-force-complete-and-exit)
;(define-key vertico-map (kbd "M-TAB") #'minibuffer-complete)
;
;(setq completion-styles '(substring orderless))


;;; init.el ends here
