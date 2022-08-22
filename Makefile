SHELL = /bin/sh

.PHONY: startup backup

startup:
	emacs --batch -l init.el

backup:
	mkdir -p ~/myelpa
	emacs --batch -l init.el -l --eval='(setq elpamr-default-output-directory "~/myelpa")' --eval='(elpamr-create-mirror-for-installed)'
