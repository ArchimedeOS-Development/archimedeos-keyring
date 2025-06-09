# Maintainer: Killian Prin-abeil <killian@archimedeos.org>
# Contributor: ArchimedeOS Development Team <hi@archimedeos.org>

pkgname=archimedeos-keyring
pkgver=1
pkgrel=2
pkgdesc="Clés GPG pour la vérification des paquets ArchimedeOS"
arch=('any')
url="https://github.com/ArchimedeOS-Development/archimedeos-keyring"
license=('GPL3')
depends=('pacman')
provides=('archimedeos-keyring')
install=${pkgname}.install
source=(
  'archimedeos.gpg'
  'archimedeos-trusted'
  'archimedeos-revoked'
)
sha256sums=(
  'c6aa314396784dd97f54afc47c11016f309c66ebe55b78b31693ba55bff4f326'
  'SKIP'
  'SKIP'
)
package() {
    install -Dm644 archimedeos.gpg "$pkgdir/usr/share/pacman/keyrings/archimedeos.gpg"
    install -Dm644 archimedeos-trusted "$pkgdir/usr/share/pacman/keyrings/archimedeos-trusted"
    install -Dm644 archimedeos-revoked "$pkgdir/usr/share/pacman/keyrings/archimedeos-revoked"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    
    # Installation de la documentation
    echo "ArchimedeOS Keyring v${pkgver}" > "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "===========================" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "Ce paquet contient les clés GPG utilisées pour vérifier" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "l'authenticité des paquets ArchimedeOS." >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "Pour plus d'informations, visitez : https://archimedeos.org" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
}
