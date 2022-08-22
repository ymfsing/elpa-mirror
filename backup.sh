#!/bin/sh -e
echo "Attempting backup..."
mkdir -p ~/myelpa
${EMACS:=emacs} -nw --batch \
                --eval '(progn
                        (defvar url-show-status)
                        (let ((debug-on-error t)
                              (url-show-status nil)
                              (user-emacs-directory default-directory)
                              (user-init-file (expand-file-name "init.el"))
                              (load-path (delq default-directory load-path)))
                           (load-file user-init-file)
                           (run-hooks (quote after-init-hook))
						   (setq elpamr-default-output-directory "~/myelpa")
						   (elpamr-create-mirror-for-installed)
						))'
echo "Backup successful"
