pkgname="rhino-branding-git"
gives="rhino-branding"
source=("https://github.com/rhino-linux/branding.git")
arch=("all")
pkgver="0.0.1"
pkgrel="2"
pkgdesc="Rhino branding"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  for i in svg png; do
    install -Dm644 branding/"logo.${i}" -t "${pkgdir}/usr/share/branding/rhino/"
  done
  emb="${pkgdir}/usr/share/icons/desktop-base/scalable/emblems/"
  mkdir -p "${emb}"
  ln -sf "/usr/share/branding/rhino/logo.svg" "${emb}/emblem-rhino.svg"
}
