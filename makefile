XDG_CONFIG_HOME ?= ${HOME}/.config

.env: example.env
	cp example.env .env
	${EDITOR} .env

.PHONY: run
run: .env netlify-ddns ; ./netlify-ddns

.PHONY: install-user-timer
install-user-timer: .env netlify-ddns
	@mkdir -p ${XDG_CONFIG_HOME}/netlify-ddns/
	@install -m 744 netlify-ddns ~/.local/bin/netlify-ddns
	@install -m 700 .env ${XDG_CONFIG_HOME}/netlify-ddns/rc
	@install -m 644 systemd/netlify-ddns.service ~/.config/systemd/user/netlify-ddns.service
	@install -m 644 systemd/netlify-ddns.timer ~/.config/systemd/user/netlify-ddns.timer
	@systemctl --user enable netlify-ddns.timer
	@systemctl --user start netlify-ddns.timer
	@echo "Your netlify-ddns configuration is now available at:"
	@echo "  ${XDG_CONFIG_HOME}/netlify-ddns/rc"
