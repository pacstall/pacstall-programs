name="adw-gtk3"
arch=('any')
pkgver="4-9"
pkgdesc="An unofficial GTK3 port of libadwaita."
repology=("project: adw-gtk3" "repo: aur")
source=("https://github.com/lassekongo83/adw-gtk3/releases/download/v4.9/${name}v${pkgver}.tar.xz")
hash=("882f15821cba7d446af38dad904073704656b73171102f684433af9467cd1f46")
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
