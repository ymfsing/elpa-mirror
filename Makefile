SHELL = /bin/sh

.PHONY: startup backup

startup:
	emacs --batch -l init.el

backup:
	emacs --batch -l init.el -l --eval='(setq elpamr-default-output-directory "/home/runner/.emacs.d/myelpa")' --eval='(elpamr-create-mirror-for-installed)'
