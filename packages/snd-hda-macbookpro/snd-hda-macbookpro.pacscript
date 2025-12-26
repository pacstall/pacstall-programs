pkgname="snd-hda-macbookpro"
pkgver="0.1"
pkgdesc="Kernel driver for sound on Macs with Cirrus 8409 HDA chips"
arch=("any")
url='https://github.com/davidjo/snd_hda_macbookpro'
license=("GPL-2.0-only")
maintainer=("Dheeraj Reddy <dheerajre@proton.me>")

makedepends=(
  'gcc'
  'linux-headers-generic'
  'make'
  'patch'
  'wget'
)

source=('git+https://github.com/davidjo/snd_hda_macbookpro.git')
sha256sums=("SKIP")

package() {
  for file in "${srcdir}"/snd_hda_macbookpro/*; do
    install -D -m0644 -t \
      "${pkgdir}"/usr/src/snd-hda-macbookpro-"${pkgver}" \
      "${file}"
  done
  for file in "${srcdir}"/snd_hda_macbookpro/patches/*; do
    install -D -m0644 -t \
      "${pkgdir}"/usr/src/snd-hda-macbookpro-"${pkgver}"/patches \
      "${file}"
  done
  for file in "${srcdir}"/snd_hda_macbookpro/patch_cirrus/*; do
    install -D -m0644 -t \
      "${pkgdir}"/usr/src/snd-hda-macbookpro-"${pkgver}"/patch_cirrus \
      "${file}"
  done
  install -D -m0755 -t \
    "${pkgdir}"/usr/src/snd-hda-macbookpro-"${pkgver}" \
    "${srcdir}/snd_hda_macbookpro/install.cirrus.driver.sh"
}
