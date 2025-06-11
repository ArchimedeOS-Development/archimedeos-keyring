# Maintainer: Killian Prin-abeil <killian@archimedeos.org>
# Contributor: ArchimedeOS Development Team <hi@archimedeos.org>

pkgname=archimedeos-keyring
pkgver=1
pkgrel=5
pkgdesc='ArchimedeOS keyring'
arch=('any')
url='https://archimedeos.org'
license=('GPL3')
install="${pkgname}.install"
source=('Makefile'
        'archimedeos.gpg'
        'archimedeos-revoked'
        'archimedeos-trusted')
validpgpkeys=('984702CFCD8EBBC5F4C0A7B200D365D753B27ED7')  # Killian Prin-abeil
sha256sums=('4d20ef0acec7f9030881714bc21cf7ef6c50e96e673cc053b32071639b770c15'
            'c6aa314396784dd97f54afc47c11016f309c66ebe55b78b31693ba55bff4f326'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            '5549b0007475b10528930d6278cfa961b3945a7c8a015788769fb074f91183b8')

package() {
    cd "${srcdir}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
