pkgname='plasma-compact-shutdown-git'
gives='plasma-compact-shutdown'
pkgdesc='KDE applet for a compact shutdown menu'
pkgver='1.2'
pkgrel='2'
arch=('all')
breaks=("${gives}")
url='https://github.com/ChickenLegsOz/org.kde.plasma.compact-shutdown'
source=("${pkgname}::https://github.com/ChickenLegsOz/org.kde.plasma.compact-shutdown.git")
sha256sums=('SKIP')
license=('GPL-3.0-only')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
depends=('plasma-desktop>=4:6.0.0')

prepare() {
  # This is really something that should be fixed upstream, but this fixes it for now
  sed -i 's/\bqdbus\b/qdbus6/' "${srcdir}/${pkgname}/package/contents/ui/main.qml"
}

package() {
  destdir="${pkgdir}/usr/local/share/plasma/plasmoids/org.kde.plasma.compact-shutdown"
  mkdir -p "${destdir}"
  cd "${srcdir}/${pkgname}"
  cp -r "package/contents" "package/metadata.json" "${destdir}"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
}
