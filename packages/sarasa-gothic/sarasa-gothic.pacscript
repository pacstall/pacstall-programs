pkgname="sarasa-gothic"
pkgver="1.0.37"
arch=("all")
url='https://github.com/be5invis/Sarasa-Gothic'
license=('OFL-1.1')
repology=("project: ${pkgname}")
replaces=("${pkgname}")
pkgdesc="CJK programming font based on Iosevka and Source Han Sans"
maintainer=("Huang Rui <vowstar@gmail.com>")
source=(
  "@${pkgname}~${pkgver}::https://github.com/be5invis/Sarasa-Gothic/releases/download/v${pkgver}/Sarasa-TTC-${pkgver}.zip"
  "LICENSE::https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/v${pkgver}/LICENSE"
)
sha256sums=(
  "608ba9cd77d20277a9eea290e2c36dc40054883c09bf35f942d89476e6041dbe"
  "32c932e0dbae4f6e6386964bbc2d04178707665a05ca65cf636241af13d50a53"
)

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.ttc -t "${pkgdir}/usr/share/fonts/TTC"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
