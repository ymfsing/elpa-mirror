;;; init.el --- init file for github ci -*- coding: utf-8; lexical-binding: t; -*-


;;; Commentary:
;;
;; init file for github ci


;;; Code:


;;; Update by adding lines



;; Initialize package sources

(require 'package)

(setq package-archives '(("elpa"   . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa"  . "https://melpa.org/packages/")
                         ))

(setq package-archive-priorities '(("melpa"  . 50)
                                   ("nongnu" . 30)
                                   ("elpa"   . 10)
                                   ))

(package-initialize)
(package-refresh-contents)

(defvar mypackages
  '(
    ;;; elpa mirror
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
    yasnippet-capf
    ;; company
    cape
    corfu
    corfu-terminal
    ;;; init-edit
    vundo
    avy
    hl-todo
    speed-type
    flycheck
    ;;; init-file
    dired-git-info
    dired-rsync
    diredfl
    ;;; init-keymaps
    meow
    keyfreq
    keycast
    ;;; init-minibuffer
    vertico
    marginalia
    orderless
    consult
    consult-dir
    consult-lsp
    consult-org-roam
    consult-yasnippet
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
    ;;; init-prog
    lsp-mode
    lsp-pyright
    ;; lsp-ui
    ;; dap-mode
    ;; eglot
    citre
    format-all
    aggressive-indent
    devdocs-browser
    germanium
    applescript-mode
    dockerfile-mode
    docker-compose-mode
    ;; auctex
    elisp-demos
    sly
    suggest
    lua-mode
    markdown-mode
    markdown-toc
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
    jupyter
    ruby-mode
    ;; vterm
    ;; vterm-toggle
    web-mode
    emmet-mode
    typescript-mode
    impatient-mode
    json-mode
    yaml-mode
    nix-mode
    org-static-blog
    pdf-tools
    nov
    plantuml-mode
    osm
    ;; nntwitter
    leetcode
    ;; ement
    ;; mastodon
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

(quelpa '(compat :fetcher github :repo "emacs-compat/compat"))

(quelpa '(on :fetcher github :repo "ajgrf/on.el"))

(quelpa '(pyim-tsinghua-dict
          :fetcher github
          :repo "redguardtoo/pyim-tsinghua-dict"
          :files ("*.el" "*.pyim")))

(quelpa '(color-rg :fetcher github :repo "manateelazycat/color-rg"))

(quelpa '(fingertip :fetcher github :repo "manateelazycat/fingertip"))

(quelpa '(thing-edit :fetcher github :repo "manateelazycat/thing-edit"))

(quelpa '(auto-save :fetcher github :repo "manateelazycat/auto-save"))

(quelpa '(clue :fetcher github :repo "AmaiKinono/clue"))

;; (quelpa '(lsp-bridge
;;           :fetcher github
;;           :repo "manateelazycat/lsp-bridge"
;;           :files ("*")))

;; (quelpa '(popon :fetcher git :url "https://codeberg.org/akib/emacs-popon.git"))
;; (quelpa '(acm-terminal :fetcher github :repo "twlz0ne/acm-terminal"))

(quelpa '(org-mac-link :fetcher github :repo "ymfsing/org-mac-link"))

(quelpa '(org-noter-plus :fetcher github :repo "yuchen-lea/org-noter-plus"))

(quelpa '(org-media-note :fetcher github :repo "yuchen-lea/org-media-note"))


;; some pinned packages

;; (quelpa '(telega
;;           :fetcher github
;;           :repo "zevlg/telega.el"
;;           :branch "release-0.8.0"
;;           :files (:defaults "etc" "server" "contrib" "Makefile")))

;; (quelpa '(aggressive-indent
;;           :fetcher github
;;           :repo "Malabarba/aggressive-indent-mode"
;;           :commit "70b3f0add29faff41e480e82930a231d88ee9ca7"
;;           :files ("*.el")))


;;; init.el ends here
