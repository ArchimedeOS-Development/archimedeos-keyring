# Makefile for ArchimedeOS keyring
# Copyright (C) 2024 ArchimedeOS Development Team

PREFIX = /usr
DESTDIR ?= /

all:
	@echo "Building ArchimedeOS keyring..."

archimedeos.gpg:
	gpg --export 6C250CE3FE1635D3A3346BDD7F068AC1F1E5B246 > archimedeos.gpg

archimedeos-trusted:
	echo "6C250CE3FE1635D3A3346BDD7F068AC1F1E5B246:6:" > archimedeos-trusted

archimedeos-revoked:
	touch archimedeos-revoked

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 archimedeos{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	
	# Installation de la documentation
	install -dm755 "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring"
	echo "ArchimedeOS Keyring" > "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "==================" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "Ce paquet contient les clés GPG utilisées pour vérifier" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "l'authenticité des paquets ArchimedeOS." >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "Pour plus d'informations, visitez : https://archimedeos.org" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/archimedeos{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

.PHONY: all install uninstall 
