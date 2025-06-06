pkgname=archimedeos-keyring
pkgver=1
pkgrel=1
pkgdesc="Clé publique GPG pour les paquets ArchimedeOS"
arch=('any')
license=('GPL')
install=${pkgname}.install
source=('archimedeos.gpg')
sha256sums=('c6aa314396784dd97f54afc47c11016f309c66ebe55b78b31693ba55bff4f326')

package() {
    install -Dm644 archimedeos.gpg "$pkgdir/usr/share/pacman/keyrings/archimedeos.gpg"
}
