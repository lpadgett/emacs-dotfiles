;; PACKAGE SYSTEM
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; EMACS FUNCTIONALITY CONFIGS
; Enable Windmove for faster screen switching
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; MAJOR MODE AND LSP CONFIGS
(require 'eglot)
(require 'web-mode)
; Not an actual mode from Melpa, this is just jury-rigged from genehack.blog's version.
; This exists because vue-mode on Melpa is dead as of 2019 and vue-html-mode is dead as of 2018.
(define-derived-mode vue-mode web-mode "Vue"
  "A major mode derived from web-mode, for editing .vue files with LSP support.")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-hook 'vue-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs '(vue-mode "vls"))

;; THEME
;; VSCode dark theme
(custom-set-variables
 ;; Custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes '(vscode-dark-plus))
 '(custom-safe-themes
   '("79586dc4eb374231af28bbc36ba0880ed8e270249b07f814b0e6555bdcb71fab" "f6abbc03a85f371465fd07a2930754c4a41c03966abeb445a0bfaf6fe49afd04" "81c3de64d684e23455236abde277cda4b66509ef2c28f66e059aa925b8b12534" "ab0f81acbf7510140b0e592523eb12424b96da7c52bd3e0318c4456d114015a6" default))
 '(ensime-sem-high-faces
   '((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6")))
 '(package-selected-packages
   '(web-mode eglot helm-youtube emojify emms vscode-dark-plus-theme ghub magit org-mime)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

