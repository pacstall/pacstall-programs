name="tela-icon-theme"
arch=('any')
pkgver="2023-06-25"
pkgdesc="A flat, colorful icon theme"
repology=("project: tela-circle-icon-theme" "repo: aur")
url="https://github.com/vinceliuice/Tela-icon-theme/archive/refs/tags/${pkgver}.zip"
hash="98a34b458adb92641974cf79389d3931ce0d81f3b4aa0353537280d07c708bbb"
maintainer="Herisson <spaceguybox@outlook.com>"
gives="${name}"
breaks=("${name}" "${name}-git")
depends=("gtk-update-icon-cache")
build() {
  sudo mkdir -p "${pkgdir}/usr/share/${name}"
}

package() {
  for i in elementary links src; do
    sudo cp -r "${i}" "${pkgdir}/usr/share/${name}"
  done
  sudo install -Dm755 install.sh -t "${pkgdir}/usr/share/${name}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/${name}"
}

post_install() {
  ./usr/share/${name}/install.sh -a
}
