PREFIX ?= /usr

help:
	@echo "install: install the program"
	@echo "clean:   remove the program"

install:
	sudo cp eopkg-audit $(PREFIX)/bin

clean:
	sudo $(RM) /usr/bin/eopkg-audit

.PHONY: help install clean
