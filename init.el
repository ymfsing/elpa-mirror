;;; init.el --- init file for github ci -*- coding: utf-8; lexical-binding: t; -*-


;;; Commentary:
;;
;; init file for github ci


;;; Code:


;; Initialize package sources

(require 'package)

(setq package-archives '(("elpa"         . "https://elpa.gnu.org/packages/")
                         ("elpa-devel"   . "https://elpa.gnu.org/devel/")
                         ("nongnu"       . "https://elpa.nongnu.org/nongnu/")
                         ("melpa"        . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ))

(setq package-archive-priorities '(("elpa"   . 40)
                                   ("nongnu" . 30)
                                   ("melpa"  . 10)
                                   ))

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
    go-translate
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
    avy
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
    consult-dir
    consult-eglot
    embark
    embark-consult
    ;;; init-ui
    posframe
    all-the-icons
    all-the-icons-dired
    all-the-icons-ibuffer
    beacon
    doom-themes
    doom-modeline
    diminish
    rainbow-delimiters
    symbol-overlay
    burly
    winum
    shackle
    ;;; init-vsc
    magit
    ;;; vc-msg
    blamer
    diff-hl
    ;;; init-lang
    ;; lsp-mode
    ;; lsp-pyright
    ;; lsp-ui
    ;; dap-mode
    eglot
    citre
    format-all
    aggressive-indent
    devdocs-browser
    germanium
    ;;; init-applescript
    applescript-mode
    ;;; init-docker
    dockerfile-mode
    docker-compose-mode
    ;;; init-latex
    auctex
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
    emacsql-sqlite-builtin
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
    ;; nndiscourse
    ;;; init-leetcode
    leetcode
    ;;; init-chat
    ;; ement
    mastodon
    )
  "A list of packages to ensure are installed at launch.")

;; (setq package-pinned-packages '((telega . "melpa-stable")
;;                                 ))

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

(quelpa '(on :fetcher github :repo "ajgrf/on.el"))

(quelpa '(pyim-tsinghua-dict
          :fetcher github
          :repo "redguardtoo/pyim-tsinghua-dict"
          :files ("*.el" "*.pyim")))

(quelpa '(cape-yasnippet :fetcher github :repo "elken/cape-yasnippet"))

(quelpa '(color-rg :fetcher github :repo "manateelazycat/color-rg"))

;; (quelpa '(awesome-pair :fetcher github :repo "manateelazycat/awesome-pair"))

(quelpa '(thing-edit :fetcher github :repo "manateelazycat/thing-edit"))

(quelpa '(auto-save :fetcher github :repo "manateelazycat/auto-save"))

(quelpa '(sly-el-indent
          :fetcher github
          :repo "cireu/sly-el-indent"
          :files ("*.el" "lib")))

(quelpa '(clue :fetcher github :repo "AmaiKinono/clue"))

(quelpa '(org-media-note :fetcher github :repo "yuchen-lea/org-media-note"))

;; (quelpa '(nursery
;;           :fetcher github
;;           :repo "chrisbarrett/nursery"
;;           :files ("lisp/*.el")))

;; some pinned packages

(quelpa '(telega
          :fetcher github
          :repo "zevlg/telega.el"
          :branch "release-0.8.0"
          :files (:defaults "etc" "server" "contrib" "Makefile")))

;; (quelpa '(aggressive-indent
;;           :fetcher github
;;           :repo "Malabarba/aggressive-indent-mode"
;;           :commit "70b3f0add29faff41e480e82930a231d88ee9ca7"
;;           :files ("*.el")))


;;; init.el ends here
