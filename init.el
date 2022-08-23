;;; init.el --- init file for github ci -*- coding: utf-8; lexical-binding: t; -*-


;;; Commentary:
;;
;; init file for github ci


;;; Code:


;; Initialize package sources
(require 'cl-lib)
(require 'package)

(package-initialize)

(setq package-archives
      '(("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
		("stable-melpa"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/stable-melpa/")
        ("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
        ("gnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")
		("nongnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/nongnu/")
		))

(add-to-list 'package-pinned-packages '(telega . "stable-melpa") t)


;; https://github.com/bbatsov/prelude/blob/master/core/prelude-packages.el
(defvar prelude-packages
  '(
	;; init-packages
	gnu-elpa-keyring-update
	quelpa
	elpa-mirror
	auto-package-update
	;; init-base
	esup
	gcmh
	;; init-chinese
	pyim
	osx-dictionary
	fanyi
	;; init-completion
	yasnippet
	yasnippet-snippets
	company
	cape
	corfu
	;; init-edit
	vundo
	grab-mac-link
	evil-nerd-commenter
	avy
	hl-todo
	speed-type
	flycheck
	;; init-file
	dired-git-info
	dired-rsync
	diredfl
	;; init-keymaps
	evil
	evil-lion
	;; init-minibuffer
	vertico
	marginalia
	orderless
	consult
	consult-yasnippet
	;; init-ui
	all-the-icons
	beacon
	doom-themes
	diminish
	rainbow-delimiters
	symbol-overlay
	burly
	winum
	shackle
	;; init-vsc
	magit
	vc-msg
	diff-hl
	;; init-lang
	eglot
	lsp-mode
	lsp-pyright
	lsp-ui
	citre
	format-all
	aggressive-indent
	devdocs-browser
	dap-mode
	germanium
	;; init-lua
	lua-mode
	;; init-markdown
	markdown-mode
	markdown-toc
	;; init-org
	org
	org-contrib
	org-appear
	org-download
	iscroll
	org-transclusion
	toc-org
	ox-pandoc
	anki-editor
	habitica
	org-roam
	;; emacsql-sqlite-builtin
	org-roam-ui
	;; init-ruby
	ruby-mode
	;; init-web
	web-mode
	emmet-mode
	scss-mode
	sass-mode
	js2-mode
	js2-refactor
	typescript-mode
	add-node-modules-path
	vue-mode
	json-mode
	impatient-mode
	;; init-yaml
	yaml-mode
	;; init-blog
	org-static-blog
	;; init-browser
	reddigg
	hnreader
	;; init-chat
	telega
	;; init-draw
	plantuml-mode
	osm
	;; init-gnus
	nntwitter
	;; init-leetcode
	leetcode
	)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  "Check if all packages in `prelude-packages' are installed."
  (cl-every #'package-installed-p prelude-packages))

(defun prelude-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package prelude-packages)
    (add-to-list 'prelude-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun prelude-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'prelude-require-package packages))

(defun prelude-install-packages ()
  "Install all packages listed in `prelude-packages'."
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Prelude is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (prelude-require-packages prelude-packages)))

;; run package installation
(prelude-install-packages)


;; quelpa packages

(quelpa '(color-rg :fetcher github :repo "manateelazycat/color-rg"))

(quelpa '(awesome-pair :fetcher github :repo "manateelazycat/awesome-pair"))

(quelpa '(thing-edit :fetcher github :repo "manateelazycat/thing-edit"))

(quelpa '(auto-save :fetcher github :repo "manateelazycat/auto-save"))

(quelpa '(lsp-volar :fetcher github :repo "jadestrong/lsp-volar"))

(quelpa '(clue :fetcher github :repo "AmaiKinono/clue"))

(quelpa '(org-media-note :fetcher github :repo "yuchen-lea/org-media-note"))

(quelpa '(ement :fetcher github :repo "alphapapa/ement.el"))



;;; init.el ends here
