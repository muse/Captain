default:
	@mkdir $${XDG_CONFIG_HOME:-~/.config}/captain/ && cd $${XDG_CONFIG_HOME:-~/.config}/captain/ && mkdir captain.d

install:
	@cp -Rp captain.d/* $${XDG_CONFIG_HOME:-~/.config}/captain/captain.d/
	@cp -p captainrc $${XDG_CONFIG_HOME:-~/.config}/captain/
	@chmod +x captain
	@sudo cp -p captain /usr/bin/

uninstall:
	@rm -fr $${XDG_CONFIG_HOME:-~/.config}/captain/
	@sudo rm /usr/bin/captain
	@echo "removed"

.PHONY: default install uninstall 