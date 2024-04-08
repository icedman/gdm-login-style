all: build install lint

.PHONY: build install

build:
	glib-compile-schemas --strict --targetdir=schemas/ schemas

install: build
	echo "installing..."
	sudo rm -rf /usr/local/share/gnome-shell/extensions/gdm-login-style@icedman.github.com/
	sudo mkdir -p /usr/local/share/gnome-shell/extensions/gdm-login-style@icedman.github.com/
	sudo cp -R ./* /usr/local/share/gnome-shell/extensions/gdm-login-style@icedman.github.com/
	sudo -u gdm dbus-launch gsettings set org.gnome.shell enabled-extensions "['gdm-login-style@icedman.github.com']"

clean:
	rm -rf ./build
	
lint:
	eslint ./

xml-lint:
	cd ui ; \
	find . -name "*.ui" -type f -exec xmllint --output '{}' --format '{}' \;

pretty: xml-lint
	rm -rf ./build/*
	prettier --single-quote --write "**/*.js"
