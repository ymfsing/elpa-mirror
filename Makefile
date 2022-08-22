SHELL = /bin/sh
EMACS ?= emacs

.PHONY: startup backup

startup:
	@$(EMACS) --batch -l init.el

backup:
	mkdir -p ~/myelpa && @$(EMACS) --batch -l init.el -l --eval='(setq elpamr-default-output-directory "~/myelpa")' --eval='(elpamr-create-mirror-for-installed)'
