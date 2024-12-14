SHELL = /bin/sh

.PHONY: startup backup

startup:
	emacs --batch -l init.el

backup:
	emacs --batch -l init.el --eval '(setq elpamr-default-output-directory "/tmp/myelpa")' --eval '(elpamr-create-mirror-for-installed)'
