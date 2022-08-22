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

;; https://github.com/bbatsov/prelude/blob/master/core/prelude-packages.el
(defvar prelude-packages
  '(
	;; init-packages
	gnu-elpa-keyring-update
	quelpa
	elpa-mirror
	auto-package-update
	;; init-base
	gcmh
	;; init-keymaps
	evil
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

(quelpa '(auto-save :fetcher github :repo "manateelazycat/auto-save"))



;;; init.el ends here
