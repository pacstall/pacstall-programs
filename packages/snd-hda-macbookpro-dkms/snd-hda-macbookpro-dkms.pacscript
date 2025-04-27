pkgname=("snd-hda-macbookpro-dkms")
arch=('any')
pkgver=0.1
pkgver() {
    sed -nr '/PACKAGE_VERSION/s/^.*="(.*)"$/\1/p' ${srcdir}/snd_hda_macbookpro/dkms.conf
}
maintainer=("Dheeraj Reddy <dheerajre@proton.me>")
pkgdesc="Kernel driver for sound on Macs with Cirrus 8409 HDA chips"
pkgrel=1
url="https://github.com/davidjo/snd_hda_macbookpro"
license=('GPL-2.0')
depends=(
    'git'
    'gcc'
    'wget'
    'make'
    'patch'
    'linux-headers-generic'
)
makedepends=()
source=('git+https://github.com/davidjo/snd_hda_macbookpro.git')
sha256sums=()

package() {
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro | grep -v '/$') ; do 
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${pkgver} \
            ${srcdir}/snd_hda_macbookpro/"$file"
    done
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro/patches | grep -v '/$') ; do
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${pkgver}/patches \
            ${srcdir}/snd_hda_macbookpro/patches/"$file"
    done
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro/patch_cirrus | grep -v '/$') ; do
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${pkgver}/patch_cirrus \
            ${srcdir}/snd_hda_macbookpro/patch_cirrus/"$file"
    done
    install -D -m0755 -t \
        "${pkgdir}"/usr/src/snd-hda-macbookpro-${pkgver} \
        "${srcdir}/snd_hda_macbookpro/install.cirrus.driver.sh"
}
