pkgname="sarasa-gothic"
pkgver="1.0.39"
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
  "b5598f6a0e97ed6e78c4491ba3a0a59c6acc42e0a6621c17e7ef8b26c6930ec7"
  "32c932e0dbae4f6e6386964bbc2d04178707665a05ca65cf636241af13d50a53"
)

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.ttc -t "${pkgdir}/usr/share/fonts/TTC"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
