# Makefile pour ArchimedeOS Keyring
# Utilisation : make all

PREFIX ?= /usr
DESTDIR ?= /

all: archimedeos.gpg archimedeos-trusted archimedeos-revoked

archimedeos.gpg:
	gpg --export 984702CFCD8EBBC5F4C0A7B200D365D753B27ED7 > archimedeos.gpg

archimedeos-trusted:
	echo "984702CFCD8EBBC5F4C0A7B200D365D753B27ED7:4:" > archimedeos-trusted

archimedeos-revoked:
	touch archimedeos-revoked

install:
	# Installation des fichiers de clés
	install -Dm644 archimedeos.gpg "$(DESTDIR)$(PREFIX)/share/pacman/keyrings/archimedeos.gpg"
	install -Dm644 archimedeos-trusted "$(DESTDIR)$(PREFIX)/share/pacman/keyrings/archimedeos-trusted"
	install -Dm644 archimedeos-revoked "$(DESTDIR)$(PREFIX)/share/pacman/keyrings/archimedeos-revoked"
	
	# Installation de la documentation
	install -dm755 "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring"
	echo "ArchimedeOS Keyring" > "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "==================" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "Ce paquet contient les clés GPG utilisées pour vérifier" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "l'authenticité des paquets ArchimedeOS." >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"
	echo "Pour plus d'informations, visitez : https://archimedeos.org" >> "$(DESTDIR)$(PREFIX)/share/doc/archimedeos-keyring/README"

clean:
	rm -f archimedeos.gpg archimedeos-trusted archimedeos-revoked

.PHONY: all clean install 