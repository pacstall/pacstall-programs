name="adw-gtk3"
arch=('any')
pkgver="5.3"
pkgdesc="An unofficial GTK3 port of libadwaita."
repology=("project: adw-gtk3" "repo: aur")
url="https://github.com/lassekongo83/adw-gtk3/releases/download/v${pkgver}/${name}v${pkgver}.tar.xz"
hash="2e6e87935bef30936e40d07c7af4fd20754e77917be224f61c4346867196bef0"
maintainer="Herisson <spaceguybox@outlook.com>"
gives="${name}"
breaks=("${name}" "${name}-git")

build() {
  sudo mkdir -p "${pkgdir}/usr/share/themes/${name}"
  sudo mkdir -p "${pkgdir}/usr/share/themes/${name}-dark"
}

package() {
  sudo cp -r "${name}"/* "${pkgdir}/usr/share/themes/${name}/"
  sudo cp -r "${name}"-dark/* "${pkgdir}/usr/share/themes/${name}-dark/"
}
