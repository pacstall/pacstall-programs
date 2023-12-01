name="tela-circle-icon-theme"
arch=('any')
pkgver="2023-06-25"
pkgdesc="A flat, colorful icon theme"
repology=("project: tela-circle-icon-theme" "repo: aur")
url="https://github.com/vinceliuice/Tela-circle-icon-theme/archive/refs/tags/${pkgver}.zip"
hash="9caaf41608a565a82f1057391d3ac7a4a1e276d9df6fc56367b202ffb8484b48"
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
  ./usr/share/"${name}"/install.sh -c -a
}
