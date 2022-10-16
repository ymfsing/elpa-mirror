;;; init.el --- init file for github ci -*- coding: utf-8; lexical-binding: t; -*-


;;; Commentary:
;;
;; init file for github ci


;;; Code:


;; Initialize package sources
(require 'package)

(setq package-archives
      '(("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
        ("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
        ("gnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")
	    ("nongnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/nongnu/")))

(package-initialize)
(package-refresh-contents)

(defvar mypackages
  '(
    ;;; init-packages
    gnu-elpa-keyring-update
    quelpa
    elpa-mirror
    auto-package-update
    ;;; init
    ;; esup
    gcmh
    ;;; init-chinese
    pyim
    osx-dictionary
    fanyi
    ;;; init-completion
    yasnippet
    ;; yasnippet-snippets
    ;; company
    cape
    corfu
    corfu-terminal
    ;;; init-edit
    vundo
    ;; grab-mac-link
    org-mac-link
    evil-nerd-commenter
    ;; avy
    hl-todo
    speed-type
    flycheck
    ;;; init-file
    dired-git-info
    dired-rsync
    diredfl
    ;;; init-keymaps
    ;; evil
    ;; evil-lion
    meow
    keyfreq
    keycast
    ;;; init-minibuffer
    vertico
    marginalia
    orderless
    consult
    consult-flycheck
    consult-flyspell
    consult-lsp
    embark
    embark-consult
    ;;; init-ui
    posframe
    all-the-icons
    beacon
    doom-themes
    doom-modeline
    diminish
    rainbow-delimiters
    ;; symbol-overlay
    burly
    winum
    shackle
    ;;; init-vsc
    magit
    ;;; vc-msg
    blamer
    diff-hl
    ;;; init-lang
    ;; eglot
    lsp-mode
    lsp-pyright
    lsp-ui
    ;; citre
    format-all
    aggressive-indent
    devdocs-browser
    ;; dap-mode
    germanium
    ;;; init-applescript
    applescript-mode
    ;;; init-docker
    dockerfile-mode
    docker-compose-mode
    ;;; init-latex
    ;; auctex
    ;;; init-lisp
    elisp-demos
    sly
    suggest
    ;;; init-lua
    lua-mode
    ;;; init-markdown
    markdown-mode
    markdown-toc
    ;;; init-org
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
    ;; emacsql-sqlite-builtin ;; for emacs 29
    org-roam-ui
    ;;; init-ruby
    ruby-mode
    ;;; init-web
    web-mode
    emmet-mode
    typescript-mode
    impatient-mode
    ;;; init-serialization
    json-mode
    yaml-mode
    ;;; init-blog
    org-static-blog
    ;;; init-browser
    ;; reddigg
    hnreader
    ;;; init-draw
    plantuml-mode
    osm
    ;;; init-gnus
    ;; nntwitter
    ;;; init-leetcode
    leetcode
    )
  "A list of packages to ensure are installed at launch.")

;; Scans the list in mypackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      mypackages)


;; quelpa packages https://github.com/quelpa/quelpa

(setq quelpa-checkout-melpa-p nil
      quelpa-update-melpa-p nil
      quelpa-melpa-recipe-stores nil
      quelpa-git-clone-depth 1)

(quelpa '(pyim-tsinghua-dict
	      :fetcher github
	      :repo "redguardtoo/pyim-tsinghua-dict"
	      :files ("*.el" "*.pyim")))

(quelpa '(cape-yasnippet :fetcher github :repo "elken/cape-yasnippet"))

(quelpa '(color-rg :fetcher github :repo "manateelazycat/color-rg"))

(quelpa '(awesome-pair :fetcher github :repo "manateelazycat/awesome-pair"))

(quelpa '(thing-edit :fetcher github :repo "manateelazycat/thing-edit"))

(quelpa '(auto-save :fetcher github :repo "manateelazycat/auto-save"))

(quelpa '(clue :fetcher github :repo "AmaiKinono/clue"))

(quelpa '(org-media-note :fetcher github :repo "yuchen-lea/org-media-note"))

(quelpa '(telega
	      :fetcher github
	      :repo "zevlg/telega.el"
	      :branch "release-0.8.0"
	      :files (:defaults "etc" "server" "contrib" "Makefile")))

;; (quelpa '(ement :fetcher github :repo "alphapapa/ement.el"))


;; some pinned packages

;; (quelpa '(aggressive-indent
;; 	      :fetcher github
;; 	      :repo "Malabarba/aggressive-indent-mode"
;; 	      :commit "70b3f0add29faff41e480e82930a231d88ee9ca7"
;; 	      :files ("*.el")))



;;; init.el ends here
